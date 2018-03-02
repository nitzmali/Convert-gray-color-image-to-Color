clear;
clc;
ct = 1;
% code to cluster the gray scale data, k variable stores the number of
% clusters, also this code calculates the loss.
% loading the data:
for k = 5:1:5
    data = [];
    c = [];
 load('I1rgb');
 data = double(I1rgb);

% defining the number of clusters:

    
% finding the number of data points:
d = size(data);
m = d(1); % m : number of data points

% randonmly choose k centers
a = randperm(m,k);
a = sort(a,'ascend');
% defining the random initial centers
for i = 1:1:k
    c(i,:) =data(a(i),:);
end
c1 = c;
idx = 0; % cluster for each data point
for t = 1:1:500
for i = 1:1:m
    for j = 1:1:k
        dist(j) = round(sqrt(2*(((data(i,1)-c(j,1))^2)) + 4*((data(i,2)-c(j,2))^2) + ...
                    3*((data(i,3)-c(j,3))^2)));
    end
    [a1, idx] = min(dist);
    data(i,4) = idx;
end
p = 1;
q = 0;
% Recentering the centroids
for j1= 1:1:k
    for i1=1:1:m
        
        if data(i1,4) == j1
            r(p) = data(i1,1);
            b(p) = data(i1,2);
            g(p) = data(i1,3);
            p = p+1;
            if t == 100
                q = q+1;
                no_centres(j1) =q;
            end
            
          
        end

    end
          %disp(c(j1,1:3) - round([mean(r), mean(b), mean(g)]))
          

    
      c(j1,1:3) = round([mean(r), mean(b), mean(g)]);%% Reassigning the centres
      r= 0;
      b = 0;
      g = 0;
      p =1;
      q =0;

      
      
      
end
end

idx_color = data(:,4);



for i = 1:1:m
    color_cluster_data(i,:) = c(idx_color(i),:);
end

% calculating the error:
% do cluster wise separation first


for i = 1:1:k
   p = 1;
   for j = 1:1:m
             if idx_color(j) ==i
             cluster_data(p,:, i) = data(j,1:3);
             p = p+1;
            end
   end
end
 
% cluster_data stores cluster wise all data points
dist = [];

for i = 1:1:k
    dist(i) = 0;
    for j = 1:1:no_centres(i)
        dist(i) = dist(i) + sqrt((cluster_data(j,1,i )-c(i,1))^2 + (cluster_data(j,2,i)-c(i,2))^2 + (cluster_data(j,3,i)-c(i,3))^2);
    end
end

e = sum(dist);

error(ct) = e;
ct = ct+1;
end





