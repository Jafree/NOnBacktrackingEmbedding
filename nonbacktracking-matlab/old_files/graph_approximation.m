%Graph approximation is a fast method for graph embbedding via appoximating
%the in-sum amd out-sum of eigenvectors of a 2m by 2m non-backtracking
%transition matrix by a 2n by 2n matrix switching the sum directions with
%eigenvector decomposition operations.
%Approximation technique is utilized in this process.
% There are two kinds of approximation: weight average and uniform
% assuming.
load datasets/karateTest.txt
G = graph(karateTest(:,1),karateTest(:,2));
%color label for plot
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
%For plotting node names
a=[1:numnodes(G)]';c=cellstr(num2str(a));
%For lazy non-backtracking transition matrix
%Identity matrix I
I = diag(ones(1,numnodes(G)));
%Adjacency matrix A
A = adjacency(G);
%Degree matrix D
D = diag(degree(G));
%Inverse of Degree matrix D^-1
D_inv = inv(diag(degree(G)));
%Inverse of Degree minus one matrix (D-I)^-1
D_I_inv = inv(diag(degree(G))-I);

%Transformed Approximation matrix using weight average T_wa
T_wa = [0.5*A*D_I_inv 0.5*(I-D_inv*A*D_I_inv);0.5*(I-D_inv*A*D_I_inv) 0.5*A*D_I_inv];
%Eigenvectors and eigenvalues
[U_T,D_T] = eigs(T_wa,2*numnodes(G),'LM');
%unnormalzied plot
figure;scatter(getcolumn(U_T(1:35,2:3),1),getcolumn(U_T(1:35,2:3),2),[],color);
%text(getcolumn(U_T(1:35,2:4),1),getcolumn(U_T(1:35,2:4),2),cellstr(num2str([1:35]')));
title('unnormalized wa');

figure;scatter3(getcolumn(U_T(1:35,2:4),1),getcolumn(U_T(1:35,2:4),2),getcolumn(U_T(1:35,2:4),3),[],color);
%text(getcolumn(U_T(1:35,2:4),1),getcolumn(U_T(1:35,2:4),2),getcolumn(U_T(1:35,2:4),3),cellstr(num2str([1:35]')));
title('unnormalized wa');

%Degree normalize
U_T = [D_inv D_inv]*U_T;
%Plot
figure;scatter(getcolumn(U_T(1:35,2:3),1),getcolumn(U_T(1:35,2:3),2),[],color);
%text(getcolumn(U_T(1:35,2:4),1),getcolumn(U_T(1:35,2:4),2),cellstr(num2str([1:35]')));
title('normalized wa');

figure;scatter3(getcolumn(U_T(1:35,2:4),1),getcolumn(U_T(1:35,2:4),2),getcolumn(U_T(1:35,2:4),3),[],color);
%text(getcolumn(U_T(1:35,2:4),1),getcolumn(U_T(1:35,2:4),2),getcolumn(U_T(1:35,2:4),3),cellstr(num2str([1:35]')));
title('normalized wa');

%Transformed Approximation matrix using uniform assuming approximation
T_ua = [0.5*A*D_I_inv*(I-D_inv) 0.5*I;0.5*I 0.5*A*D_I_inv*(I-D_inv)];
[U_T_ua,D_T_ua] = eigs(T_ua,2*numnodes(G),'LM');

%unnormalzied plot
figure;scatter(getcolumn(U_T_ua(1:35,2:3),1),getcolumn(U_T_ua(1:35,2:3),2),[],color);
%text(getcolumn(U_T_ua(1:35,2:4),1),getcolumn(U_T_ua(1:35,2:4),2),cellstr(num2str([1:35]')));
title('unnormalized ua');
figure;scatter3(getcolumn(U_T_ua(1:35,2:4),1),getcolumn(U_T_ua(1:35,2:4),2),getcolumn(U_T_ua(1:35,2:4),3),[],color);
%text(getcolumn(U_T_ua(1:35,2:4),1),getcolumn(U_T_ua(1:35,2:4),2),getcolumn(U_T_ua(1:35,2:4),3),cellstr(num2str([1:35]')));
title('unnormalized ua');

%Degree normalize
U_T_ua = [D_inv D_inv]*U_T_ua;
%normalized Plot
figure;scatter(getcolumn(U_T_ua(1:35,2:3),1),getcolumn(U_T_ua(1:35,2:3),2),[],color);
%text(getcolumn(U_T_ua(1:35,2:4),1),getcolumn(U_T_ua(1:35,2:4),2),cellstr(num2str([1:35]')));
title('normalized ua');
figure;scatter3(getcolumn(U_T_ua(1:35,2:4),1),getcolumn(U_T_ua(1:35,2:4),2),getcolumn(U_T_ua(1:35,2:4),3),[],color);
%text(getcolumn(U_T_ua(1:35,2:4),1),getcolumn(U_T_ua(1:35,2:4),2),getcolumn(U_T_ua(1:35,2:4),3),cellstr(num2str([1:35]')));
title('normalized ua');