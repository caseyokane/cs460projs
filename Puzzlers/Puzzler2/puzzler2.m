% CS460 Puzzler 3 - SVMs and Quadratic Programming ]
% Casey O'Kane
% 10/8/16

%First, find the derivative for the function with a symbol
syms x;
fx = 3*x^2 - 3*x + 1;
dx = diff(fx);

%optX is used to represent variable ebing optimized
optX = zeros(1,101);
%start with a simple learning value
alpha = 0.1;

%Enter primary for loop
for k = 1:1000

    %Find the current gradient value by inserting previous z
    gradiantVal = subs(dx, x, optX(k));
    % provided function that we want to minimize
    optX(k+1) = optX(k) - (alpha * gradiantVal);

end


%Output final result
disp(['Implemented Solution is ', num2str(optX(101)),'.']);