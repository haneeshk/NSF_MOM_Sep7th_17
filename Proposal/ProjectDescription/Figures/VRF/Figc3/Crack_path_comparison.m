clc
clear all
close all

AR=[1.5,1,1];
AR=AR/norm(AR);

fname=fullfile(pwd,'theta_fig');

load('x1.mat')
load('theta1.mat')
load('x2.mat')
load('theta2.mat')


f = figure;
    hold on
    p1=plot(x2,theta2,'k-','LineWidth',1.0,'Color',[.5,.5,.5]);
    p2=plot(x1,theta1,'k.','MarkerSize',6,'Color',[1,0,0]);
    set(gca,'XTick',[0,1,2],'XTickLabel',{'0','1','2'},...
        'YTick',[60,75,90],'YTickLabel',{'60','75','90'})
    pbaspect(AR)
    legend([p1,p2],'PFT','experiment','Location','northeast')
    legend('boxoff')
    publish_fig(1,fname,f,'','','',2.25,8)
    
    close all
    