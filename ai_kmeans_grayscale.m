clear;
clc;
% loading the data:
data = load('input.csv');

% defining the number of clusters:
k = 6;
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
for t = 1:1:250
for i = 1:1:m
    for j = 1:1:k
        dist(j) = (data(i,1)-c(j,1))^2 + (data(i,2)-c(j,2))^2 + (data(i,3)-c(j,3))^2 +...
            2*(data(i,4)-c(j,4))^2 + 2*(data(i,5)-c(j,5))^2 + 2*(data(i,6)-c(j,6))^2 + ...
            (data(i,7)-c(j,7))^2 + (data(i,8)-c(j,8))^2 + (data(i,9)-c(j,9))^2;
        dist(j) = round(sqrt(dist(j)));
     end
    [a1, idx] = min(dist);
    data(i,10) = idx;
end
p = 1;
q = 0;
% Recentering the centroids
for j1= 1:1:k
    for i1=1:1:m
        
        if data(i1,10) == j1
            r(p) = data(i1,1);
            b(p) = data(i1,2);
            g(p) = data(i1,3);
            
            r1(p) = data(i1,4);
            b1(p) = data(i1,5);
            g1(p) = data(i1,6);
            
            
            r2(p) = data(i1,7);
            b2(p) = data(i1,8);
            g2(p) = data(i1,9);
            
            p = p+1;
            if t == 100
                q = q+1;
                no_centres(j1) =q;
            end
            
          
        end

    end
          %disp(c(j1,1:3) - round([mean(r), mean(b), mean(g)]))
          

    
      c(j1,1:9) = round([mean(r), mean(b), mean(g),mean(r1), mean(b1), mean(g1), mean(r2), mean(b2), mean(g2)]);
      r= 0;
      b = 0;
      g = 0;
      p =1;
      q =0;

      
      
      
end
end
%c2(j1,1:9) = round([mean(r), mean(b), mean(g),mean(r1), mean(b1), mean(g1), mean(r2), mean(b2), mean(g2)]);

% %%
% for x = 1:1:m
%     if data(x,4) == 1
%         scatter3(data(x,1), data(x,2), data(x,3), '*r');
%         hold on;
%     end
%         if data(x,4) == 2
%         scatter3(data(x,1), data(x,2), data(x,3), '*g');
%         hold on;
%         end
%         if data(x,4) == 3
%         scatter3(data(x,1), data(x,2), data(x,3), '*b');
%         hold on
%         end
%         if data(x,4) == 4
%         scatter3(data(x,1), data(x,2), data(x,3), '*c');
%         hold on
%         end
%         if data(x,4) == 5
%         scatter3(data(x,1), data(x,2), data(x,3), 'or');
%         hold on
%         end
%         if data(x,4) == 6
%         scatter3(data(x,1), data(x,2), data(x,3), 'ob');
%         hold on
%         end
%         if data(x,4) == 7
%         scatter3(data(x,1), data(x,2), data(x,3), 'og');
%         hold on
%         end
%         if data(x,4) == 8
%         scatter3(data(x,1), data(x,2), data(x,3), 'oc');
%         hold on
%         end
%         if data(x,4) == 9
%         scatter3(data(x,1), data(x,2), data(x,3), '+r');
%         hold on
%         end
%         if data(x,4) == 10
%         scatter3(data(x,1), data(x,2), data(x,3), '+b');
%         hold on
%         end
%         if data(x,4) == 11
%         scatter3(data(x,1), data(x,2), data(x,3), '+g');
%         hold on
%         end
%         if data(x,4) == 12
%         scatter3(data(x,1), data(x,2), data(x,3), '+c');
%         hold on
%         end
%         if data(x,4) == 13
%         scatter3(data(x,1), data(x,2), data(x,3), 'xr');
%         hold on
%         end
%         if data(x,4) == 14
%         scatter3(data(x,1), data(x,2), data(x,3), 'xg');
%         hold on
%         end
%         if data(x,4) == 15
%         scatter3(data(x,1), data(x,2), data(x,3), 'xb');
%         hold on
%     end
%             if data(x,4) == 16
%         scatter3(data(x,1), data(x,2), data(x,3), 'xc');
%         hold on
%             end
%         if data(x,4) == 17
%         scatter3(data(x,1), data(x,2), data(x,3), 'dr');
%         hold on
%         end
%     
%         if data(x,4) == 18
%         scatter3(data(x,1), data(x,2), data(x,3), 'dg');
%         hold on
%         end
% 
%         hold off
% end
     
idx_gray = data(:,10);



for i = 1:1:m
    gray_cluster_data(i,:) = c(idx_gray(i),:);
end

% % calculating the error:
% % do cluster wise separation first
% 
% 
% for i = 1:1:k
%    p = 1;
%    for j = 1:1:m
%              if idx_gray(j) ==i
%              cluster_data(p,:, i) = data(j,1:9);
%              p = p+1;
%        end
%    end
% end
%  
% % cluster_data stores cluster wise all data points
% 
% for i = 1:1:k
%     dist(i) = 0;
%     for j = 1:1:no_centres(i)
%         dist(i) = dist(i) + (cluster_data(j,1,i )-c(i,1))^2 + (cluster_data(j,2,i)-c(i,2))^2 + (cluster_data(j,3,i)-c(i,3))^2 +...
%             1*(cluster_data(j,4,i)-c(i,4))^2 + 1*(cluster_data(j,5,i)-c(i,5))^2 + 1*(cluster_data(j,6,i)-c(i,6))^2 + ...
%             (cluster_data(j,7,i)-c(i,7))^2 + (cluster_data(j,8,i)-c(i,8))^2 + (cluster_data(j,9,i)-c(i,9))^2;
%     end
% end
% 
% e = sum(dist);