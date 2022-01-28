
%Problem 1.1 : Matrix generation
A = [1 4 7;2 5 8;3 6 9];
B = [1 2 3;0 3 1;2 1 1];
C= eye(3);

%Problem 1.2 : Basic matrix operations

i = A*B;
ii = A.*B;
iii = B*A;
iv = B.*A;
D=inv(B);
v = B*D;
vi=A/B;
vii=A\B; %A is a singular Matrix
E = 5*eye(3);

%Problem 1.3 : Understanding data types
whos
% All of them are double
%They have 72 Bytes = 72*8 = 576 bits

F = int8(A);
G = int8(B);
FG_Sum = F+G;
%FG_Multi = F*G % (*) is not fully supported for integer classes

%Problem 1.4 : Submatrix extraction and plotting

Ball_mat=load('ballmat.mat')
t = Ball_mat.A(:,1);
x = Ball_mat.A(:,2);
t2 = Ball_mat.A(1:50,3);
x2 = Ball_mat.A(1:50,2);

hold on
plot(t,x,'r+')
plot(t2,x2,'bo')
legend('1st Plot','2nd Plot')
hold off

