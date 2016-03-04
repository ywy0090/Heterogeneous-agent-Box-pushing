function plotSingleStep(boxPosition,angle1,angle2, force1, force2,numAngle)
xmax=20;
ymax=20;
boxsize=1;
unitAngle = pi/numAngle;
%plot box 
figure(1);
axis([-1 xmax+1 -1 ymax+1]);
hold on;
plot_box =boxPosition +(boxsize/2);
rectangle('Position',[boxPosition(1) boxPosition(2) boxsize boxsize]);
theta = unitAngle*(angle1-1);
r = force1; % magnitude (length) of arrow to plot
x = plot_box(1); 
y = plot_box(2);
u = r * cos(theta); % convert polar (theta,r) to cartesian
v = r * sin(theta);
quiver(x,y,u,v,'Color','r');
theta = pi-unitAngle*(angle2-1);
r = force2; % magnitude (length) of arrow to plot
x = plot_box(1); 
y = plot_box(2);
u = r * cos(theta); % convert polar (theta,r) to cartesian
v = r * sin(theta);
quiver(x,y,u,v,'Color','b');
%set(gca, 'XLim', [1 10], 'YLim', [1 10]);
hold off;
end