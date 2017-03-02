function [U,U_T,U_T_ua,D,D_T,D_T_ua] = graph_embedding(G,K)
if nargin < 2
    K = 10;
end
I = diag(ones(1,numnodes(G)));
%Adjacency matrix A
A = adjacency(G);
%Degree matrix D
D = diag(degree(G));
%Inverse of Degree matrix D^-1
D_inv = inv(diag(degree(G)));
%Inverse of Degree minus one matrix (D-I)^-1
D_I_inv = inv(diag(degree(G))-I);

NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,K,'normalized');

%Transformed Approximation matrix using weight average T_wa
T_wa = [0.5*A*D_I_inv 0.5*(I-D_inv*A*D_I_inv);0.5*(I-D_inv*A*D_I_inv) 0.5*A*D_I_inv];
[U_T,D_T] = eigs(T_wa,K,'LM');
%[U_T,D_T] = eigenshuffle(T_wa);
D_T = diag(D_T);

%Degree normalize
U_T = [D_inv D_inv]*U_T;

%Transformed Approximation matrix using uniform assuming approximation
T_ua = [0.5*A*D_I_inv*(I-D_inv) 0.5*I;0.5*I 0.5*A*D_I_inv*(I-D_inv)];
[U_T_ua,D_T_ua] = eigs(T_ua,K,'LM');
%[U_T_ua,D_T_ua] = eigenshuffle(T_ua);
D_T_ua = diag(D_T_ua);

%Degree normalize
U_T_ua = [D_inv D_inv]*U_T_ua;
end