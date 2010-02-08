function plotlinesamples(W)
%  plotlinesamples(W)
%  W - 2xN matrix where each column is a line parameter vector
%
% Plots N line samples given by the parameters in W.

x=linspace(-1,1,100);
for j=1:size(W,2)
    plot(x,W(1,j) + W(2,j)*x,'r')
    hold on;
end
hold off;

