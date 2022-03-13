clear
clc
n_par = 10;
n_gen =  7;

       %A1  A2  A3  A4  A5  A6  A7
time = [ 0, 15, 37, 16, 24,  7,  6;
        15,  0, 13, 19, 18, 11, 23;
        25, 13,  0, 22, 26, 18, 11;
        16, 20, 23,  0, 22,  8, 12;
        24, 27, 18, 18,  0, 11, 20;
         5, 11, 19, 13, 11,  0, 12;
         6, 19, 21,  3, 18, 12,  0];

disp(time)
parrent = [1 2 3 4 5 6 7];

for u = 1:n_par
    for i = 1:n_gen
        data(u).parr(i).parrent = parrent(i);
        data(u).parr(i).randVal = rand(1);
    end
    data(u).parr(1).randVal = 1;
    data(u).parr(n_gen).randVal = 0;
    [~,index] = sortrows([data(u).parr.randVal].');
    data(u).parr = data(u).parr(index(end:-1:1));
    clear index
end

for u = 1:n_par
    child(u).time = 0;
    for i = 1:n_gen
        child(u).cromosom(i) = data(u).parr(i).parrent;
    end
    for i = 1:n_gen
        if i <= n_gen-1
            child(u).time = child(u).time + time(child(u).cromosom(i),child(u).cromosom(i+1));
        end
    end
end

[~,index] = sortrows([child.time].'); 
child = child(index); 
clear index

fprintf('=============================================\n')
fprintf('Epoch || Fobjektif || Nilai Fitness || Waktu \n')
fprintf('=============================================\n')

for iter = 1:50
    child(10).cromosom = child(1).cromosom;
    child(9).cromosom = child(2).cromosom;
    %%crossover

    cr(1) = child(2).cromosom(5);
    cr(2) = child(2).cromosom(6);
    cr(3) = child(1).cromosom(5);
    cr(4) = child(1).cromosom(6);

    child(10).cromosom(end) = [];
    child(10).cromosom(find(child(10).cromosom == cr(1))) = [];
    child(10).cromosom(find(child(10).cromosom == cr(2))) = [];

    child(9).cromosom(end) = [];
    child(9).cromosom(find(child(9).cromosom == cr(3))) = [];
    child(9).cromosom(find(child(9).cromosom == cr(4))) = [];

    child(10).cromosom(end+1) = cr(1);
    child(10).cromosom(end+1) = cr(2);
    child(10).cromosom(end+1) = 7;
    child(9).cromosom(end+1) = cr(3);
    child(9).cromosom(end+1) = cr(4);
    child(9).cromosom(end+1) = 7;

    %%mutation
    cr(1) = child(9).cromosom(3);
    cr(2) = child(9).cromosom(5);
    cr(3) = child(10).cromosom(3);
    cr(4) = child(10).cromosom(5);

    child(9).cromosom(5) = cr(1);
    child(9).cromosom(3) = cr(2);
    child(10).cromosom(5) = cr(3);
    child(10).cromosom(3) = cr(4);


    for u = 1:n_par
        child(u).time = 0;
        for i = 1:n_gen
            if i <= n_gen-1
                child(u).time = child(u).time + time(child(u).cromosom(i),child(u).cromosom(i+1));
            end
        end
        child(u).fitness  = 1/(1+child(u).time);
    end
    
    avgObj = 0;
    for i = 1:n_par
        avgObj = avgObj + child(i).time;
    end
    avgObj = avgObj/10;
    fObj = avgObj - child(1).time;

    %===============OUTPUT style=================
    figure(1)
    plot(iter, fObj, 'x');
    hold on
    axis([0 iter 0 20])
    fmt = '%d  %1.3f   %d \n';
    fprintf(fmt,iter, fObj, child(1).time)
    %=============================================
    
    [~,index] = sortrows([child.time].');
    child = child(index);
    clear index

end
