function analysis()
D_ul = 2;
D_ll = 3;

ul_evals = zeros(31, 6);
ll_evals = zeros(31, 6);

ul_accur = zeros(31, 6);
ll_accur = zeros(31, 6);
ul_error = zeros(31, 6);
ll_error = zeros(31, 6);

for fnum = 1:6
    i = 0;
    j = 0;


    for nrun = 1:31
        fname  = sprintf('data_%d_%d/externalProblem_PMM%drun%dDUL%dDLL%d.mat', D_ul, D_ll,  fnum, nrun, D_ul, D_ll);
        therun = load(fname);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ul_evals(nrun, fnum) = therun.ulFunctionEvaluations;
        ll_evals(nrun, fnum) = therun.llFunctionEvaluations;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        ul_accur(nrun, fnum) = abs(therun.ulEliteFunctionValue);
        ll_accur(nrun, fnum) = abs(therun.ulEliteFunctionValue);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        F = therun.ulEliteFunctionValue;
        f = therun.llEliteFunctionValue;
        x = therun.ulEliteIndiv;
        y = therun.llEliteIndiv;
        psi = PMM_Psi(x, D_ll, 1);
        
        nx = norm(x);
        ny = norm(y - psi);
        
        ul_error(nrun, fnum) = nx;
        ll_error(nrun, fnum) = ny;

        if (ny > 2e-1 || nx > 2e-1) && abs(F) < 1e-2 && abs(f) < 1e-3
            i = i + 1;
        elseif abs(F) >= 1e-2 || abs(f) >= 1e-3
            j = j + 1;
        end
    end
    ps = round(100*i / 31);
    nc = round( 100*j / 31);
    success = 100 - ps - nc;
    % s = sprintf('  pseudos = %d\t no-converged = %d \t success = %d', ps, nc, success);
    % disp(s);
    % disp('==============================================================');
    % disp('==============================================================');
    % disp('==============================================================');
    % ul_evals
end
% disp(median(ul_evals))
% disp(median(ll_evals))
dirname = sprintf('csv_%d_%d', D_ul, D_ll)
if not(isdir(dirname))
    mkdir(dirname)
end

header = {};
for i = 1:6
    header{i} = sprintf('PMM%d',i);
end

matrices = {ul_evals,ll_evals,ul_accur,ll_accur,ul_error,ll_error};
fnames = {'PMM_ul_evals', 'PMM_ll_evals', 'PMM_ul_accur', 'PMM_ll_accur', 'PMM_ul_error', 'PMM_ll_error'};

for i = 1:length(fnames)
    fname  = sprintf('%s/%s_bleaq2_%d_%d.csv', dirname,string(fnames(i)), D_ul, D_ll);
    T = array2table(cell2mat(matrices(i)));
    T.Properties.VariableNames = header;
    writetable(T, fname);
end



