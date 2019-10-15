function runExperiment()

D_ul = 2;
D_ll = 3;

parfor fn = 1:6
    for nrun = 1:31
        externalProblem(fn, nrun, D_ul, D_ll);
    end
end