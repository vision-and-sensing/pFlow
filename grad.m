%%%%%%%%%%%%%%%%%%%%%%%%%%% Gradient (forward difference)
function [fx,fy] = grad(P)
fx = P(:,[2:end 1])-P;
fy = P([2:end 1],:)-P;