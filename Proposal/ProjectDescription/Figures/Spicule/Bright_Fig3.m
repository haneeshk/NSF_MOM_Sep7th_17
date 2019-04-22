clear all
close all
clc

AR=[2,1,1];
AR=AR/norm(AR);

load('Bright_data.mat');
d=Data002(:,1);
P=Data002(:,2);

f1=figure;
    plot(d,P,'k-','LineWidth',1)
    xlim([0 34])
    ylim([0 22])
    set(gca, 'YTick',0:5:20,'XTick',0:5:30)
    pbaspect(AR)
    box off
publish_fig(1,'BrightFig',f1,'','','',2.1,8)

close all
