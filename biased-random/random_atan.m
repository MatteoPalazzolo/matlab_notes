clear all;
close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INCREASING FUNCTION
% SCALING ONLY
% dom=[-i i] -> i is the strenght
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

displayDistribution(1);
displayDistribution(2);
displayDistribution(5);
displayDistribution(20);

displayDistributionGraph(1);
displayDistributionGraph(2);
displayDistributionGraph(5);
displayDistributionGraph(20);


%%%%%%%%% FUNCTIONS %%%%%%%%%

function displayDistribution(i)
    dots_n = 500;
    f = @(x) atan(x);

    % normal random [0 1]
    r = rand(1,dots_n);

    % random in [-i i]
    rb = 2*i .* r - i;

    % biased random [0 1]
    rn = (f(rb)./2 + f(i)/2) ./ f(i);

    figure("Name",sprintf("Distribution with i = %d", i))
    hold on
    plot(1:dots_n, r ,'ro');
    plot(1:dots_n, rn,'go');
end

function displayDistributionGraph(i)
    a = -i;
    b = i;
    f = @(x) atan(x);
    
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



