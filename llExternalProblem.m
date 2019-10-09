function [functionValue equalityConstrVals inequalityConstrVals] = llExternalProblem(xu, xl)

    %Upper level TP1 implemented

    x = xu;
    y = xl;

    d = floor(length(x) / 2);

    q1 = sum(y(1:d).^2) + sum(0.5*y(1:d)).^2 + sum(0.5*y(1:d)).^4;
    r1 = -x(1)^2 - 1e6*sum(x(2:d).^2);

    q2 = (y(d+1) - x(d+1) .* sin(x(d+1)) )^2 + 1e6*sum( (y(d+2:end) - x(d+2:end) .* sin(x(d+2:end))).^2 );
    r2 = -sum( x(d+1:end).^2 );

    p1 = q1 + r1;
    p2 = q2 + r2;

    % ff = 10*d + sum((y(1:d) -  x(1:d)).^ 2 - 10*cos( 2*pi*abs(y(1:d) - x(1:d) ) )) ;
    % ff = 10 + ( y(1)  ) + 1e6 *sum( (y(2:d)).^ 2 ) ;
    % ff = 10*d + sum((y(1:d) -  x(1:d)).^ 2 - 10*cos( 2*pi*abs(y(1:d) - x(1:d) ) )) ;


    % p1 = ff - (10*d + sum((x(1:d) ).^ 2 - 10*cos( 2*pi*(x(1:d) ) )));
    % p2 = sum((  y(d+1:end) - (x(d+1:end) ))   ).^2 + sum(  x(d+1:end).^2  );
 
    functionValue = p1 + p2;

    functionValue = -functionValue;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
