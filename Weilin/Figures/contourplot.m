clc
clear all
close all

l = 1.0e-2;
E0 = 5.0e5;
gc = 0.5;
eps = 50.0e-3;
beta = (E0*eps^2)/(gc*l);
alpha = beta + 1/l^2;

x = linspace(0,0.5,100);
z = linspace(0,0.25,200);
[X,Z] = meshgrid(x,z);
Y = 1/(1+1/(beta*l^2)) + 1/(1+beta*l^2)*exp(-sqrt(alpha)*X);
figure
contourf(X,Z,Y,'LineColor','none')

%define color map
T = [0,   0,   255  
     0, 128, 255    
     0, 255, 255    
     0, 255, 128
     0, 255, 0
     128, 255, 0    
     255, 255, 0      
     255, 128, 0
     255, 0, 0
     204, 0, 0]./255; 
cr = linspace(0,1.0,10);
maprgb = interp1(cr, T, linspace(0,1,256*2));
colormap(maprgb)
% grad=colorGradient([0 0 1],[1 0 0],256);
% colormap(grad)
caxis([0, 1.0])
%
pbaspect([2 1 1])
set(gca, 'XTick', [], 'YTick', []);
colorbar;
% print('5','-depsc')