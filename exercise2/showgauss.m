function showgauss(m, S)
%  showgauss(m, S)
%  m - 2D column mean vector
%  S - 2x2 covariance matrix
%
% Plots an image of a normal distribution.
% For a demo of the function try to execute the following command
%   showgauss([0; 0], eye (2))


dx=linspace(-1,1,100);
[X, Y]=meshgrid(dx,dx);
x = [X(:), Y(:)]';

G=zeros(prod(size(X)),1);
Sinv =inv(S);
Z = 1/(2*pi) * 1/sqrt(det(S));
for i=1:size(x,2)
    G(i)= Z * exp(-0.5 * (x(:,i)-m)' * Sinv * (x(:,i)-m));
end

imagesc(dx, dx, reshape(G,100,100))
%mesh(dx, dx, reshape(G,100,100))

return;


