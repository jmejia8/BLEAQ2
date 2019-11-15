function runExperiments()

D_ul = 5;
D_ll = 5;

dirname = sprintf('data_%d_%d', D_ul, D_ll);
mkdir(dirname);

for fn = 1:6
    parfor nrun = 1:31
        externalProblem(fn, nrun, D_ul, D_ll);
    end
end