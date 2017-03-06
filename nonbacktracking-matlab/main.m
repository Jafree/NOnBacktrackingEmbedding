clear all
load ../datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',30,'normalized');
save -ascii ../datasets/embedding_results/karate_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',30,'normalized');
save -ascii ../datasets/embedding_results/karate_sparse_ua.txt U

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

clear all
load ../datasets/slashdotstarting_from_1.txt
slashdotstarting_from_1 = unique(sort(slashdotstarting_from_1,2),'rows');
G = graph(slashdotstarting_from_1(:,1),slashdotstarting_from_1(:,2),'OmitSelfLoops');
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii ../datasets/embedding_results/slashdots_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',110,'normalized');
save -ascii ../datasets/embedding_results/slashdots_sparse_ua.txt U

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