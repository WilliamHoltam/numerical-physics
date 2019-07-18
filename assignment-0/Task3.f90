Program Task3
  IMPLICIT NONE

  REAL    ::  h,xdash_s,xdash_mid,x_mid,vdash_s,vdash_mid,v_mid,k
  INTEGER ::  i

  REAL, DIMENSION(1:1001) :: t
  REAL, DIMENSION(1:1001) :: x
  REAL, DIMENSION(1:1001) :: v
  REAL, DIMENSION(1:1001) :: error_x
  REAL, DIMENSION(1:1001) :: error_v

  !Open Files to store data

  OPEN(unit=12,file='Task3.dat')

  !k=spring_constant h=step v=velocity x=position

  h=0.01  

  !Define initial BCs

  t(1)=0
  v(1)=0
  x(1)=0.1
  k=5
  error_x(1)=x(1)-0.1*cos((5**0.5)*t(1))
  error_v(1)=v(1)+0.1*(5**0.5)*sin((5**0.5)*t(1))

  WRITE(12,'(5f9.5)') t(1),x(1),v(1),error_x(1),error_v(1)

  !Euler method for integrating two coupled ODEs simultaneously
  
  DO i=1,1000

  !Use these values at the midpoint

    vdash_s=-k*x(i)
    xdash_s=v(i)

    x_mid=x(i)+0.5*h*xdash_s
    v_mid=v(i)+0.5*h*vdash_s

    xdash_mid=v_mid
    vdash_mid=-k*x_mid

    !Input these values into the formulae below

    t(i+1)=t(i)+h
    x(i+1)=x(i)+h*xdash_mid
    v(i+1)=v(i)+h*vdash_mid

    error_x(i+1)=x(i+1)-0.1*cos((5**0.5)*t(i+1))
    error_v(i+1)=v(i+1)+0.1*(5**0.5)*sin((5**0.5)*t(i+1))

    !Write the values in the array to Task3.dat

    WRITE(12,'(5f9.5)') t(i+1),x(i+1),v(i+1),error_x(i+1),error_v(i+1)
  END DO

!Run Program
!Run gnuplot
!Write "plot "Task3.dat" using 1:2 with lines
!,0.1*cos(sqrt(5)*x)" in the terminal

END PROGRAM Task3
