clear all
%close all
clc

%% plot options
%FigDir=fullfile(pwd,'Proposal','ProjectDescription','Figures','TensionCompressionSplit','Kaushik_fig_data');

cmap=parula(6);
r = 0.02;
%% load data
load('stress.mat');
load('theta.mat');
s1 = load('stress_split.mat');
stress_split = struct2array(s1);
s2 = load('theta_split.mat');
theta_split = struct2array(s2);

%% extract stress
s22=fid1(:,2)'; % these are all rotated so that the angle theta=0 is in the direction of the crack tip
s12=-fid1(:,3)';
s11=fid1(:,4)';

s22_s=stress_split(:,2)'; % these are all rotated so that the angle theta=0 is in the direction of the crack tip
s12_s=-stress_split(:,3)';
s11_s=stress_split(:,4)';

theta=theta+pi/2;
theta_split=theta_split+pi/2;
%% shift theta to -pi to pi
theta=wrapToPi(theta);
theta_split=wrapToPi(theta_split);
[theta,ord1]=sort(theta);
s11=s11(ord1);
s12=s12(ord1);
s22=s22(ord1);
[theta_split,ord2]=sort(theta_split);
s11_s=s11_s(ord2);
s12_s=s12_s(ord2);
s22_s=s22_s(ord2);

%% compute Stt
stt=s11.*sin(theta).^2-2*s12.*sin(theta).*cos(theta)+s22.*cos(theta).^2;
stt=stt/max(abs(stt));
stt_s=s11_s.*sin(theta_split).^2-2*s12_s.*sin(theta_split).*cos(theta_split)+s22_s.*cos(theta_split).^2;
stt_s=stt_s/max(abs(stt_s));
stt_n = (-3/(4*sqrt(2)*pi*r)).*csc(-theta./2).*sin(-theta).^2;
stt_n=stt_n/max(abs(stt_n));

%% Display
f1=figure;
    plot(theta,stt,'k-','LineWidth',1.5,'Color',cmap(5,:))
    hold on
    plot(theta,stt_n,'k-','LineWidth',1.5,'Color',cmap(2,:))
    plot([min(theta),max(theta)],[0,0],'k-.','LineWidth',1,'Color',[.5,.5,.5])
    xlim([-1.05*pi,1.05*pi])
    ylim([-1.05,1.05])
    set(gca,'XTick',[-pi,-pi/2,0,pi/2,pi],'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'},...
         ...%'YTick',[-1.0,-0.5,0.0,0.5,1.0],'YTickLabel',{'-1.0','-0.5','0.0','0.5','1.0'})
             'YTick',[-1.0,0.0,1.0],'YTickLabel',{'-1.0','0.0','1.0'})
    pbaspect([1.25 1 1])
    box off
    hold on
 publish_fig(1,fullfile('STT_fig'),f1,'','','',1.65,7)