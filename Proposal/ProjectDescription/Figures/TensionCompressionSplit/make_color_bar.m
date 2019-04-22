clear all
close all
clc

FigDir=fullfile(pwd,'Proposal','ProjectDescription','Figures','Tension Compression Split');
n=100;

x=linspace(0,1,n);
y=linspace(0,.5,n);
[xx,yy]=meshgrid(x,y);
zz=xx;

f1=figure;
    colormap(jet)
    contourf(yy,xx,zz,256,'LineColor','none','LineStyle','none')
    axis equal
    axis off
    publish_fig(1,'colorbar',f1,'','','',0.5,7)
