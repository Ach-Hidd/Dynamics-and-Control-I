function steps = Hanoi(n,from,to,spare)
steps = [];
if n ==1
    steps = [steps; Move(from,to)];
else
    steps = [steps; Hanoi(n-1,from,spare,to)];
    steps = [steps; Hanoi(1,from,to,spare)];
    steps = [steps; Hanoi(n-1,spare,to,from)];
end
end


function x = Move(from,to)
x =['Move from ',num2str(from),' to ',num2str(to)];
end