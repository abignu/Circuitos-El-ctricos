
      
      complex T, z
      real f(0:300), Modulo, PI, w, PReal, PImag, N, dt, T_c, fase
      integer j, k
      PI = 3.14159265359
      N = 221.d0
      dt=3.d0
      
c     Creo un fichero donde voy a meter el m¢dulo y la w

      open(unit=2, file="Modulo_Y_w_Tc.txt")
      open(unit=3, file="Fase_Y_w_Tc.txt")
c     calculo las frecuencias en un array

      do j=0,220
         write(*,*) "iteracion ", j
         f(j) = j*(1.0/(N*dt))
         write(*,*) f(j)
      end do
      
      pause

c    Obtengo el modulo y la w y las imprimo en un fichero
 
      do k=0, 220
         write(*,*) "iteracion ", k
         PReal = 0.0
         w = f(k)*(2.0*PI*47.047)
         PImag = w
         z=CMPLX(PReal,PImag)
         T=1.0/(1.0 + z)
         T_c = ABS(T)
         Modulo = 20.0*LOG10(T_c)
         fase = - ATAN(w*47.047)
         write(2,*) w, " ; ", Modulo
         write(3,*) w," ; ",  fase
      end do

      close(2)
      close(3)
      pause
      stop
      end
