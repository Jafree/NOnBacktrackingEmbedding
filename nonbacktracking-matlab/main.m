clear all
load ../datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2));
[U,V] =graph_embedding(G,'nb',30,'normalized');
save -ascii ../datasets/embedding_results/karate_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',30,'normalized');
save -ascii ../datasets/embedding_results/karate_sparse_ua.txt U

clear all
load ../datasets/slashdotstarting_from_1.txt
slashdotstarting_from_1 = unique(sort(slashdotstarting_from_1,2),'rows');
G = graph(slashdotstarting_from_1(:,1),slashdotstarting_from_1(:,2));
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii ../datasets/embedding_results/slashdots_sparse_nb.txt U
[U,V] =graph_embedding(G,'ua',110,'normalized');
save -ascii ../datasets/embedding_results/slashdots_sparse_ua.txt U


clear all
load datasets/polblogs.txt
polblogs = unique(sort(polblogs,2),'rows');
G = graph(polblogs(:,1),polblogs(:,2));
max(conncomp(G))
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii ../datasets/embedding_results/blog_sparse_nb.txt U



clear all
load datasets/DBLP.txt
DBLP = unique(sort(DBLP,2),'rows');
G = graph(DBLP(:,1),DBLP(:,2));
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii dblp_sparse_nb.txt U



clear all
load datasets/amazon.txt
amazon = unique(sort(amazon,2),'rows');
G = graph(amazon(:,1),amazon(:,2));
[U,V] =graph_embedding(G,'nb',110,'normalized');
save -ascii amazon_sparse_nb.txt U



clear all
load datasets/DBLP.txt
DBLP = unique(sort(DBLP,2),'rows');
G = graph(DBLP(:,1),DBLP(:,2));
[U,V] =graph_embedding(G,'ua',110,'normalized');
save -ascii dblp_sparse_ua.txt U

clear all
load datasets/DBLP.txt
DBLP = unique(sort(DBLP,2),'rows');
G = graph(DBLP(:,1),DBLP(:,2));
[U,V] =graph_embedding(G,'wa',110,'normalized');
save -ascii dblp_sparse_wa.txt U

clear all
load datasets/amazon.txt
amazon = unique(sort(amazon,2),'rows');
G = graph(amazon(:,1),amazon(:,2));
[U,V] =graph_embedding(G,'ua',110,'normalized');
save -ascii amazon_sparse_ua.txt U

clear all
load datasets/amazon.txt
amazon = unique(sort(amazon,2),'rows');
G = graph(amazon(:,1),amazon(:,2));
[U,V] =graph_embedding(G,'wa',110,'normalized');
save -ascii amazon_sparse_wa.txt U














clear all
load datasets/CACondMat.txt
CACondMat = unique(sort(CACondMat,2),'rows');
G = graph(CACondMat(:,1),CACondMat(:,2));
max(conncomp(G))





clear all
load datasets/CAHepTh.txt
CAHepTh = unique(sort(CAHepTh,2),'rows');
G = graph(CAHepTh(:,1),CAHepTh(:,2));
max(conncomp(G))


clear all
load datasets/Enron.txt
Enron = unique(sort(Enron,2),'rows');
G = graph(Enron(:,1),Enron(:,2));
max(conncomp(G))



clear all
load datasets/google.txt
google = unique(sort(google,2),'rows');
G = graph(google(:,1),google(:,2));
max(conncomp(G))


[l,dx] = sort(google(:,2));
dx(1)
coun = 0
for i = google
    coun = coun + 1
    if i(1) ==0 || i(2) ==0
    coun+1
    end
end
[l,idx]= sort(google(:,2),'ascend');

l(idx(1))
l(idx(2))
idx(1)
idx(2)


min(google(:,1))
min(google(:,2))

[l,idx]= sort(google(:,1),'ascend');
l(idx(1))
l(idx(2))

[l,idx]= sort(google(:,1),'ascend');
l(1)
idx(1)
idx(2)

min(google(:,2))
min(google(:,1))
min(google(:,2))

