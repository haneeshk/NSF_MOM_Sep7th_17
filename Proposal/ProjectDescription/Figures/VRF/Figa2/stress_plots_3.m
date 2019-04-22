clc
clear all
close all

fname=fullfile(pwd,'sigma_fig');

cmap=[[0,0,0];...
        [.9,.7,.4];...
        [1.0,0.60,0.78];...
        [0.12,0.75,0.86];...
        [0.70,0.78,1.0]];
        
load('Pitot.mat');
load('sig_cr_n.mat')
marker='os*vd'; %These are the markers
f2= figure;
    hold on
    x = linspace(0,.0012,2);
    plot(x,x,'color',[0.5 0.5 0.5],'Linewidth',0.75)
    for i = 1:5
        p(i)=plot(Pitot(i,:),sig_cr_n(i,:),marker(i),'MarkerSize',2,'MarkerFaceColor',cmap(i,:),'MarkerEdgeColor',cmap(i,:));
    end
    set(gca,'XTick',[0,.4,.8,1.2]*1e-3,'YTick',[0,.4,.8,1.2]*1e-3)
    pbaspect([1.35,1,1]);
    legend(p ,'','','','','','Location',[0.25, 0.6, .25, .25]);
    legend('boxoff')
    publish_fig(1,fname,f2,'','','',2.5,8)