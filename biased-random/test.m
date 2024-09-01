clear all;
close all;
clc;

plottt(-pi/2+0.1, pi/2-0.1, @(x) x.^3)
plottt(-pi/2+0.1, pi/2-0.1, @(x) x.^5)
plottt(-pi/2+0.1, pi/2-0.1, @(x) x.^7)

function plottt(a,b,f)
    figure
    axis([a b f(a) f(b)])
    grid on
    hold on
    
    x = linspace(a,b,100);
    plot(x, f(x), 'r')
end