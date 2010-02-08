require(fields)
# In order to make the plots, you need to have the R-package fields installed on your computer. If you do not have it, install it by typing install.packages("fields")
library(fields) # include the package

# Gaussian 2d probability density function:
dnorm2 = function(q1,q2,means=matrix(c(0,0),ncol=1),var=matrix(c(1,0,0,1),nrow=2)) {
  q = matrix(c(q1,q2),ncol=1)
  return((1/((2*pi)) * (1/((sqrt(det(var))))) * exp(-0.5 * t((q - means)) %*% solve(var) %*% (q-means))))
}

# Plots an image of a normal distribution. For a demo, type showgauss()

showgauss = function(m = matrix(c(0,0),ncol=1), S = diag(2), ...) {
# m - 2D vector (mean) Default is [0, 0]
# S - 2x2 matrix (cov) Default is I(2)

x.bins = seq(-1,1,0.02)
y.bins = seq(-1,1,0.02)
img.mat = matrix(0,ncol=length(x.bins),nrow=length(y.bins))
for(a in 1:length(x.bins)) {
  for(b in 1:length(y.bins)) {
    img.mat[a,b] = dnorm2(x.bins[a],y.bins[b],means = m,var = S)
  }
}
image.plot(x.bins, y.bins, img.mat, xlab="w0", ylab="w1", ...)
}
