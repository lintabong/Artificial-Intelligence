clear;
clc;

parameter  = 2;
vmin       = 0;
vmax       = 100;
population = 10;
w          = 0.9;
c1         = 0.8;
c2         = 1.2;
max_iter   = 500;

x_target   = 80;
y_target   = 90;

figure(1)
plot(x_target, y_target,'x');
axis([0 vmax 0 vmax])

particle = struct();
for j = 1:population
    for k = 1:parameter
        particle(j).v(k) = rand(1);
        particle(j).x(k) = (20 - 10)*rand(1) + 10;
    end
    
    hold on;
    x1 = particle(j).x(1);
    x2 = particle(j).x(2);
    plot(x1, x2,'o');
    
    particle(j).f = pdist2([x1,x2],[x_target,y_target]);
    
    for k = 1:parameter
        particle(j).pBest(k) = particle(j).x(k);
    end
    
    gBest_arr(j) = particle(j).f;
end

indice = 0;
for j = 1:population
    if min(gBest_arr) == gBest_arr(j)
        indice = j;
    end
end

for j = 1:population
    for k = 1:parameter
        particle(j).gBest(k) = particle(indice).x(k);
    end
end

init = particle;
fitt = zeros(1, population);
for i = 1:max_iter
    clf;
    
    for j = 1:population
        for k = 1:parameter
            v     = particle(j).v(k);
            r1    = rand(1);
            r2    = rand(1);
            pBest = particle(j).pBest(k);
            gBest = particle(j).gBest(k);
            x     = particle(j).x(k);
            particle(j).v(k) = w*v + c1*r1*(pBest - x) + c2*r2*(gBest - x);

            particle(j).x(k) = particle(j).x(k) + particle(j).v(k);
        end
        
        x1 = particle(j).x(1);
        x2 = particle(j).x(2);
        particle(j).last_fitness = particle(j).f;
        particle(j).f = pdist2([x1,x2],[x_target,y_target]);
        
        hold on;
        plot(x1, x2,'o');
        hold on;
        plot(x_target, y_target,'x');
        axis([0 vmax 0 vmax])
        
        if particle(j).f < particle(j).last_fitness
            for k = 1:parameter
                particle(j).pBest(k) = particle(j).x(k);
            end
        end
    
    gBest_arr(j) = particle(j).f;
    end
    
    indice = 0;
    for j = 1:population
        if min(gBest_arr) == gBest_arr(j)
            indice = j;
        end
    end

    for j = 1:population
        for k = 1:parameter
            particle(j).gBest(k) = particle(indice).x(k);
        end
        fitt(j) = particle(j).f;
    end
    
    if all(fitt <= 1 )
       break; 
    end
    
    disp(i)
    pause(0.0001)
end
