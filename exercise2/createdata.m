function [t,X]=createdata(N, beta)
% [t,X]=createdata(N, beta)
% 
%  N    - Number of data points
%  beta - Noise precision
%
% Creates a synthetic sinusoidal data set as described in Appendix A of Bishop.
% Used in Bishop fig. 3.8 and 3.9.


X=rand(N,1);
t = sin(2*pi*X) + sqrt(1/beta)*randn(N,1);
