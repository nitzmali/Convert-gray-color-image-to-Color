function [ cost ] = cost_fcn( X, theta1, color_data )
% returns the cost vlaue
% color_code is the output
cost = 0;
h_theta = X*theta1;
m = length(color_data);

a = (h_theta - color_data).^2;
a = (sum(a));
a = a/(2*m);

cost = a;

end

