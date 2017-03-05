clear all
load datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2));
%[U,V] =graph_embedding(G,'nb',30,'normalized');
%save -ascii karate_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',30,'normalized');
save -ascii karate_sparse_ua.txt U
[U,V] =graph_embedding(G,'wa',30,'normalized');
save -ascii karate_sparse_wa.txt U


clear all
load datasets/polblogs.txt
polblogs = unique(sort(polblogs,2),'rows');
G = graph(polblogs(:,1),polblogs(:,2));
[U,V] =graph_embedding(G,'nb',100,'normalized');
save -ascii blog_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',100,'normalized');
save -ascii blog_sparse_ua.txt U
[U,V] =graph_embedding(G,'wa',100,'normalized');
save -ascii blog_sparse_wa.txt U


clear all
load datasets/polblogs.txt
polblogs = unique(sort(polblogs,2),'rows');
G = graph(polblogs(:,1),polblogs(:,2));
[U,V] =graph_embedding(G,'ua',100,'normalized');
save -ascii polblogs_ua.txt U
[U,V] =graph_embedding(G,'ua',100,'unnormalized');
save -ascii polblogs_ua_un.txt U
[U,V] =graph_embedding(G,'wa',100,'normalized');
save -ascii polblogs_wa.txt U
[U,V] =graph_embedding(G,'wa',100,'unnormalized');
save -ascii polblogs_wa_un.txt U


clear all
load datasets/CACondMat.txt
CACondMat = unique(sort(CACondMat,2),'rows');
G = graph(CACondMat(:,1),CACondMat(:,2));





clear all
load datasets/CAHepTh.txt
CAHepTh = unique(sort(CAHepTh,2),'rows');
G = graph(CAHepTh(:,1),CAHepTh(:,2));


clear all
load datasets/Enron.txt
Enron = unique(sort(Enron,2),'rows');
G = graph(Enron(:,1),Enron(:,2));


clear all
load datasets/DBLP.txt
DBLP = unique(sort(DBLP,2),'rows');
G = graph(DBLP(:,1),DBLP(:,2));
[U,V] =graph_embedding(G,'ua',100,'normalized');
save -ascii dblp_sparse_ua.txt U

clear all
load datasets/amazon.txt
amazon = unique(sort(amazon,2),'rows');
G = graph(amazon(:,1),amazon(:,2));

