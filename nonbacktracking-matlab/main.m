clear all
load datasets/karateTest.txt
karateTest = unique(sort(karateTest,2),'rows');
G = graph(karateTest(:,1),karateTest(:,2));
NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,101,'normalized');
save -ascii karate_result.txt U

clear all
load datasets/polblogs.txt
polblogs = unique(sort(polblogs,2),'rows');
G = graph(polblogs(:,1),polblogs(:,2));
NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,101,'normalized');
save -ascii polblogs_result.txt U

clear all
load datasets/CACondMat.txt
CACondMat = unique(sort(CACondMat,2),'rows');
G = graph(CACondMat(:,1),CACondMat(:,2));
NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,101,'normalized');
save -ascii CACondMat_result.txt U

clear all
load datasets/CAHepTh.txt
CAHepTh = unique(sort(CAHepTh,2),'rows');
G = graph(CAHepTh(:,1),CAHepTh(:,2));
NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,101,'normalized');
save -ascii CAHepTh_result.txt U

clear all
load datasets/Enron.txt
Enron = unique(sort(Enron,2),'rows');
G = graph(Enron(:,1),Enron(:,2));
NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,101,'normalized');
save -ascii Enron_result.txt U

clear all
load datasets/DBLP.txt
DBLP = unique(sort(DBLP,2),'rows');
G = graph(DBLP(:,1),DBLP(:,2));
NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,101,'normalized');
save -ascii DBLP_result.txt U

clear all
load datasets/amazon.txt
amazon = unique(sort(amazon,2),'rows');
G = graph(amazon(:,1),amazon(:,2));
NB_G = graph2nb_line_graph(G,1);
[U,D] = eigs_nodes(NB_G,101,'normalized');
save -ascii amazon_result.txt U

