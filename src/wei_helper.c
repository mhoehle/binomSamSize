#include <R.h>
#include <Rmath.h>
#include <stdio.h>

double F77_SUB(fpbinom)(double *q, double *size, double *prob, int *lowertail, int *logp ) { 
  /*  All debug
  printf("q = %e, size = %e, prob = %e\n",*q,*size,*prob);
  printf("lowertail = %d, log.p = %d\n",*lowertail, *logp);
  double res  = pbinom(*q,*size,*prob, *lowertail, *logp);
  printf("res = %e\n",res);*/
  return(pbinom(*q,*size,*prob, *lowertail, *logp));
}

double F77_SUB(fqnorm)(double *p, double *mean, double *sd, int *lowertail, int *logp ) { 
  /* Debug purpose
  printf("p = %e, mean = %e, sd = %d\n",*p,*mean,*sd);
  printf("lowertail = %d, log.p = %d\n",*lowertail, *logp);
  double res = qnorm(*p, *mean, *sd, *lowertail, *logp);
  printf("res = %e\n",res);
  */
  return(qnorm(*p, *mean, *sd, *lowertail, *logp));
} 

//R CMD SHLIB -o wei.so wei.f wei_helper.c
//nm wei.so


