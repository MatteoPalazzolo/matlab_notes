clear all;
close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INCREASING FUNCTION
% SCALING ONLY
% dom=[-pi/2*i pi/2*i] -> i in (0 1) is the strenght
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

displayDistribution(.3);
displayDistribution(.8);
displayDistribution(.99);

displayDistributionGraph(.3);
displayDistributionGraph(.8);
displayDistributionGraph(.99);


%%%%%%%%% FUNCTIONS %%%%%%%%%

function displayDistribution(i)
    dots_n = 500;
    v = pi/2 * i;
    f = @(x) tan(x);

    % normal random [0 1]
    r = rand(1,dots_n);

    % random in [-i i]
    rb = 2*v .* r - v;

    % biased random [0 1]
    rn = (f(rb)./2 + f(v)/2) ./ f(v);

    figure("Name",sprintf("Distribution with i = %d", i))
    hold on
    plot(1:dots_n, r ,'ro');
    plot(1:dots_n, rn,'go');
end

function displayDistributionGraph(i)
    v = pi/2 * i;

    a = -v;
    b = v;
    f = @(x) tan(x);
    
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



