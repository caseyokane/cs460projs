% CS460 Puzzler 3 - SVMs and Quadratic Programming ]
% Casey O'Kane
% 10/8/16

%First, initialize variables as provided in the prompt
H = [2,1;1,2];
f = [1,1]';
A = [1,0];
b = -3;

%Find the minimum value of x for (1/2x' * H * x)  + (f' * x)
x = quadprog(H,f,A,b)'