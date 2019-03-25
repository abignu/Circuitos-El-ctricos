       implicit none

      complex*16 j,vos(0:110), vcs(0:110), vrs(0:110)
      real*8 pi, df, dt, nt, vot(0:110), vct(0:110), vrt(0:110)
      integer m, n, i

      pi=4.d0*atan(1.d0)
      j=(0,1.d0)
      nt=111.d0
      dt=3.d0
      df=1/(nt*dt)

      open(unit=1,file="vot.txt")
      open(unit=2,file="vct.txt")

      do i=0,110
      read(1,*) vot(i)
      enddo

      close(1)

      do i=0,110
      read(2,*) vct(i)
      enddo

      do i=0,110
      vrt(i)=vot(i)-vct(i)
      enddo

      close(2)

      do m=0,110
      vos(m)=0
      vcs(m)=0
      vrs(m)=0
      do n=0,110
      vos(m)=vos(m)+vot(n)*exp(-2*pi*j*m*df*n*dt)
      vcs(m)=vcs(m)+vct(n)*exp(-2*pi*j*m*df*n*dt)
      vrs(m)=vrs(m)+vrt(n)*exp(-2*pi*j*m*df*n*dt)
      enddo
      vos(m)=vos(m)*dt
      vcs(m)=vcs(m)*dt
      vrs(m)=vrs(m)*dt
      enddo

      open(unit=3,file="Fuente.txt")

      do i=0,110
      write(*,*) 'v0s(',df*i,')=',vos(i)
      write(3,*) 'v0s(',df*i,')=',vos(i)
      enddo

      close(3)

      open(unit=4,file="Condensador.txt")

      do i=0,110
      write(*,*) 'vcs(',df*i,')=',vcs(i)
      write(4,*) 'vcs(',df*i,')=',vcs(i)
      enddo

      close(4)

      open(unit=5,file="Resistencia.txt")

      do i=0,110
      write(*,*) 'vrs(',df*i,')=',vrs(i)
      write(4,*) 'vrs(',df*i,')=',vrs(i)
      enddo

      close(5)

      pause
      stop
      end
