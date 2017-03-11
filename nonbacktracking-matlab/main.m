clear all
load ../datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',30,'normalized');
save -ascii ../datasets/embedding_results/karate_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',30,'normalized');
save -ascii ../datasets/embedding_results/karate_sparse_ua.txt U

clear all
load ../datasets/footballcontinuous.txt
footballcontinuous = unique(sort(footballcontinuous,2),'rows');
G = graph(footballcontinuous(:,1),footballcontinuous(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',50,'normalized');
save -ascii ../datasets/embedding_results/football_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',50,'normalized');
save -ascii ../datasets/embedding_results/football_sparse_ua.txt U

clear all
load ../datasets/dolphinscontinuous.txt
dolphinscontinuous = unique(sort(dolphinscontinuous,2),'rows');
G = graph(dolphinscontinuous(:,1),dolphinscontinuous(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',50,'normalized');
save -ascii ../datasets/embedding_results/dolphin_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',50,'normalized');
save -ascii ../datasets/embedding_results/dolphin_sparse_ua.txt U

clear all
load ../datasets/polblog_connectedstarting_from_1.txt
polblog_connectedstarting_from_1 = unique(sort(polblog_connectedstarting_from_1,2),'rows');
G = graph(polblog_connectedstarting_from_1(:,1),polblog_connectedstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',100,'normalized');
save -ascii ../datasets/embedding_results/blog_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',100,'normalized');
save -ascii ../datasets/embedding_results/blog_sparse_ua.txt U

% NOBE Embedding Generating
clear all
load datasets/DBLP.txt
DBLP = unique(sort(DBLP,2),'rows');
G = graph(DBLP(:,1),DBLP(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii ../datasets/embedding_results/dblp_sparse_nb.txt U

clear all
load datasets/amazon.txt
amazon = unique(sort(amazon,2),'rows');
G = graph(amazon(:,1),amazon(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii ../datasets/embedding_results/amazon_sparse_nb.txt U
%========================================================================
clear all
load ../datasets/hepth_lccstarting_from_1.txt
hepth_lccstarting_from_1 = unique(sort(hepth_lccstarting_from_1,2),'rows');
G = graph(hepth_lccstarting_from_1(:,1),hepth_lccstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',310,'normalized');
save -ascii ../datasets/embedding_results/hepth_sparse_nb.txt U
c
clear all
load ../datasets/condmat_lccstarting_from_1.txt
condmat_lccstarting_from_1 = unique(sort(condmat_lccstarting_from_1,2),'rows');
G = graph(condmat_lccstarting_from_1(:,1),condmat_lccstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',310,'normalized');
save -ascii ../datasets/embedding_results/condmat_sparse_nb.txt U

clear all
load ../datasets/enronemail_lccstarting_from_1.txt
enronemail_lccstarting_from_1 = unique(sort(enronemail_lccstarting_from_1,2),'rows');
G = graph(enronemail_lccstarting_from_1(:,1),enronemail_lccstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',310,'normalized');
save -ascii ../datasets/embedding_results/enronemail_sparse_nb.txt U


% UA Embedding Generating

clear all
load datasets/DBLP.txt
DBLP = unique(sort(DBLP,2),'rows');
G = graph(DBLP(:,1),DBLP(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'ua',110,'normalized');
save -ascii ../datasets/embedding_results/dblp_sparse_ua.txt U

clear all
load datasets/amazon.txt
amazon = unique(sort(amazon,2),'rows');
G = graph(amazon(:,1),amazon(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'ua',110,'normalized');
save -ascii ../datasets/embedding_results/amazon_sparse_ua.txt U

%=====================================================================
clear all
load ../datasets/hepth_lccstarting_from_1.txt
hepth_lccstarting_from_1 = unique(sort(hepth_lccstarting_from_1,2),'rows');
G = graph(hepth_lccstarting_from_1(:,1),hepth_lccstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'ua',310,'normalized');
save -ascii ../datasets/embedding_results/hepth_sparse_ua.txt U

clear all
load ../datasets/condmat_lccstarting_from_1.txt
condmat_lccstarting_from_1 = unique(sort(condmat_lccstarting_from_1,2),'rows');
G = graph(condmat_lccstarting_from_1(:,1),condmat_lccstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'ua',310,'normalized');
save -ascii ../datasets/embedding_results/condmat_sparse_ua.txt U

clear all
load ../datasets/enronemail_lccstarting_from_1.txt
enronemail_lccstarting_from_1 = unique(sort(enronemail_lccstarting_from_1,2),'rows');
G = graph(enronemail_lccstarting_from_1(:,1),enronemail_lccstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'ua',310,'normalized');
save -ascii ../datasets/embedding_results/enronemail_sparse_ua.txt U








%{
clear all
load ../datasets/polblog_connectedstarting_from_1.txt
polblog_connectedstarting_from_1 = unique(sort(polblog_connectedstarting_from_1,2),'rows');
G = graph(polblog_connectedstarting_from_1(:,1),polblog_connectedstarting_from_1(:,2),'OmitSelfLoops');
max(conncomp(G))
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii ../datasets/embedding_results/blog_connected_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',110,'normalized');
save -ascii ../datasets/embedding_results/blog_connected_sparse_ua.txt U
%}