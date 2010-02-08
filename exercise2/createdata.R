createdata = function(N, beta) {
#  N    - Number of data points
#  beta - Noise precision
#
# Creates a synthetic sinusoidal data set as described in Appendix A of Bishop.
# Used in Bishop fig. 3.8 and 3.9.

  x = runif(N,min=0,max=1)
  t = sin(2*pi*x) + rnorm(N,mean=0,sd=sqrt(1/beta))
  return(data.frame(X=x,T=t))
}
