function [functionValue equalityConstrVals inequalityConstrVals] = ulExternalProblem(xu, xl)

    %Upper level TP1 implemented

    x = xu;
    y = xl;

    d = ceil(length(x) / 2);

    % ff = 1e6*(y(1) - 1).^2 +  sum( (y(2:d) - 1) .^ 2 );
    ff = 10*d + sum((y(1:d) -  x(1:d)).^ 2 - 10*cos( 2*pi*abs(y(1:d) - x(1:d) ) )) ;


    p1 = ff - sum(  ( x(1:d)  ).^2 );
    p2 = sum((   x(d+1:end) - y(d+1:end)   ).^2) + sum(  x(d+1:end).^2  );
    
    functionValue = abs(p1) + p2;

    functionValue = -functionValue;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
