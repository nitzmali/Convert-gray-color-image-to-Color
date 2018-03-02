function [ color_code, gray_code ] = one_hot_encoding()
% one_hot_encoding function loads the clustered data and returns it in
% coded form.
load('idx_color_12.mat');
load('idx_gray_6.mat');



n1 = numel(idx_color_12);
n2 = numel(idx_gray_6);

m1 = max(idx_color_12);
m2 = max(idx_gray_6);



color_code = zeros(n1, m1);
gray_code = zeros(n2, m2);


for i=1:1:n1
    color_code(i, idx_color_12(i)) = 1;
end

for i=1:1:n1
    gray_code(i, idx_gray_6(i)) = 1;
end
end
