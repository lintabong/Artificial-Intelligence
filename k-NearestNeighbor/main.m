clear;clc;clf;

n = 100;
a = 0;
b = 50;
c = 100;
k = 6;
axie = [ a c a c];

for i = 1:n
	if i <= 50
		node(i).x = (b-a).*rand(1,1) + a;
		node(i).y = (b-a).*rand(1,1) + a;
		node(i).type = 'bawah';
	else 
		node(i).x = (c-b).*rand(1,1) + b;
		node(i).y = (c-b).*rand(1,1) + b;	
		node(i).type = 'atas';
	end
		axis(axie);
	plot (node(i).x,node(i).y,'o');
	hold on	
end

new.x = 50;
new.y = 50;

clf;
for i = 1:n
	plot (node(i).x,node(i).y,'o');
	hold on	
	plot(new.x,new.y,'x');
end

for i=1:n 
	node(i).dist= pdist([node(i).x,node(i).y;new.x,new.y],'euclidean');	 
end

[~,index] = sortrows([node.dist].'); 
node = node(index); 
clear index

pause(3);

hold on
for i = 1:k
	x(i) = node(i).x;
	y(i) = node(i).y;
	plot([x(i) new.x],[y(i) new.y],'-r');
	hold on
	pause(0.5)
end

node1 = table([node(1:k).x].', [node(1:k).y].', {node(1:k).type}.', [node(1:k).dist].', 'VariableNames', {'x', 'y', 'type', 'dist'});
disp(node1)
