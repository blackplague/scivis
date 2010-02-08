f = function(x,a.0=-0.3,a.1=0.5) { a.0 + a.1 * x }

plotlinesamples = function(W, ...) {
#  plotlinesamples(W)
#  W - 2xN matrix where each column is a line parameter vector
#
# Plots N line samples given by the parameters in W.

plot(x=c(-1,1),y=c(-1,1),col="white",xlab="x",ylab="y", ...) # dummy plot

for(i in 1:nrow(W)) {
   curve(f(x,a.0=W[i,1],a.1=W[i,2]),add=T,col="red")
}
}
