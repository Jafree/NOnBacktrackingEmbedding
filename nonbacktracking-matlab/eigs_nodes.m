function [ U,D ] = eigs_nodes(P,K,mode)
%
%V is    
%[V,D] = eigs(P.matrix,K,'LM');%V is the 2m by k matrix with each column beiing a eigenvector
fprintf('Processing eigs_nodes %s \n',mode);
[V,D] = eigs(P.matrix,K,'LR');
D
U = [];
if strcmp(mode, 'normalized')%1 for degree normalized version
for i = 1:P.original_nodenumber
    %vec = zeros(1,size(D,'row'));
    vec = zeros(1,K);
    count =0;
    for list =P.in_index(i)
        vec = vec+V(list(2),:);
        count = count+1;
    end
    U = [U;vec/count];
end
elseif strcmp(mode, 'unnormalized')% 2 for unnormalized version
for i = 1:P.original_nodenumber
    vec = zeros(1,K);
    for list = P.in_index(i)
        vec = vec+V(list(2),:);
    end
    U = [U;vec];
end       
end
end

