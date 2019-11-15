function externalProblem(fnum_, nrun, ulDim, llDim)
global fnum;
fnum = fnum_;

problemName = 'externalProblem';             % Test problem name

ulPopSize=100;                    % Size of UL population
ulMaxGens=1000;                  % Maximum number of generations allowed at UL
% ulDim= 4;                         % Number of UL dimensions

llPopSize=100;                    % Size of LL population
llMaxGens=1000;                  % Maximum number of generations allowed at LL
% llDim= 4;                         % Number of LL dimensions

ulDimMin = -10*ones(1, ulDim);            % Minimum value accross UL dimensions
ulDimMax =  10*ones(1, ulDim);              % Maximum value accross UL dimensions

llDimMin = -10*ones(1, llDim);      % Minimum value accross LL dimensions
llDimMax =  10*ones(1, llDim);     % Maximum value accross LL dimensions

ulStoppingCriteria = 1e-2;
llStoppingCriteria = 1e-3;

tic;

[ulEliteFunctionValue, llEliteFunctionValue, ulEliteIndiv, llEliteIndiv, ulFunctionEvaluations, llFunctionEvaluations]=ulSearch(problemName, ulPopSize, ulMaxGens, ulDim, ulDimMin, ulDimMax, llPopSize, llMaxGens, llDim, llDimMin, llDimMax, ulStoppingCriteria, llStoppingCriteria);

timeElapsed = toc;


save(strcat('externalProblem_PMM', int2str(fnum), 'run', int2str(nrun), 'DUL', int2str(ulDim), 'DLL', int2str(llDim)) );

