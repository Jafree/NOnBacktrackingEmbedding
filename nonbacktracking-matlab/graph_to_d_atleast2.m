function [G] = graph_to_d_atleast2(G)
% This function is used to transform the original graph to a graph with
%minimum degree at least 2
N = numnodes(G);
new_node = N+1;
for i = 1:N
    if degree(G,i) == 1
        neigh = neighbors(G,i);
        G = addedge(G,i,new_node);
        G = addedge(G,new_node,neigh(1));
        new_node =  new_node + 1;
    end
end
end