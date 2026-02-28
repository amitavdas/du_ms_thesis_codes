       PROGRAM DIFFUSION_COEFFICIENT_USING_LINEAR_TRAJECTORY
         IMPLICIT NONE

         INTEGER(8), PARAMETER :: N=499
         INTEGER(8) :: i, X_i
         REAL(8) :: a(N), b(N), c(N), d(N), e(N), q(N), vq(N), F(N), W(N), v(N), tt(N)
         REAL(8) :: RES, Y, Z, X, sh, H, R, S
         REAL(8) :: TIN, T, RC1, RC2, Z1, Z2, DEN1, DEN2, C1, MAXQ, DRIN, MAXR, ISTEP
         REAL(8) :: DELTA, ERR, AA1, BB1, AA2, BB2, AX1, AX2, DELRO
         REAL(8) :: RR(N),  AA(N)
         REAL(8) :: JUNK,  SIGMA,  GSIGMA, GSIGMA_CS,  AMASS, ETA
         REAL(8) :: Xi_H, Xi_H_CS, Xi_H_scaled, Xi_H_CS_scaled
         REAL(8) :: Xi_S, Xi_SH, Xi_S_scaled, Xi_SH_scaled, D_H, D_H_CS, D_LT, D_LT_CS
         REAL(8) :: SIMPSONS_ONE_THIRD
         OPEN(10, FILE='MONTO.DAT', STATUS='OLD',  ACTION='READ')
         OPEN(11, FILE='aq.dat', STATUS='OLD',  ACTION='READ')
         OPEN(12, FILE='AMITAV.DAT', STATUS='OLD',  ACTION='READ')
         OPEN(13, FILE='FFACTOR.DAT', STATUS='OLD',  ACTION='READ')
         OPEN(14, FILE='grhs.dat', STATUS='OLD',  ACTION='READ')
         OPEN(15, FILE='al.dat', STATUS='OLD',  ACTION='READ')
         OPEN(21, FILE='vv.DAT', STATUS='UNKNOWN',  ACTION='WRITE')
         OPEN(22, FILE='vvv.DAT', STATUS='UNKNOWN',  ACTION='WRITE')
         READ(10, *) TIN, T
         READ(10, *) RC1, RC2
         READ(10, *) Z1, Z2
         READ(10, *) DEN1, DEN2, C1
         READ(10, *) MAXQ, DRIN
         READ(10, *) MAXR
         READ(10, *) ISTEP
         READ(10, *) DELTA, ERR
         READ(10, *) AA1, BB1
         READ(10, *) AA2, BB2
         READ(10, *) AX1, AX2
         READ(10, *) DELRO
         CLOSE(10)
       
         READ(11,*) ( a(i), b(i), c(i), d(i), i=1, N )
         CLOSE(11)

         READ(12,*) AMASS, X_i
         CLOSE(12)
         
         READ(15, *) JUNK, SIGMA
         CLOSE(15)

         PRINT 37, 'SIGMA: ', SIGMA
         PRINT 37, 'STDAM: ', AMASS

         GSIGMA = 0

         DO WHILE(GSIGMA .le. 0)
            READ(14,229) GSIGMA
         END DO

229      FORMAT(26X, F21.16)

         PRINT 37, 'G(SIGMA): ', GSIGMA

         CLOSE(14)

         ! Calculation for hard sphere friction coefficients
         RES = (3.1416*T*1.38*AMASS*1.661)**0.5
         !      A. Meyer et al 1980
         ETA = (3.1416*(SIGMA ** 3)*DEN1)/6
         !      GSIGMA_CS = (1+ETA+(ETA ** 2)-(ETA ** 3))/((1-ETA)**3)
         GSIGMA_CS = (1-(ETA / 2)) / ((1-ETA) ** 3)

         PRINT 37, 'G(SIGMA) CS: ', GSIGMA_CS

         Xi_H = (8/3)*DEN1*(SIGMA ** 2)*RES*GSIGMA
         Xi_H_CS = (8/3)*DEN1*(SIGMA ** 2)*RES*GSIGMA_CS

         Xi_H_scaled = Xi_H/100
         Xi_H_CS_scaled = Xi_H_CS/100
      
         PRINT 37, 'Xi_H: ', Xi_H_scaled
         PRINT 37, 'Xi_H_CS: ', Xi_H_CS_scaled


         READ(13,120) ( q(i),vq(i), i=1, N )
120      FORMAT(5X, E13.6, 4X, E13.6)
         CLOSE(13)

         F(:)=a(:)*a(:)*a(:)*d(:)*vq(:)
       
         DO  i=1,N
            WRITE(21,*) a(i), F(i)
         END DO
         CLOSE(21)
      
         H = a(3)-a(2)
         Y= 0.01*((3.1416*AMASS*1.661)/((1.38*T)))**0.5
         Z=-(DEN1)/(12*3.1416*3.1416)
         X=Y*Z

         RES = SIMPSONS_ONE_THIRD(N, H, F, X_i)

       
         Xi_S = X*RES*4.359*1E-5

         RR(:)=a(:)*SIGMA*cos(a(:)*SIGMA)
         AA(:)= sin(a(:)*SIGMA)
         W(:)=vq(:)*(RR(:)-AA(:))
       
         DO  i=1,N
            WRITE(22,*) a(i), W(i), RR(i), AA(i)
         END DO
       
         CLOSE(22)

         R=0.01*((AMASS*1.661)/((3.1416*1.38*T)))**0.5
         S=-(DEN1*GSIGMA)/3

         sh = SIMPSONS_ONE_THIRD(N, H, W, X_i)
         Xi_SH = R*S*sh*4.359*1E-5

         Xi_S_scaled = Xi_S*1E10
         Xi_SH_scaled = Xi_SH*1E10

         PRINT 37, 'Xi_S: ', Xi_S_scaled
         PRINT 37, 'Xi_SH: ', Xi_SH_scaled
         PRINT 37, 'Net Xi: ', (Xi_H_scaled+Xi_S_scaled+Xi_SH_scaled)

         D_H_CS = (0.138*T)/(Xi_H_CS_scaled)
         D_H = (0.138*T)/(Xi_H_scaled)
         D_LT = (0.138*T)/(Xi_H_scaled+Xi_S_scaled+Xi_SH_scaled)
         D_LT_CS = (0.138*T)/(Xi_H_CS_scaled+Xi_S_scaled+Xi_SH_scaled)

         PRINT 37, 'D_H: ', D_H
         PRINT 37, 'D_H_CS: ', D_H_CS
         PRINT 37, 'D_LT: ', D_LT
         PRINT 37, 'D_LT_CS: ', D_LT_CS

37       FORMAT (A15, F8.2)
         ! format for displaying results
         ! used width 8 where 1 for decimal point and 2 for mantissa
         ! and 1 for sign of charactersitic 4 for the charactersitic itself
         ! 1+4+1+2 = 8
         ! largest negative number supported is -9999.99
         ! largest positive number supported is 99999.99
       
         STOP

       END PROGRAM DIFFUSION_COEFFICIENT_USING_LINEAR_TRAJECTORY


       REAL(8) FUNCTION SIMPSONS_ONE_THIRD(X_f, H, F, X_i)
         IMPLICIT NONE
         REAL(8) :: H, SUM1, SUM2
         INTEGER(8) :: X_f, I, J, X_i
         REAL(8), DIMENSION(X_f) :: F
         SUM1=0.0
         SUM2=0.0
      
         DO I=X_i+1, X_f-1, 2
            SUM1 = SUM1 + F(I)
         END DO
         DO J=X_i+2, X_f-2, 2
            SUM2 = SUM2 + F(J)
         END DO
         ! SIMPSONS_ONE_THIRD = (1.0/3.0)*H*(F(X_i) + 4.0*SUM(F(X_i-1:N-1)) + 2.0*SUM(F(X_i-2:N-2)) + F(N))
         SIMPSONS_ONE_THIRD = (1.0/3.0)*H*(F(X_i) + 4.0*SUM1 + 2.0*SUM2 + F(X_f))
       END FUNCTION SIMPSONS_ONE_THIRD
