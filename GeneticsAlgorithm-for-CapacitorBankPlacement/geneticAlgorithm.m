clear;
clc;

nb = 8;
% evalValue = input('evaluation Value (10 - 25): ');
% nc = input('jumlah kromosom: ');
evalValue = 12;
nc = 10;
init_crom = struct('cromosom', cell(nc,1));

%=================================================================%
%======================== CONSTANT VARIABLE ======================%
k1 = 0.9;
k2 = 0.05;
k3 = 0.05;
VdropB = [1.48 1.42 1.36 1.56 1.39 1.34 1.41 1.58];
VdropA = [0.89 0.85 0.81 0.93 0.84 0.80 0.84 0.95];
PactiB = [423.99 241.09 252.18 421.22 224.47 216.15 241.09 285.43];
PactiA = [519.39 295.34 308.92 516.00 274.97 254.79 295.34 349.66];
QpassB = [318.00 180.82 189.13 315.92 168.35 162.12 180.82 214.08];
QpassA = [106.00  60.27  63.04 105.31  56.12  54.04  60.27  71.36];
%=================================================================%
%=================================================================%

child = struct('cromosom', cell(size(init_crom,1),1),'currEval', cell(size(init_crom,1),1),'totEval', cell(size(init_crom,1),1),'fObj', cell(size(init_crom,1),1),'fitness', cell(size(init_crom,1),1));

for i = 1:nb
    fitt(i) = k1*(max(0,VdropA(i) - VdropB(i))) + k2*(max(0,PactiA(i) - PactiB(i))) + k3*(max(0, QpassA(i) - QpassB(i)));
end

disp(' ')
fprintf('=============================================\n')
fprintf('=================Init Parent=================\n')
% install parrent
for i = 1:nc
    for o = 1:nb
        x = rand(1);
        if x >= 0.5
            init_crom(i).cromosom(o) = 1;
        else
            init_crom(i).cromosom(o) = 0;
        end
    end
    child(i).cromosom = init_crom(i).cromosom;
    child(i).currEval = 0;
    child(i).fObj = 0;
    for o = 1:nb
        if child(i).cromosom(o) == 1
            child(i).currEval = child(i).currEval + fitt(o);
        end
    end
    child(i).totEval = evalValue;
    child(i).fObj = abs(child(i).totEval - child(i).currEval);
    if i <= 9
        fmt=['parrent%d  = ' repmat(' %d',1,numel(init_crom(i).cromosom)) '\n'];
        fprintf(fmt,i,init_crom(i).cromosom)
    else
        fmt=['parrent%d = ' repmat(' %d',1,numel(init_crom(i).cromosom)) '\n'];
        fprintf(fmt,i,init_crom(i).cromosom)
    end
end
disp(' ')
fprintf('=============================================\n')
fprintf('Epoch ||  Fungsi Obyektif  || Fitness Terbaik\n')
fprintf('=============================================\n')
for iter = 1:20
    avgObj = 0;
    for i = 1:nc
        avgObj = avgObj + child(i).fObj;
    end
    avgObj = avgObj/nc;
    if iter<10
        fmt=['  %d           %f           %f \n'];
    else
        fmt=[' %d           %f           %f \n'];
    end
    fprintf(fmt,iter, avgObj, child(1).fitness)
    
    figure(1)
    plot(iter, avgObj,'x');
    axis([0 iter 0 5])
    hold on

    for i = 1:nc
        child(i).fitness = 1/(1+child(i).fObj);
    end

    [~,index] = sortrows([child.fitness].'); 
    child = child(index(end:-1:1)); 
    clear index

    %start crossover=======================================================
    for o = 1:nb-(nb/2)
        child(nc-1).cromosom(o) = child(1).cromosom(o);
    end
    for o = (nb/2)+1:nb
        child(nc-1).cromosom(o) = child(2).cromosom(o);
    end
    for o = 1:nb-(nb/2)
        child(nc).cromosom(o) = child(2).cromosom(o);
    end
    for o = (nb/2)+1:nb
        child(nc).cromosom(o) = child(1).cromosom(o);
    end

    %start mutation========================================================
    if child(nc-1).cromosom(2) == 1
       child(nc-1).cromosom(2) = 0;
    else
        child(nc-1).cromosom(2) = 1;
    end

    if child(nc-1).cromosom(6) == 1
       child(nc-1).cromosom(6) = 0;
    else
        child(nc-1).cromosom(6) = 1;
    end

    if child(nc).cromosom(2) == 1
       child(nc).cromosom(2) = 0;
    else
        child(nc).cromosom(2) = 1;
    end

    if child(nc).cromosom(6) == 1
       child(nc).cromosom(6) = 0;
    else
        child(nc).cromosom(6) = 1;
    end

    for i = 1:nc
        child(i).currEval = 0;
        for o = 1:nb
            if child(i).cromosom(o) == 1
                
                child(i).currEval = child(i).currEval + fitt(o);
            end
        end    
        child(i).fObj = abs(child(i).totEval - child(i).currEval);
    end
end

fprintf('=============================================\n')
fmt=['Kromosom terbaik = ' repmat(' %d',1,numel(child(1).cromosom)) '\n'];
fprintf(fmt,child(1).cromosom)
