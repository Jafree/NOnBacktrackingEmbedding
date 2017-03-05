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
idx1 = kmeans([U1(:,2:3) U1(:,35)],2);
figure;scatter3(getcolumn(U1(:,2:4),1),getcolumn(U1(:,2:4),2),getcolumn(U1(:,2:4),3),[],color,'filled');
title('Normalized n-b-t');

%figure;scatter3(getcolumn(U1(:,2:4),1),getcolumn(U1(:,2:4),2),getcolumn(U1(:,2:4),3),[],color,'filled',view(-60,60));
%figure;scatter3(getcolumn(U1(:,2:4),1),U1(:,35),getcolumn(U1(:,2:4),2),[],color);
%figure;scatter(getcolumn(U1(:,2:4),1),[],color);
%text(getcolumn(U1(:,2:4),1),U1(:,35),getcolumn(U1(:,2:4),2),cellstr(num2str(idx1));

idx2 = kmeans(U2(:,2:3),2);
figure;scatter3(getcolumn(U2(:,2:4),1),getcolumn(U2(:,2:4),2),getcolumn(U2(:,2:4),3),[],color);
%text(getcolumn(U2(:,2:4),1),getcolumn(U2(:,2:4),2),getcolumn(U2(:,2:4),3),cellstr(num2str(idx2)));
title('Unnormalized n-b-t');


idx3 = kmeans(Q1(:,2:3),2);
figure;scatter3(getcolumn(Q1(:,2:4),1),getcolumn(Q1(:,2:4),2),getcolumn(Q1(:,2:4),3),[],color);
title('NB-O-normalized');

%text(getcolumn(Q1(:,2:4),1),getcolumn(Q1(:,2:4),2),getcolumn(Q1(:,2:4),3),cellstr(num2str(idx3)));

idx4 = kmeans(Q2(:,2:3),2);
figure;scatter3(getcolumn(Q2(:,2:4),1),getcolumn(Q2(:,2:4),2),getcolumn(Q2(:,2:4),3),[],color);
title('NB-O-Unnormalized');
%text(getcolumn(Q2(:,2:4),1),getcolumn(Q2(:,2:4),2),getcolumn(Q2(:,2:4),3),cellstr(num2str(idx4)));

idx5 = kmeans(V(:,2:3),2);
figure;scatter3(getcolumn(V(:,2:4),1),getcolumn(V(:,2:4),2),getcolumn(V(:,2:4),3),[],color);
title('D^-1L');
%text(getcolumn(V(:,2:4),1),getcolumn(V(:,2:4),2),getcolumn(V(:,2:4),3),cellstr(num2str(idx5)));
%[idx1==gc' idx2==gc' idx3==gc' idx4==gc' idx5==gc']



%Laplacian eigenmaps
[mappedX, mapping] = compute_mapping(adjacency(G), 'Laplacian',34);	
figure;scatter3(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),[],color);
%text(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),cellstr(num2str([1:35]')));
title('Laplacian Eigenmaps'); 
%figure;scatter(mappedX(:,1), mappedX(:,2), 5, labels(num2str(mapping.conn_comp))); 

%PCA
%A = ((full(adjacency(G))'*full(adjacency(G)))+(full(adjacency(G))*full(adjacency(G))'))/2;
[mappedX, mapping] = compute_mapping(full(adjacency(G)), 'PCA',3);	
figure;scatter3(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),[],color);
%text(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),cellstr(num2str([1:35]')));
title('PCA');


%Isomap
A = ((full(adjacency(G))'*full(adjacency(G)))+(full(adjacency(G))*full(adjacency(G))'))/2;
[mappedX, mapping] = compute_mapping(A, 'Isomap',3);	
figure;scatter3(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),[],color);
%text(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),cellstr(num2str([1:35]')));
title('Isomap');

%LPP
A = ((full(adjacency(G))'*full(adjacency(G)))+(full(adjacency(G))*full(adjacency(G))'))/2;
[mappedX, mapping] = compute_mapping(A, 'LPP',3);	
figure;scatter3(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),[],color);
%text(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),cellstr(num2str([1:35]')));
title(' LPP');


%Deep autoencoder
%This algorithm gives random results
A = ((full(adjacency(G))'*full(adjacency(G)))+(full(adjacency(G))*full(adjacency(G))'))/2;
[mappedX, mapping] = compute_mapping(full(adjacency(G)), 'Autoencoder',3);	
figure;scatter3(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),[],color);
%text(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),cellstr(num2str([1:35]')));
title('Deep autoencoder');

%tSNE
%A = ((full(adjacency(G))'*full(adjacency(G)))+(full(adjacency(G))*full(adjacency(G))'))/2;
[mappedX, mapping] = compute_mapping(full(adjacency(G)), 'tSNE',3);	
figure;scatter3(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),[],color);
%text(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),cellstr(num2str([1:35]')));
title('tSNE');
camproj('perspective');

%LINE
load datasets/line_vec.txt
linecolor = zeros(35,3);
for i = 1:35
    linecolor(i,:)= color(line_vec(i,1),:);
end
figure;scatter3(getcolumn(line_vec(:,2:4),1),getcolumn(line_vec(:,2:4),2),getcolumn(line_vec(:,2:4),3),[],linecolor);
%text(getcolumn(mappedX(:,1:3),1),getcolumn(mappedX(:,1:3),2),getcolumn(mappedX(:,1:3),3),cellstr(num2str([1:35]')));
title('LINE');

%Deepwalk
load datasets/deepwalkkarateem.txt;
deep = deepwalkkarateem;
deepcolor = zeros(35,3);
for i = 1:35
    deepcolor(i,:)= color(deep(i,1)+1,:);
end
figure;scatter3(getcolumn(deep(:,2:4),1),getcolumn(deep(:,2:4),2),getcolumn(deep(:,2:4),3),[],deepcolor);
%text(getcolumn(deep(:,2:4),1),getcolumn(deep(:,2:4),2),getcolumn(deep(:,2:4),3),cellstr(num2str(deep(:,1)+1)));
title('Deepwalk');

%node2vec
load datasets/node2vec_karateTest.emb;
node2vec = node2vec_karateTest;
node2veccolor = zeros(35,3);
for i = 1:35
    node2veccolor(i,:)= color(node2vec(i,1),:);
end
figure;scatter3(getcolumn(node2vec(:,2:4),1),getcolumn(node2vec(:,2:4),2),getcolumn(node2vec(:,2:4),3),[],node2veccolor);
%text(getcolumn(deep(:,2:4),1),getcolumn(deep(:,2:4),2),getcolumn(deep(:,2:4),3),cellstr(num2str(deep(:,1)+1)));
title('node2vec');