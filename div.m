%%%%%%%%%%%%%%%%%%%%%%%%%%% Divergence (backward difference), adjoint BC
function fd = div(Px,Py)

fx = Px -[Px(:,end) Px(:,1:end-1)];
 
fy = Py - [Py(end,:);Py(1:end-1,:)];

fd = fx+fy;


