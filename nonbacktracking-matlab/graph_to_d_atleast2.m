function [G] = graph_to_d_atleast2(G)
% This function is used to transform the original graph to a graph with
%minimum degree at least 2
fprintf('Processing graph_to_d_atleast2 \n');
N = numnodes(G);
new_node = N+1;
source_list = [];
target_list = [];
for i = 1:N
    if degree(G,i) == 1
        neigh = neighbors(G,i);
        source_list = [source_list i new_node];
        target_list = [target_list new_node neigh(1)];
        
        %G = addedge(G,i,new_node);
        %G = addedge(G,new_node,neigh(1));
        new_node =  new_node + 1;
    end
end

G = addedge(G,source_list,target_list);
end