clear all;
close all;
clc;


%plot_mixed(-1, 1, @(x) x.^2)
plot_mixed(@(x) log(x) )
plot_mixed(@(x) log(x*500)  )
%plot_mixed(-1, 1, @(x) x.^4)
plot_mixed(-.5, .5, @(x) atan(x))
%plot_mixed(-1, 1, @(x) atan(x))
%plot_mixed(-2, 2, @(x) atan(x))
%plot_mixed(-3, 3, @(x) atan(x))


function plot_mixed(f)
    a = 0.1;
    b =  1;
    ma = max(f(linspace(a,b)));
    mi = min(f(linspace(a,b)));
    figure
    axis([a b mi ma])
    grid on
    hold on
    
    x = linspace(a,b,100);
    plot(x, f(x), 'r')

    % lines plot
    for d = linspace(a,b,20)
        % plot([d d],[0 f(d)], 'r');
        yline(f(d), 'r');
    end
end




