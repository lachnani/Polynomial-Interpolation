function [pt] = newtoninterpolation(x,y,t)
%NEWTONINTERPOLATION Generates an interpolating plynomial.
%   Takes in an x array, a y array, and an evaluation point t. 
%   Outputs the value at t.

%Check inputs
if size(x) ~= size(y)
    disp('Array sizes do not match');
end
n = length(x) - 1;
%Divided Difference
dd = zeros(n+1,1);
for i = 1:(n+1)
    dd(i) = y(i);
end
for j = 2:(n+1)
    for i = (n+1):-1:j
        dd(i) = (dd(i) - dd(i-1))./((x(i) - x(i-j+1)));
    end
end
%Evaluation
temp = dd(n+1);
for i = n:-1:1
    temp = (temp .* (t - x(i))) + dd(i);
end
pt = temp;

end

