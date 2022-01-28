function [v1,a1,v2,a2,t]=HW023
% load 'ball.mat' % define time(t) and trajectory(x) t = x = % calculate velocity and acceleration with 'for' loop for v1 = end for a1 = end % calculate velocity and acceleration with 'diff' function v2= a2=

File=load('ball_mat.mat');
t = File.A(:,1);
x = File.A(:,2);
v1=[];
for i =1:length(t)-1
    v1= [v1 (x(i+1)-x(i))/(t(i+1)-t(i))];
end
a1 = [];
for j = 1:length(v1)-1
    a1= [a1 (v1(j+1)-v1(j))/(t(j+1)-t(j))];
end

% Second data
t2 = File.A(:,3);
x2 = File.A(:,4);

v2 = diff(x2)./diff(t2);

a2 = diff(v2)./diff(t2(1:end-1));

end