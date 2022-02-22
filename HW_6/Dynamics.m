function Sol = Dynamics(m,b,k,F0,w,x0,v0)
tRange=[0 50];

[t,x] = ode45(@(t,X)Diff(t,X,m,b,k,F0,w),tRange,[x0;v0]);
sol = [t x(:,1)];
plot(t,x)
axis tight; 
grid on;
end



function dX = Diff(t,X,m,b,k,F0,w)


dX(1,1) = X(2,1);
dX(2,1) = (1/m)*(F0*sin(w*t)-b*X(2,1)-k*X(1,1));

end
