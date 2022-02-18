function [t,h]=ball3stokes
%
% Problem 3.2 Trajectory of the ball dropping and bouncing
%             until the ball hits 3 times on the ground
%             with drag force of Stokes' drag
%

% Define constants
g=9.81;     % gravity (m/sec^2)
dt=0.01;  % time step[temporal resolution] (sec)
H=1;        % initial height when ball start dropping
COR=0.8;    % coefficient of restitution
b=0.8;      % constant for acceleration induced by stokes' drag (1/sec)

% Initialize numerical simulation variables
t=[];       % time (sec)
h=[];       % height of the ball (m)
v=[];       % velocity of the ball (m/sec)

% Assign initial conditions
t(1)=0;         % t0=0
h(1)=H;         % h(t0=0)=H=1m
v(1)=0;         % v(t0=0)=0 (no initial velocity) 
a(1)=-g-b*v(1);  % a(t0=0)=-g-bv(t0=0)

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
        % calculate acceleration of the ball at given time t(i+1) 
        a(i+1)=-g-b*v(i);
        % calculate velocity of the ball at given time t(i+1) 
        v(i+1)=v(i)+a(i)*dt;
        % calculate height of the ball at given time t(i+1) 
        h(i+1)=h(i)+v(i)*dt;
        % index 'i' increases by 1 to calculate next height
        i=i+1;    
    end
    % delete current height related values and
    % go back to the last height by decreasing i by 1
    % (The last position where the ball is above the ground)
    t(i)=[]; v(i)=[]; h(i)=[];
    i=i-1;
    % Assume that the ball bounces slightly above the ground,
    % the initial velocity of the ball after bouncing is calculated with
    % the final velocity of the ball before bouncing
    % and coefficient of restitution
    v(i)=-COR*v(i);
    % go back to calculate next height
    % with new condition after the ball bouncing.
end
plot(t,h)