
clear all
infile = {'hepth.txt','condmat.txt','enronemail.txt','dblp.txt','amazon.txt'}
%{'hepth_lccstarting_from_1.txt','condmat_lccstarting_from_1.txt','enronemail_lccstarting_from_1'};
dimension = 200;
for i=1:size(infile,2)
filename = infile{i};
fullfile= strcat('../datasets/',filename)
edgelist = load(fullfile);
edgelist = unique(sort(edgelist,2),'rows');
G = graph(edgelist(:,1),edgelist(:,2),'OmitSelfLoops');
%A = ((full(adjacency(G))'*full(adjacency(G)))+(full(adjacency(G))*full(adjacency(G))'))/2;

%Laplacian eigenmaps
[mappedX, mapping] = compute_mapping(adjacency(G)+adjacency(G)', 'Laplacian',dimension);
strcat('../datasets/embedding_results/others_embedding/laplacian_eigenmaps_',filename)
save(strcat('../datasets/embedding_results/others_embedding/laplacian_eigenmaps_',filename),'mappedX','-ascii') 

%Random walk laplacian
[mappedX,E] = eigs(diag(1./degree(G))*laplacian(G),dimension+1,'SR');
mappedX = mappedX(:,2:dimension+1);
%[D,idx] = sort(diag(D),'descend');
save(strcat('../datasets/embedding_results/others_embedding/randomwalk_laplacian_',filename),'mappedX','-ascii');

%PCA
%[mappedX, mapping] = compute_mapping(full(adjacency(G)+adjacency(G)'),'PCA',dimension);
%save(['../datasets/embedding_results/others_embedding/pca_' filename],'mappedX','-ascii') 

%Isomap
[mappedX, mapping] = compute_mapping(adjacency(G)+adjacency(G)', 'Isomap',dimension);	
save(['../datasets/embedding_results/others_embedding/isomap_' filename],'mappedX','-ascii') 


%Deep autoencoder
%[mappedX, mapping] = compute_mapping(adjacency(G)+adjacency(G)','Autoencoder',dimension);	
%save(['../datasets/embedding_results/others_embedding/deepautoencoder_' filename],'mappedX','-ascii') 

%tSNE
%[mappedX, mapping] = compute_mapping(full(adjacency(G)+adjacency(G)') ,'tSNE',dimension);
%save(['../datasets/embedding_results/others_embedding/tsne_' filename],'mappedX','-ascii') 

%tSNE
%[mappedX, mapping] = compute_mapping(A, 'tSNE',dimension);
%save(['../datasets/embedding_results/others_embedding/tsneA_' filename],'mappedX','-ascii') 

end