function [decoded_clusters  ] = one_hot_decoding( output )

m = length(output);

for k = 1:1:m
    [a , index ] = max(output(k,:));
    decoded_clusters(k) = index;
end

    

end

