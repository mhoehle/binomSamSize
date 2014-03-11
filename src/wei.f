C     --------------------------------------------------------------
C     --------------------------------------------------------------
C     This program is to find the minimum sample size nn so that
C     the minimum coverage probability of the confidence interval
C     for pi, based on [c(x) +- d] of (3.1) and expanded to the full length
C     of 2d, is no less than 1-alpha.
C     The inputs are alpha, cr, rd, and  rlambda.
C     --------------------------------------------------------------
C     Variables:
C
C     alpha: nominal coverage probability
C     rd:    the half width of the confidence interval
C     rlambda: lambda parameter as defined in the article
C     rnstar:   sample size using the Liu & Bailey (2002) method (double)
C     rn0:    sample size when using the normal approximation (double)
C     rcp: coverage probability
C     -------------------------------------------------------------
C     -------------------------------------------------------------

      subroutine liusamsize(alpha, rd, rlmbda, rnstar, rn0, rcp)
c  By default variables beginning with I, J, K, L, M, N are INTEGER type
c  causes the default real type to be double precision REAL*8
c      -pedantic has a problem with real*8, using double precision instead
c      implicit real*8 (a-h,p-z)
c      IMPLICIT REAL(KIND=DPKIND)(a-h,p-z)
      implicit double precision (a-h,p-z)
c hoehle: changed dimension to begin at -1 instead of 0
      dimension  rlow(-1:17000), rupp(-1:17000) 
      rc = 1.0

10    if( rc .lt. 0.0 )goto 100
      calpha = 1.0 - alpha
C hoehle
      rc = fqnorm(DBLE(1.0-alpha/2),DBLE(0),DBLE(1),1,0)

20    if( rd .lt. 0.0 )goto 10

      rn0 = 0.25 * rc * rc / (rd*rd)

25    if( rlmbda .lt. 0.0 )goto 20

      nn = int( 0.85 * rn0 )
30    nn = nn + 1
      if( nn .ge. 17000 )then
C        write(*,*) alpha, rc, rd, rn0, rlmbda, 'abnormal'
        goto 25
      endif
      rn = real(nn)

      index = -1
      do 40  k=0, nn
        rk = real(k)
        center = rk/rn + rlmbda*rc*rc*(0.5-rk/rn) / (rn+rc*rc)
        rl = center - rd
        if( rl .le. 0.0 )then
          index = index + 1
        endif
c     changed use of max/min to get around pedantic to amax1/amin1
        rlow(k) = amax1(0.0,  amin1(1.0-2.0*rd, rl))
        rupp(k) = amin1(1.0,  amax1(2.0*rd, center+rd))
40    continue
      if( index .le. -1 )goto 30

C     Cov prob at 0+ is 1.0
C     ---------------------
      cov = 1.0

C     The minimum of cov prob at the lower limits in (0, 0.5001)
C     ===========================================================
      i = index
50    i = i + 1
      if( rlow(i) .ge. 0.5001 )goto 60
      i0 = i

C     Determine the value of j0
C     -------------------------
      j = i0
55    j = j - 1
      if( rupp(j).ge.rlow(i0) .and. j.ge.0 )goto 55
      j0 = j + 1

C     Find R(n, rlow(i0)-)
C     --------------------
      ifail = 0
      rp = rlow(i0)
      nk1 = i0 - 1
C hoehle     call G01BJF(nn,rp,nk1,plek1,pgtk1,peqk1,ifail)
      plek1 = fpbinom(DBLE(nk1),DBLE(nn),DBLE(rp), 1, 0)


      if( j0 .eq. 0 )then
        rr = plek1
        goto 57
      else
        ifail = 0
        rp = rlow(i0)
        nk2 = j0 - 1 
C hoehle       call G01BJF(nn,rp,nk2,plek2,pgtk2,peqk2,ifail)
        plek2 = fpbinom(DBLE(nk2),DBLE(nn),DBLE(rp), 1, 0)
        rr = plek1 - plek2
      endif
  
57    if( rr .lt. cov )then
        cov = rr
      endif
      
      if( cov .lt. calpha )then
        goto 30
      else
        goto 50
      endif

C     The minimum of cov prob at the upper limits in (0, 0.5001)
C     ===========================================================
60    j = -1 
70    j = j + 1
      if( rupp(j) .ge. 0.5001 )goto 80
      j0 = j

C     Determine the value of i0
C     --------------------------
      i = j0
75    i = i + 1
      if( rlow(i).le.rupp(j0) .and. i.le.nn )goto 75
      i0 = i - 1

C     Find R(n, rupp(j0)+)
C     --------------------
      ifail = 0
      rp = rupp(j0)
      nk1 = i0
C hoehle      call G01BJF(nn,rp,nk1,plek1,pgtk1,peqk1,ifail)
      plek1 = fpbinom(DBLE(nk1),DBLE(nn),DBLE(rp), 1, 0)

      ifail = 0
      rp = rupp(j0)
      nk2 = j0 
C hoehle    call G01BJF(nn,rp,nk2,plek2,pgtk2,peqk2,ifail)
      plek2 = fpbinom(DBLE(nk2),DBLE(nn),DBLE(rp), 1, 0)

      rr = plek1 - plek2
      if( rr .lt. cov )then
        cov = rr
      endif

      if( cov .lt. calpha )then
        goto 30
      else
        goto 70
      endif

80    if( cov .lt. calpha)goto 30

C      write(*,89) 'alpha','Z','halfWi','n_0','Lambda','CovPro','SamSiz'
C      write(*, 90) alpha, rc, rd, rn0, rlmbda, cov, nn

C Modify return parameters
      rnstar = nn
      rn0 = rn0
      rcp = cov

      return
C      goto 25

C89    format( 1A6, 1A3,1A8,1A5,1A7,1A8,1A8 )
C90    format( 3F7.3, 2F10.2, 1F9.5, 1I10 )
100   END
