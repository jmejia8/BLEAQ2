function [functionValue equalityConstrVals inequalityConstrVals] = llExternalProblem(xu, xl)
    global fnum;
    %Upper level TP1 implemented

    x = xu;
    y = xl;

    functionValue = PMM_follower(x, y, fnum);

    functionValue = -functionValue;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
