function [t,h]=ball3spatial
%
% Problem 3.4 Trajectory of the ball dropping and bouncing
%             with more accurate bouncing time
%             until the ball hits 3 times on the ground
%

% Define constants
g=9.81;     % gravity (m/sec^2)
dt=0.01;  % time step[temporal resolution] (sec)
H=1;        % initial height when ball start dropping
COR=0.8;    % coefficient of restitution

% Initialize numerical simulation variables
t=[];       % time (sec)
h=[];       % height of the ball (m)
v=[];       % velocity of the ball (m/sec)

% Assign initial conditions
t(1)=0;     % t0=0
h(1)=H;     % h(t0=0)=H=1m
v(1)=0;     % v(t0=0)=0 (no initial velocity) 
a=-g;       % a=-g, and always constant

% set index number i to 1 (initial condition for i=1)
i=1;

% repeat calculating velocity and height of the ball
% until the ball hits 3 times on the ground

for nbounce=1:3
    % if current height h(i) has negative number, terminate 'while' loop
    % (it does not physically make sense.)
    while h(i)>=0 
        % calculate time for given index number
        t(i+1)=t(i)+dt;
        % calculate velocity of the ball at given time t(i+1) 
        v(i+1)=v(i)+a*dt;
        % calculate height of the ball at given time t(i+1) 
        h(i+1)=h(i)+v(i)*dt;
        % index 'i' increases by 1 to calculate next height
        i=i+1;    
    end
    % go back to the last height by decreasing i by 1
    % (The last position where the ball is above the ground)
    i=i-1;
    % define new time step (adaptive time step)
    dtt=dt;
    % if h(t) satisfies spatial resolution condition,
    % terminate 'while' loop.
    while h(i+1)>0.001 || h(i+1)<0
        dtt=dtt+dtt/2*sign(h(i+1));
        % calculate time for given couter number
        t(i+1)=t(i)+dtt;
        % recalculate velocity of the ball
        v(i+1)=v(i)+a*dtt;
        % recalculate the height of ball
        h(i+1)=h(i)+v(i)*dtt;
    end
    % index 'i' increases by 1 with accepting new height
    % with given spatial resolution
    i=i+1;
    % Assume that the ball bounces on the ground,
    % the initial velocity of the ball after bouncing is calculated with
    % the final velocity of the ball before bouncing
    % and coefficient of resititution
    v(i)=-COR*v(i);
    % go back to calculate next height
end
plot(t,h)
% Remove data after 3rd bounce
t(end)=[]; v(end)=[]; h(end)=[];