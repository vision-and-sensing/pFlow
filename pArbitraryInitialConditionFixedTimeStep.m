close all;
clear all;
clc;

f = imread('lena.jpg');
f = rgb2gray(f);
f = double(f);
farea = length(f(:));
f = f - mean(f(:));

u=f;
figure();imagesc(u);colorbar;

n=2;
p = (2*n-1)/n;
hth = 1e-3;
lambdamax = (sqrt(8)^p)*hth^(p-2);
% ft = lapi(f,p);
% Jf = -ft(:)'*f(:)/p; 
 C = 1;
% dt = (C/Jf)^((2-p)/p);
% dt = dt/lambdamax;
dt = 1/lambdamax;

Jmin = (sqrt(8)^p)*(hth^(p))*sum(sum(ones(size(f))))/p;

ite=0;
sohwIte = 0;
indic = 0;

dtT = [];
dJ =[];
tic
firstTime = 1;
ut = lapi(u,p);
J = -ut(:)'*u(:)/p;
J1 = norm(u(:))^2;
R = J*p/norm(u(:))^2;
while true
    ite = ite +1;
%     sohwIte = sohwIte + 1;
%     if(mod(sohwIte,1e5)==0)
%         figure(26)
%         subplot(2,2,1);imagesc(u);colorbar;
%         subplot(2,2,2);imagesc(ut);colorbar;
%         %         subplot(2,2,2);imagesc(u./f);colorbar;
%         subplot(2,2,3);plot(J);hold on;plot(J1);hold off;set(gca, 'YScale', 'log');
% %         subplot(2,2,4);plot(R);
%         drawnow;
%     end
    
%     if(max(abs(u(:)))<hth)
%         break;
%     end
% %     
%     maxAbsU(ite) = max(abs(u(:)));
        
    ut = lapi(u,p);
    
%     lambdak = (norm(ut(:))^2)/(ut(:)'*u(:));
%     dtT(end+1) = -2/lambdak/p;
%     if(dt> -2/lambdak/p)
%         if(firstTime)
%             firstTime = 0;
% %             break;
%         end
%     end
%     dtT(end+1) = dt;
    J(ite) = -ut(:)'*u(:)/p;
%     R(end+1) = J(ite)*p/norm(u(:))^2;
    if(Jmin>J(ite))
        disp('Jmin>J(ite)');
        indic = indic + 1;
%         if(indic>1000)
            break;
%         end
    end
%     J1(ite) = norm(u(:))^2;
    

%     if(J(end)<1e-40)
%         break;
%     end
    
    u = u + ut*dt;
end
ite
toc
%%
T =dt*[0:1:length(J)-1];
% Jth = (3/2*dt)^(p/(2-p))*J(1);
Jth = ones(1,2000)*Jmin;
h = figure();plot(T,J);hold on;plot([1:1:2000],Jth,'--');hold off;
grid on;
h.Children.Children(1).LineWidth = 8;
h.Children.Children(2).LineWidth = 8;
set(gca, 'YScale', 'log');
grid on;
h.Children.FontSize = 100;
h.Children.XLim = [0,2000];
h.Children.YLim = [10^(-1),10^7];
h.Children.YTick = 10.^[-0:2:7];
h.Children.TickLabelInterpreter = 'Latex';

h = (2/((sqrt(8)^p)*dt))^(1/(p-2))
(sqrt(8)^p)*(h^p)*sum(sum(ones(size(f))))/p
% h = figure();plot(T,maxAbsU);hold on;plot(T,hth*ones(1,length(T)),'--');hold off;
% grid on;
% h.Children.Children(1).LineWidth = 8;
% h.Children.Children(2).LineWidth = 8;
% set(gca, 'YScale', 'log');
% grid on;
% h.Children.FontSize = 60;
% h.Children.XLim = [0,T(end)];
% h.Children.YLim = [10^-2,10^3];
% h.Children.YTick = 10.^[-4:1:3];
% h.Children.TickLabelInterpreter = 'Latex';
% 
% h = figure();plot(T(2:end),(dJ(2:end)));hold on;plot(T,maxdeltaJ*ones(1,length(T)),'--');hold off;
% grid on;
% h.Children.Children(1).LineWidth = 8;
% h.Children.Children(2).LineWidth = 8;
% % set(gca, 'YScale', 'log');
% grid on;
% h.Children.FontSize = 60;
% h.Children.XLim = [0,T(end)];
% % h.Children.YLim = [-7000,5];
% % h.Children.YTick = 10.^[-4:1:1];
% h.Children.TickLabelInterpreter = 'Latex';
% 
% h = figure();imagesc(u);colorbar;
% 
% 
% 
