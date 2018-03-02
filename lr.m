% loading the data to train on, one hot encoding function returns m*n
% matrix where m is no. of training examples and n is total unique
% clusters.
 clear;
 clc;
 close all;
 % loading all the variables
 load('input.csv');
 load('idx_color_12');
 %load('gray_cluster_data_6');
 load('center_color_12');

 
 % Code to analyze the data is commented here. 
 % functions are called to calculate cost function and gradient descent
% Defining output space

load('color_cluster_data_12'); % to assign the clustered centers (output)
color_code = color_cluster_data_12;
color_code = color_code./256; % normalizing the output

% Defining Input space
gray_cluster_data_6 = [];
gray_cluster_data_6 = input;
gray_cluster_data_6 = gray_cluster_data_6./256; %normalizing input
d = size(gray_cluster_data_6);

m1 = d(1); % m : number of data points
d1 = size(color_code);
d1 = d1(2);



[trainInd,valInd,testInd] = dividerand(d(1),0.8,0,0.2); % dividing the data set

for k = 1:1:length(trainInd)
    gray_code_train(k,:) = gray_cluster_data_6(trainInd(k),:);
    color_code_train(k,:) = color_code(trainInd(k),:);
    
end

for k = 1:1:length(testInd)
    gray_code_test(k,:) = gray_cluster_data_6(testInd(k),:);
    color_code_test(k,:) = color_code(testInd(k),:);
    idx_test(k,:) = idx_color_12(testInd(k), :);
end
x0 = ones([length(trainInd),1]); % ones matrix 

X =[x0, gray_code_train];% appending the ones matrix
% initializing theta values;
theta = zeros([d(2)+1, d1]);
x0 = [];
x0 = ones([length(testInd),1]); % ones matrix
X_test = [x0, gray_code_test];

%h_theta = X*theta;


%cost = cost_fcn(X, theta, color_code);


alpha = 0.0002;
no_iterations = 10000;
%[theta, cost_values] = GradientDescent(X,color_code, theta, alpha, no_iterations);

for i = 1:1:d1
    
    [theta(:,i),c_value(:,i) ]= GradientDescent(X, color_code_train(:,i), theta(:,i), alpha, no_iterations);
    
end



for m2 = 1:1:d1
output(:,m2) = X_test*theta(:,m2);
end

for m = 1:1:d1
    figure()
    plot(c_value(:,m));
    title(m)
end

%%

% test_clusters = one_hot_decoding(color_code_test);
% count = 0;
% op = one_hot_decoding(output);
% op = transpose(op);
% for k = 1:1:length(testInd)
%     if op(k) ~= test_clusters(k)
%         count = count+1;
%     end
% end
% 
% acc = (1-(count/length(testInd)))*100;
% disp(acc);
%%
color_code_test1 = color_code_test.*256;
output1 = output.*256;
output1 = round(output1);
err(1) = immse(color_code_test1(:,1), output1(:,1));
err(2) = immse(color_code_test1(:,2), output1(:,2));
err(3) = immse(color_code_test1(:,3), output1(:,3));


% %% matching the output to the nearest centers;
% output2 = [];
% c = center_color_12;
% 
% for q = 1:1:length(output)
% for p = 1:1:length(c)
%     dist(p) = round(sqrt(2*(((output1(q,1)-c(p,1))^2)) + 4*((output1(q,2)-c(p,2))^2) + ...
%                     3*((output1(q,3)-c(p,3))^2)));
% end
% [a1, idx] = min(dist);
% output2(q,:) = c(idx,:);
% op_cluster(q) = idx;
% idx = [];
% dist = [];
% 
% end
% 
% err2(1) = immse(color_code_test1(:,1), output2(:,1));
% err2(2) = immse(color_code_test1(:,2), output2(:,2));
% err2(3) = immse(color_code_test1(:,3), output2(:,3));


%% Checking the right cluster classification
% op_cluster = transpose(op_cluster);
% count = 0;
% for k = 1:1:length(testInd)
%     if op_cluster(k) ~=idx_test(k)
%         count = count+1;
%     end
% end
% 
% 
% acc = (1-(count/length(testInd)))*100;
% disp(acc);