function [pt] = lagrange(x,y,t)
%LAGRANGE Generates an interpolating polynomial in Lagrange form.
%   Takes in an x array, a y array, and an evaluation point t.
%   Outputs the value at t.

%Check inputs
if size(x) ~= size(y)
    disp('Array sizes do not match');
end
n = length(x) - 1;
%Establish cardinal Polynomials
l = ones(n+1,1);
for i = 1:(n+1)
    for j = 1:(n+1)
        if j ~= i 
        l(i) = l(i) .* (t-x(j))./(x(i)-x(j));
        end
    end
end
%Evaluate
pt = 0;
for k = 1:(n+1)
    pt = pt + (l(k).*y(k));
end

end

