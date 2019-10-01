function [functionValue equalityConstrVals inequalityConstrVals] = llExternalProblem(xu, xl)

    %Upper level TP1 implemented

    x = xu;
    y = xl;

    d = ceil(length(x) / 2);

    % ff = 10*d + sum((y(1:d) -  x(1:d)).^ 2 - 10*cos( 2*pi*abs(y(1:d) - x(1:d) ) )) ;
    ff = ( y(1) - x(1) )^2 + 1e6 *sum( (y(2:d) - x(2:d) ).^ 2 ) ;


    p1 = ff - 10*d - sum(  ( x(1:d)  ).^2 - 10*cos( 2*pi * x(1:d) ) );
    p2 = sum((   x(d+1:end) - y(d+1:end)   ).^2) + sum(  x(d+1:end).^2  );
 
    functionValue = p1 + p2;

    functionValue = -functionValue;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
