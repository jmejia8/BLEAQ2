function analysis()

for fnum = 1:6
    i = 0;
    j = 0;
    for nrun = 1:31
        fname  = sprintf('data/externalProblem_PMM%drun%d.mat',  fnum, nrun);
        therun = load(fname);
        F = therun.ulEliteFunctionValue;
        f = therun.llEliteFunctionValue;
        x = therun.ulEliteIndiv;
        y = therun.llEliteIndiv;
        psi = PMM_Psi(x, 3, 1);
        
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
end