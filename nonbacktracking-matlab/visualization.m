load karateTest.txt
gc = [1 1 1 1 1 1 1 1 2 2 1 1 1 1 2 2 1 1 2 1 2 1 2 2 2 2 2 2 2 2 2 2 2 2 1];
%gc = ['r' 'r' 'r' 'r' 'r' 'r' 'r' 'r' 'b' 'b' 'r' 'r' 'r' 'r' 'b' 'b' 'r' 'r' 'b' 'r' 'b' 'r' 'b' 'b' 'b' 'b' 'b' 'b' 'b' 'b' 'b' 'b' 'b' 'r'];
color = [];
for i = 1:35
    if gc(i) == 1
        color =[color; [1 0 0]];
    else 
        color = [color;[0 0 1]];
    end
end


G = graph(karateTest(:,1),karateTest(:,2));
%For plotting node names
a=[1:numnodes(G)]';c=cellstr(num2str(a));
%For lazy non-backtracking transition matrix
NB_G = graph2nb_line_graph(G,1);
[U1,D1] = eigs_nodes(NB_G,numnodes(G),'normalized');%Degree normalized version
figure;scatter3(getcolumn(U1(:,2:4),1),getcolumn(U1(:,2:4),2),getcolumn(U1(:,2:4),3),[],color);
%text(getcolumn(U1(:,2:4),1),getcolumn(U1(:,2:4),2),getcolumn(U1(:,2:4),3),c);
title('Degree normalized n-b-t');
[U2,D2] = eigs_nodes(NB_G,numnodes(G),'unnormalized');%unnormalized version
figure;scatter3(getcolumn(U2(:,2:4),1),getcolumn(U2(:,2:4),2),getcolumn(U2(:,2:4),3),[],color);
%text(getcolumn(U2(:,2:4),1),getcolumn(U2(:,2:4),2),getcolumn(U2(:,2:4),3),c);
title('Unnormalized n-b-t');
%Test 2m eigenvalues
NB_G = graph2nb_line_graph(G,1);
[U3_2m,D3_2m] = eigs_nodes(NB_G,2*numedges(G),'normalized');%Degree normalized version

%For non-backtracking operator
NB_G = graph2nb_line_graph(G,2);
[Q1,Y1] = eigs_nodes(NB_G,numnodes(G),'normalized');%Degree normalized version
figure;scatter3(getcolumn(Q1(:,2:4),1),getcolumn(Q1(:,2:4),2),getcolumn(Q1(:,2:4),3));
%text(getcolumn(Q1(:,2:4),1),getcolumn(Q1(:,2:4),2),getcolumn(Q1(:,2:4),3),c);
title('NB-O-Normalized');

[Q2,Y2] = eigs_nodes(NB_G,numnodes(G),'unnormalized');%unnormalized version
figure;scatter3(getcolumn(Q2(:,2:4),1),getcolumn(Q2(:,2:4),2),getcolumn(Q2(:,2:4),3));
%text(getcolumn(Q2(:,2:4),1),getcolumn(Q2(:,2:4),2),getcolumn(Q2(:,2:4),3),c);
title('NB-O-Unnormalized');

%Test 2m eigenvalues for symmetric nb operator
NB_G = graph2nb_line_graph(G,2);
[Q3_2m,Y3_2m] = eigs_nodes(NB_G,numedges(G),'unnormalized');%unnormalized version


%For D'L matrix
[V,E] = eigs(diag(1./degree(G))*laplacian(G),numnodes(G),'LM');
figure;scatter3(getcolumn(V(:,2:4),1),getcolumn(V(:,2:4),2),getcolumn(V(:,2:4),3),[],color);
%text(getcolumn(V(:,2:4),1),getcolumn(V(:,2:4),2),getcolumn(V(:,2:4),3),c);
title('D^-1L');

%For dolphin

load datasets/dolphinscontinuous.txt
G1 = graph(dolphinscontinuous(:,1),dolphinscontinuous(:,2));
%For lazy non-backtracking transition matrix
NB_G1 = graph2nb_line_graph(G1,1);
[U_dol,D_dol] = eigs_nodes(NB_G1,numnodes(G1),'normalized');%Degree normalized version
save -ascii output/dol_result.txt U_dol

%For football
load datasets/footballcontinuous.txt
G1 = graph(footballcontinuous(:,1),footballcontinuous(:,2));
%For lazy non-backtracking transition matrix
NB_G1 = graph2nb_line_graph(G1,1);
[U_foot,D_foot] = eigs_nodes(NB_G1,numnodes(G1),'normalized');%Degree normalized version
save -ascii output/foot_result.txt U_foot

%For ploblogs
load datasets/polblogs.txt
pol = unique(sort(polblogs,2),'rows');
G1 = graph(pol(:,1),pol(:,2));
%For lazy non-backtracking transition matrix
NB_G1 = graph2nb_line_graph(G1,1);
[U_pol,D_pol] = eigs_nodes(NB_G1,110,'normalized');%Degree normalized version
save -ascii output/polblogs_result.txt U_pol

%For CACondMat
load datasets/CACondMat.txt
CACondMat = unique(sort(CACondMat,2),'rows');
G1 = graph(CACondMat(:,1),CACondMat(:,2));
%For lazy non-backtracking transition matrix
NB_G1 = graph2nb_line_graph(G1,1);
[U_condmat,D_condmat] = eigs_nodes(NB_G1,numnodes(G1),'normalized');%Degree normalized version
save -ascii output/CACondMat_result.txt U_condmat

load datasets/polblogs.txt
polblogs = unique(sort(polblogs,2),'rows');
G = graph(polblogs(:,1),polblogs(:,2));
I = diag(ones(1,numnodes(G)));
%Adjacency matrix A
A = adjacency(G);
%Degree matrix D
D = diag(degree(G));
%Inverse of Degree matrix D^-1
D_inv = inv(diag(degree(G)));
%Inverse of Degree minus one matrix (D-I)^-1
D_I_inv = inv(diag(degree(G))-I);
%Transformed Approximation matrix using uniform assuming approximation
T_ua = [ 0.5*A*D_I_inv*(I-D_inv) 0.5*I ; 0.5*I 0.5*A*D_I_inv*(I-D_inv) ];
[U_T_ua,D_T_ua] = eigs(sparse(T_ua),50,'LM');
%[U_T_ua,D_T_ua] = eigenshuffle(T_ua);
save -ascii output/UT_ua_polblogs_result.txt U_T_ua
