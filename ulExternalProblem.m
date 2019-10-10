function [functionValue equalityConstrVals inequalityConstrVals] = ulExternalProblem(xu, xl)

    %Upper level TP1 implemented

    x = xu;
    y = xl;

    d = floor(length(x) / 2);

    q1 = sum(100*(y(1:d-1).^2  -  y(2:d) ).^2 + ( y(1:d-1) - 1 ) ) ;
    r1 = -sum(x(1:d).^2);

    n = length(x((d+1):end));
    q2 = sum( ( y(d+1:end)  - 0.01*x(d+1:end).^3 ).^2 ) ;
    % q2 = sum( abs( y((d+1):end) - 10.0 ./ (1 + 2.5*(x((d+1):end).^2)) ) .^(2:(n+1)) );
    r2 = -sum( x(d+1:end).^2 );

    p1 = q1 + r1;
    p2 = q2 + r2;

    % ff = 10*d + sum((y(1:d) -  x(1:d)).^ 2 - 10*cos( 2*pi*abs(y(1:d) - x(1:d) ) )) ;
    % ff = 10 + ( y(1)  ) + 1e6 *sum( (y(2:d)).^ 2 ) ;
    % ff = 10*d + sum((y(1:d) -  x(1:d)).^ 2 - 10*cos( 2*pi*abs(y(1:d) - x(1:d) ) )) ;


    % p1 = ff - (10*d + sum((x(1:d) ).^ 2 - 10*cos( 2*pi*(x(1:d) ) )));
    % p2 = sum((  y(d+1:end) - (x(d+1:end) )).^2   ) + sum(  x(d+1:end).^2  );
    
    functionValue = abs(p1)  + abs(p2);

    functionValue = -functionValue;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
