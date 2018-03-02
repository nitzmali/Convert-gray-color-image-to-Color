function [ theta1, cost_values ] = GradientDescent( X, color_data, theta1, alpha, no_iterations )
% updates theta values uptil number of interations and alpha value
% specified.

m = length(color_data); % no. of training examples
for p = 1:1:no_iterations
    h_theta = X*theta1  ;
    %theta1
    for j = 1:1:size(X,2)
        temp(j) = theta1(j) - alpha*((sum((h_theta - color_data).*X(:,j)))/m);
    end
    %temp
    for k = 1:1:size(X,2)
        theta1(k) = temp(k);
    end
    
    cost_values(p) = cost_fcn(X, theta1, color_data);
end

    


end
