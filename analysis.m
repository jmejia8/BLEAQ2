function analysis()

ul_evals = zeros(31, 6);
ll_evals = zeros(31, 6);
for fnum = 1:6
    i = 0;
    j = 0;


    for nrun = 1:31
        fname  = sprintf('data_5_5/externalProblem_PMM%drun%dDUL5DLL5.mat',  fnum, nrun);
        therun = load(fname);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ul_evals(nrun, fnum) = therun.ulFunctionEvaluations;
        ll_evals(nrun, fnum) = therun.llFunctionEvaluations;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        F = therun.ulEliteFunctionValue;
        f = therun.llEliteFunctionValue;
        x = therun.ulEliteIndiv;
        y = therun.llEliteIndiv;
        psi = PMM_Psi(x, 5, 1);
        
        nx = norm(x);
        ny = norm(y - psi);

        if (ny > 2e-1 || nx > 2e-1) && abs(F) < 1e-2 && abs(f) < 1e-3
            i = i + 1;
        elseif abs(F) >= 1e-2 || abs(f) >= 1e-3
            j = j + 1;
        end
    end
    ps = round(100*i / 31);
    nc = round( 100*j / 31);
    success = 100 - ps - nc;
    s = sprintf('  pseudos = %d\t no-converged = %d \t success = %d', ps, nc, success);
    disp(s);
    disp('==============================================================');
    disp('==============================================================');
    disp('==============================================================');
    % disp(mean(ul_evals))
    % disp(mean(ll_evals))
end
