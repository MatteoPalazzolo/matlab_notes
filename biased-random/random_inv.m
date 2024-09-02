clear all;
close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INCREASING FUNCTION
% SCALING AND TRANSLATING
% dom=[1 i] -> i is the strenght
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

displayDistribution(3);
displayDistribution(6);
displayDistribution(9);

displayDistributionGraph(3);
displayDistributionGraph(6);
displayDistributionGraph(9);


%%%%%%%%% FUNCTIONS %%%%%%%%%

function displayDistribution(b)
    dots_n = 500;
    f = @(x) 1./x;

    % normal random [0 1]
    r = rand(1,dots_n);

    % normal random [1 b]
    a = 1;
    rb = (b-a) .* r + a;

    % biased random [0 1]
    rn = ( f(rb) - f(b) ) ./ ( 1 - f(b) );
    
    figure("Name",sprintf("Distribution with b = %d", b))
    hold on
    % normal random
    plot(1:dots_n,r ,'ro');
    % biased random
    plot(1:dots_n,rn,'go');
end

function displayDistributionGraph(b)
    f = @(x) 1./x;

    figure("Name",sprintf("Graph with b = %d", b))
    axis([1 b 1/b 1])
    hold on

    % curve plot
    x = linspace(0,b,100);
    plot(x, f(x));

    % lines plot
    for p = linspace(0,b,20)
        plot([p p],[0 1/p], 'r', 'LineWidth', 1);
        yline(1./p, 'r', 'LineWidth', 1);
    end
end



