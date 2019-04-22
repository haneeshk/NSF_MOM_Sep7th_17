clear all
close all
clc

%% plot options
FigDir=fullfile(pwd,'Proposal','ProjectDescription','Figures','TensionCompressionSplit');

cmap=parula(6);

%% load data
load('stress.mat');
load('theta.mat')

%% extract stress
s22=fid1(:,2)'; % these are all rotated so that the angle theta=0 is in the direction of the crack tip
s12=-fid1(:,3)';
s11=fid1(:,4)';

theta=theta+pi/2;

%% shift theta to -pi to pi
theta=wrapToPi(theta);
[theta,ord]=sort(theta);
s11=s11(ord);
s12=s12(ord);
s22=s22(ord);

%% compute Stt
stt=s11.*sin(theta).^2-2*s12.*sin(theta).*cos(theta)+s22.*cos(theta).^2;
stt=stt/max(abs(stt));

%% Display
f1=figure;
    plot(theta,stt,'k-','LineWidth',1.5,'Color',cmap(3,:))
    hold on
    plot([min(theta),max(theta)],[0,0],'k-.','LineWidth',1,'Color',[.5,.5,.5])
    xlim([-1.05*pi,1.05*pi])
    ylim([-1.05,1.05])
    set(gca,'XTick',[-pi,-pi/2,0,pi/2,pi],'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'},...
         ...%'YTick',[-1.0,-0.5,0.0,0.5,1.0],'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'})
             'YTick',[-1.0,0.0,1.0],'YTickLabel',{'-1.0','0.0','1.0'})
    pbaspect([.75 1 1])
    box off
    publish_fig(1,fullfile(FigDir,'STT_fig'),f1,'','','',2.6,7)