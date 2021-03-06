function [U,D] = graph_embedding(G,Version,K,mode)
%Parameter:
% G is a graph class in matlab 2016b
% Version = "wa" or "ua" or "nb"
% K is number of d
%
%Default K=10

if nargin < 4
    mode = 'normalized';
    if nargin < 3
        K = 10;
    end
end

fprintf('Processing graph_embedding %s\n',Version);

N = numnodes(G);

if strcmp(Version, 'nb')
    LG = graph_to_d_atleast2(G);
    LLG = graph2nb_line_graph(LG,1);
    
    [U,D] = eigs_nodes(LLG,K+1,mode);
    [D,idx] = sort(diag(D),'descend');
    U = U(1:N, idx(2:K+1));
else
    I = speye(N);
    %Adjacency matrix A
    A = adjacency(G);
    %Degree matrix D
    
    %Inverse of Degree matrix D^-1
    D_inv = spdiags(1./degree(G),0,N,N);
    %Inverse of Degree minus one matrix (D-I)^-1
    D_I_inv =  spdiags(1./(degree(G)-ones(N,1)),0,N,N);

    if strcmp(Version,'ua')
    %Transformed Approximation matrix using uniform assuming approximationv
        M_D = 0.5*A*D_I_inv*(I-D_inv);
        D_D = 0.5*I;
        T_ua = spalloc(2*N,2*N,2*(nnz(M_D)+nnz(D_D)));
        
        T_ua(1:N,1:N) = M_D;
        T_ua(N+1:2*N,N+1:2*N) = M_D;
        T_ua(N+1:2*N,1:N) = D_D;
        T_ua(1:N,N+1:2*N) = D_D;
        [U,D] = eigs(T_ua,K+1,'LR');
        [D,idx] = sort(diag(D),'descend');
        U = U(1:N, idx(2:K+1));
        D
        if strcmp(mode,'normalized')
        %Degree normalize
            U = D_inv*U;
        end
        
    elseif strcmp(Version,'wa')
    %Transformed Approximation matrix using weight average T_wa
        M_D = 0.5*A*D_I_inv;
        D_D = 0.5*(I-D_inv*A*D_I_inv);
        T_wa = spalloc(2*N,2*N,2*(nnz(M_D)+nnz(D_D)));
        %Form 2N by 2N matrix
        T_wa(1:N,1:N) = M_D;
        T_wa(N+1:2*N,N+1:2*N) = M_D;
        T_wa(N+1:2*N,1:N) = D_D;
        T_wa(1:N,N+1:2*N) = D_D;
        %eigen decomposition
        [U,D] = eigs(T_wa,K+1,'LR');
        %sort eigenvalue in descendinging order
        [D,idx] = sort(diag(D),'descend');
        U = U(1:N, idx(2:K+1));
        D
        if strcmp(mode,'normalized')
        %Degree normalize
            U = D_inv*U;
        end
    
    end   
end


end