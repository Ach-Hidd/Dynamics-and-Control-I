function x = Fac(n)
if n>1
    x = n*Fac(n-1)
elseif n == 1
    x = 1
else
    disp("Please enter a positive number")
end