function [ lazy_nb_line_graph ] = graph2lazy_nb_line_graph(G,mode)
%graph2lazy_nb_line_graph is used for transforming an undirected graph to a
%lazy non-backtracking line graph which has a 2m by 2m symmetric adjacency matrix.
%This line graph is constructed by a symmetrication process that denotes a average sum of non-backtracking
%transtion matrix and its transpose.
%   Input:
%       Data  - The adjacency matrix of original graph
%       N     - The node number of original graph
%       M     - The edge number of original graph
%   Output:
%       
%
%
%
%Data, N, M
fprintf('Processing graph2nb_line_graph\n');
Data = adjacency(G);
N = numnodes(G);
M = numedges(G);
lazy_nb_line_graph.in_index = containers.Map('KeyType','int32','ValueType','any');
lazy_nb_line_graph.out_index = containers.Map('KeyType','int32','ValueType','any');
lazy_nb_line_graph.pair_index = [];
lazy_nb_line_graph.original_nodenumber = N;
lazy_nb_line_graph.original_edgenumber = M;
pcount = 0;
%Initialize the incoming edge set w.r.t each node and directed edge set for indexing 
fprintf('Generating edge pairs\n');
for i = 1:N
    invec = [];
    for j = 1:N
        if Data(i,j)~=0
            pcount = pcount + 1;
            lazy_nb_line_graph.pair_index = [lazy_nb_line_graph.pair_index,[j ;i ;pcount]];
            invec =[invec,[j;pcount]];
        end
    end
    lazy_nb_line_graph.in_index(i) = invec;
end

%Initialize the outcoming edge set w.r.t each node and lazy non-backtracking 
for i = 1:N
    lazy_nb_line_graph.out_index(i) = [];
end
%lazy_nb_line_graph.matrix = zeros(2*M);
%Three vectors used for constructing sparse line nonbactracking matrix;
spsource = [];
spdesti = [];

fprintf('Generating three lists to form sparse 2m*2m matrix\n');

if mode == 1%mode=1 is for transition matrix
    spvalue = [];
    for sedge = lazy_nb_line_graph.pair_index
        lazy_nb_line_graph.out_index(sedge(1)) = [lazy_nb_line_graph.out_index(sedge(1)),[sedge(2);sedge(3)]];
        for dedge = lazy_nb_line_graph.pair_index
            if sedge(1) == dedge(2) && sedge(2) ~= dedge(1)
                %lazy_nb_line_graph.matrix(sedge(3),dedge(3)) = 1/(2*(degree(G,sedge(1))-1));
                spsource = [spsource sedge(3)];
                spdesti = [spdesti dedge(3)];
                spvalue = [spvalue 1/(2*(degree(G,sedge(1))-1))];
                
            elseif sedge(2) == dedge(1) && sedge(1) ~= dedge(2)
                %lazy_nb_line_graph.matrix(sedge(3),dedge(3)) = 1/(2*(degree(G,sedge(2))-1));
                spsource = [spsource sedge(3)];
                spdesti = [spdesti dedge(3)];
                spvalue = [spvalue 1/(2*(degree(G,sedge(2))-1))];
                
            end
         end
    end

elseif mode ==2%For non-backtracking operator
   for sedge = lazy_nb_line_graph.pair_index
    lazy_nb_line_graph.out_index(sedge(1)) = [lazy_nb_line_graph.out_index(sedge(1)),[sedge(2);sedge(3)]];
    for dedge = lazy_nb_line_graph.pair_index
        if sedge(1) == dedge(2) && sedge(2) ~= dedge(1)
            %lazy_nb_line_graph.matrix(sedge(3),dedge(3)) = 1/2;
            spsource = [spsource sedge(3)];
            spdesti = [spdesti dedge(3)];
        else if sedge(2) == dedge(1) && sedge(1) ~= dedge(2)
            %lazy_nb_line_graph.matrix(sedge(3),dedge(3)) = 1/2;
            spsource = [spsource sedge(3)];
            spdesti = [spdesti dedge(3)];
        end
    end
    end
    spvalue = 1/2.*ones(1, size(spsource,2));
   
    end

end
fprintf('Generating sparse 2m*2m matrix\n');
lazy_nb_line_graph.matrix = sparse(spsource,spdesti,spvalue,2*M,2*M);
end
