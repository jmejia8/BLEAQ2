function [functionValue equalityConstrVals inequalityConstrVals] = ulExternalProblem(xu, xl)
    global fnum;
    %Upper level TP1 implemented

    x = xu;
    y = xl;

    functionValue = PMM_leader(x, y, fnum);

    functionValue = -functionValue;


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Write the constraints here
    inequalityConstrVals = [];
    equalityConstrVals = [];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
