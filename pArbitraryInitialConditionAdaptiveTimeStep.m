close all;
clear all;
clc;

f = imread('lena.jpg');
f = rgb2gray(f);
f = double(f);
% farea = length(f(:));
f = f - mean(f(:));

u=f;
figure();imagesc(u);colorbar;
n=2;
p = (2*n-1)/n;
% p = 1.1;
ut = lapi(u,p);
dt = -ut(:)'*u(:)/norm(ut(:))^2;
ite=0;
sohwIte = 0;
indic = 0;
hth = 1e-3;
Jmin = (sqrt(8)^p)*(hth^(p))*sum(sum(ones(size(f))))/p;
dtT = [];
dJ =[];
tic
firstTime = 1;
while true
    ite = ite +1;
    sohwIte = sohwIte + 1;
%     if(mod(sohwIte,1e3)==0)
%         figure(26)
%         subplot(2,2,1);imagesc(u);colorbar;
%         subplot(2,2,2);imagesc(ut);colorbar;
%         %         subplot(2,2,2);imagesc(u./f);colorbar;
%         subplot(2,2,3);plot(J);hold on;plot(J1);hold off;set(gca, 'YScale', 'log');
%         subplot(2,2,4);plot(dtT);
%         drawnow;
%     end
    
  
    if(max(abs(u(:)))<0.25e-3)
        break;
    end
        
    ut = lapi(u,p);
    lambdak = (norm(ut(:))^2)/(ut(:)'*u(:));
    dt = -1/lambdak;
    dtT(end+1) = dt;
    J(ite) = -ut(:)'*u(:)/p;
    J1(ite) = norm(u(:))^2;
    

    if(Jmin>J(ite))
        disp('Jmin>J(ite)');
        indic = indic + 1;
%         if(indic>1000)
            break;
%         end
    end
    if(J(end)<1e-40)
        break;
    end
    
    u = u + ut*dt;
end
ite
toc
%%
T =cumsum(dtT);
% Jth = (3/2*dt)^(p/(2-p))*J(1);
% Jth = ones(1,length(T))*Jth;
h = figure();plot(T,J);hold off
grid on;
h.Children.Children(1).LineWidth = 8;
set(gca, 'YScale', 'log');
grid on;
h.Children.FontSize = 100;
h.Children.XLim = [0,2000];
h.Children.YLim = [10^(-5),10^(10)];
h.Children.YTick = 10.^[-5:5:10];
h.Children.TickLabelInterpreter = 'Latex';
%%
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

