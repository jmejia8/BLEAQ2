function [functionValue equalityConstrVals inequalityConstrVals] = llExternalProblem(xu, xl)

    %Upper level TP1 implemented

    x = xu;
    y = xl;

    d = ceil(length(x) / 2);

    % ff = 10*d + sum((y(1:d) -  x(1:d)).^ 2 - 10*cos( 2*pi*abs(y(1:d) - x(1:d) ) )) ;
    % ff = 10 + ( y(1)  ) + 1e6 *sum( (y(2:d)).^ 2 ) ;
    ff = sum( abs(y(1:d) - (x(1)^3)/100).^ (2:d+1) );


    p1 = ff - 10*d - sum(  (x(1:d)).^2 - 10*cos(2*pi*x(1:d)) );
    p2 = sum((  y(d+1:end) - (x(d+1:end) .* sin(x(d+1:end)))   ).^2) + sum(  x(d+1:end).^2  );
 
    functionValue = p1 + p2;

    functionValue = -functionValue;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
