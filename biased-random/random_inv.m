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
    a = 1;
    dots_n = 500;

    % normal random
    r = (b-a).*rand(1,dots_n) + a;
    % biased random
    rn = 1 - 1./(r);
    
    figure("Name",sprintf("Distribution with b = %d", b))
    hold on
    % normal random
    plot(1:dots_n,r-a,'ro');
    % biased random
    plot(1:dots_n,rn.*b,'go');
end

function displayDistributionGraph(b)
    figure("Name",sprintf("Graph with b = %d", b))
    axis([0 b 1/b 1])
    hold on

    % curve plot
    x = linspace(0,20,100);
    plot(x, 1./x);

    % lines plot
    for p = linspace(0,b,20)
        plot([p p],[0 1/p], 'r', 'LineWidth', 1);
        yline(1./p, 'r', 'LineWidth', 1);
    end
end



