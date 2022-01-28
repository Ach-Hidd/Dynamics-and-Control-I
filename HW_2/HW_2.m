% Problem 2.1 : Matrix creation with loop
A=zeros(5);
for i = 1:5
    for j = 1:5
        A(i,j) = i+j;
    end
end

B = zeros(5);
for i = 1:5
    for j = 1:5
        B(i,j) = (i+j)^2;
    end
end

% Problem 2.2 : Matrix creation with conditional
k=0;
C=[];
for i=1:100
    if rem(i,[2 3 7]) ~= 0
        C =[C, i];
        k = k+1;
    end
end
