function [ lazy_nb_line_graph ] = graph2lazy_nb_line_graph(G,mode)
%{
graph2lazy_nb_line_graph is used for transforming an undirected graph to a
lazy non-backtracking line graph which has a 2m by 2m symmetric adjacency matrix.
This line graph is constructed by a symmetrication process that denotes a average sum of non-backtracking
transtion matrix and its transpose.
   Input:
       Data  - The adjacency matrix of original graph
       N     - The node number of original graph
       M     - The edge number of original graph
   Output:
      Oriented Line Graph with a sparse 2M *2M matrix
Data, N, M
%}

fprintf('Processing graph2nb_line_graph\n');
N = numnodes(G);
M = numedges(G);
lazy_nb_line_graph.in_index = containers.Map('KeyType','int32','ValueType','any');
%lazy_nb_line_graph.out_index = containers.Map('KeyType','int32','ValueType','any');
lazy_nb_line_graph.pair_index = zeros(2,2*M);
lazy_nb_line_graph.original_nodenumber = N;
lazy_nb_line_graph.original_edgenumber = M;
pcount = 0;
%Initialize the incoming edge set w.r.t each node and directed edge set for indexing 
fprintf('Generating edge pairs\n');
for i = 1:N
    invec = zeros(2,degree(G,i));
    deg_count = 0;
    for j = [G.neighbors(i)]'
            pcount = pcount + 1;
            lazy_nb_line_graph.pair_index(:,pcount) = [j ;i];
            deg_count = deg_count + 1;
            invec(:,deg_count) =[j;pcount];            
    end
    lazy_nb_line_graph.in_index(i) = invec;
end

%Initialize the outcoming edge set w.r.t each node and lazy non-backtracking 

for i = 1:N
        %lazy_nb_line_graph.out_index(i) = [];

    lazy_nb_line_graph.out_index{i} = zeros(2,degree(G,i));
end
out_addup_count = zeros(N,1);
%TODO:
for edge_idx = 1:length(lazy_nb_line_graph.pair_index)
        sedge = lazy_nb_line_graph.pair_index(:,edge_idx);
        out_addup_count(sedge(1))= out_addup_count(sedge(1)) +1;
        lazy_nb_line_graph.out_index{sedge(1)}(:,out_addup_count(sedge(1))) = [sedge(2);edge_idx];
        %lazy_nb_line_graph.out_index(sedge(1)) = [lazy_nb_line_graph.out_index(sedge(1)),[sedge(2);edge_idx]];
end
%Three vectors used for constructing sparse line nonbactracking matrix;
degree_square_number = 0;
for i = 1:N
    x = degree(G,i);
    degree_square_number = degree_square_number + 2*x*(x-1);
end
fprintf('degree_square_number is %d\n',degree_square_number);

spsource = zeros(degree_square_number,1);
spdesti = zeros(degree_square_number,1);

fprintf('Generating three lists to form sparse 2m*2m matrix\n');

edge_count = 0;
if mode == 1%mode=1 is for transition matrix
    spvalue = zeros(degree_square_number,1);
    for edge_idx1 = 1:length(lazy_nb_line_graph.pair_index)
        %fprintf('%d\n',edge_idx1);
        sedge = lazy_nb_line_graph.pair_index(:,edge_idx1);
        degree_s1 = degree(G,sedge(1));
        degree_s2 = degree(G,sedge(2));
        %edge2 flow into edge1 via sedge(1)
        for dedge = lazy_nb_line_graph.in_index(sedge(1))
            %dedge(1) is node number, dedge(2) is pcount
            if dedge(1)~=sedge(2)
                edge_count = edge_count+1;
                spsource(edge_count) = edge_idx1;
                spdesti(edge_count) = dedge(2);
                spvalue(edge_count) = 1/(2*(degree_s1-1));
            end
        end
        %edge2 flow into edge1 via sedge(2)
        for edge_idx2 = 1:size(lazy_nb_line_graph.out_index{sedge(2)},2)
            dedge = lazy_nb_line_graph.out_index{sedge(2)}(:,edge_idx2);
            %dedge(1) is node number, dedge(2) is pcount
            if dedge(1)~=sedge(1)
                edge_count = edge_count+1;
                spsource(edge_count) = edge_idx1;
                spdesti(edge_count) = dedge(2);
                spvalue(edge_count) = 1/(2*(degree_s2-1)); 
            end
        end
        
    end
elseif mode ==2%For non-backtracking operator
   for edge_idx1 = 1:length(lazy_nb_line_graph.pair_index)
       sedge = lazy_nb_line_graph.pair_index(:,edge_idx1);
       %edge2 flow into edge1 via sedge(1)
        for dedge = lazy_nb_line_graph.in_index(sedge(1))
            %dedge(1) is node number, dedge(2) is pcount
            if dedge(1)~=sedge(2)
                edge_count = edge_count+1;
                spsource(edge_count) = edge_idx1;
                spdesti(edge_count) = dedge(2);
            end
        end
        %edge2 flow into edge1 via sedge(2)
        for  edge_idx2 = 1:size(lazy_nb_line_graph.out_index{sedge(2)},2)
            dedge = lazy_nb_line_graph.out_index{sedge(2)}(:,edge_idx2);
            %dedge(1) is node number, dedge(2) is pcount
            if dedge(1)~=sedge(1)
                edge_count = edge_count+1;
                spsource(edge_count) = edge_idx1;
                spdesti(edge_count) = dedge(2);
            end
        end
    
    end
    spvalue = 1/2.*ones(1, size(spsource,2));

end
fprintf('Generating sparse 2m*2m matrix\n');
lazy_nb_line_graph.matrix = sparse(spsource,spdesti,spvalue,2*M,2*M);
end
