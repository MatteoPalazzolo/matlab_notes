clear all;
close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INCREASING FUNCTION
% SCALING ONLY
% x^i -> i is the strenght
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

displayDistribution(1);
displayDistribution(2);
displayDistribution(3);

displayDistributionGraph(1);
displayDistributionGraph(2);
displayDistributionGraph(3);


%%%%%%%%% FUNCTIONS %%%%%%%%%

function displayDistribution(i)
    p = 2*i+1;
    dots_n = 500;

    % normal random [0 1]
    r = rand(1,dots_n);
    %figure; plot(1:1:dots_n, r);

    % biased random [-1 1]
    rn = (2.*r - 1).^p;      
    %figure; plot(1:1:dots_n, rn);
    
    % biased random [0 1]
    rn = rn.*.5 + .5;
    %figure; plot(1:1:dots_n, rn);

    bbar = .6;
    abar = .4;
    upper  = size(rn(rn <= abar),2);
    center = size(rn(rn > abar & rn < bbar),2);
    lower  = size(rn(rn >= bbar),2);
    txt = sprintf("UPPER = %d\n CENTER = %d\n LOWER = %d", upper, center, lower);

    figure("Name",sprintf("Distribution with i = %d", i))
    subtitle(txt)
    hold on
    yline(bbar, 'r');
    yline(abar, 'r');
    plot(1:dots_n, r ,'ro');
    plot(1:dots_n, rn,'go');
end

function displayDistributionGraph(i)
    a = -1;
    b = 1;
    p = 2*i+1;
    f = @(x) x.^p;
    
    figure("Name",sprintf("Graph with i = %d", i))
    axis([a b f(a) f(b)])
    hold on

    % curve plot
    x = linspace(a,b,100);
    plot(x, f(x));

    % lines plot
    for d = linspace(a,b,20)
        plot([d d],[0 f(d)], 'r');
        yline(f(d), 'r');
    end
end



