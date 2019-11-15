function runExperiments()

D_ul = 5;
D_ll = 5;

for fn = 1:6
    parfor nrun = 1:31
        externalProblem(fn, nrun, D_ul, D_ll);
    end
end