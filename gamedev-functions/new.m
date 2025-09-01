clear all;
close all;
clc;

heat = 8;
deltaTime = 1/60;

x = linspace(0,5,100);
f = @(x) (5 - x) * heat * deltaTime * 60;

figure
hold on
plot(x, f(x))
plot([0 5], 100*[1 1])
plot([0 5], 0*[1 1])
plot([0 5], -100*[1 1])