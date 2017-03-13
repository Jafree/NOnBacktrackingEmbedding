'''
#karate
inputfile = "../datasets/karateTest.txt"
outfile = "../datasets/clustering_results/karate_community_others_B.csv"
embeded = ("../datasets/embedding_results/others_embedding/deepautoencoder_karateTest.txt","../datasets/embedding_results/others_embedding/isomap_karateTest.txt","../datasets/embedding_results/others_embedding/laplacian_eigenmaps_karateTest.txt","../datasets/embedding_results/others_embedding/lpp_karateTest.txt","../datasets/embedding_results/others_embedding/pca_karateTest.txt","../datasets/embedding_results/others_embedding/tsne_karateTest.txt","../datasets/embedding_results/others_embedding/randomwalk_laplacian_karateTest.txt")

dimensions =[1,2,3,4,5,6,7,8,9,10,20,30]
cluster_number = 3 
'''
'''
#football
inputfile = "../datasets/football.txt"
outfile = "../datasets/clustering_results/football_community_others.csv"
embeded = ("../datasets/embedding_results/others_embedding/deepautoencoder_football.txt","../datasets/embedding_results/others_embedding/isomap_football.txt","../datasets/embedding_results/others_embedding/laplacian_eigenmaps_football.txt","../datasets/embedding_results/others_embedding/pca_football.txt","../datasets/embedding_results/others_embedding/tsne_football.txt","../datasets/embedding_results/others_embedding/randomwalk_laplacian_football.txt")

dimensions =[1,2,3,4,5,6,7,8,9,10,11,12,13,20,30]
cluster_number = 11 

'''
'''
#dolphin
inputfile = "../datasets/dolphin.txt"
outfile = "../datasets/clustering_results/dolphin_community_others.csv"
embeded = ("../datasets/embedding_results/others_embedding/deepautoencoder_dolphin.txt","../datasets/embedding_results/others_embedding/isomap_dolphin.txt","../datasets/embedding_results/others_embedding/laplacian_eigenmaps_dolphin.txt","../datasets/embedding_results/others_embedding/pca_dolphin.txt","../datasets/embedding_results/others_embedding/tsne_dolphin.txt","../datasets/embedding_results/others_embedding/randomwalk_laplacian_dolphin.txt")

dimensions =[1,2,3,4,5,6,7,8,9,10,11,12,13,20,30,40,50]
cluster_number = 7
'''
'''
#polblog
inputfile = "../datasets/polblog.txt"
outfile = "../datasets/clustering_results/polblog_community_others.csv"
embeded = ("../datasets/embedding_results/others_embedding/deepautoencoder_polblog.txt","../datasets/embedding_results/others_embedding/isomap_polblog.txt","../datasets/embedding_results/others_embedding/laplacian_eigenmaps_polblog.txt","../datasets/embedding_results/others_embedding/pca_polblog.txt","../datasets/embedding_results/others_embedding/tsne_polblog.txt","../datasets/embedding_results/others_embedding/randomwalk_laplacian_polblog.txt")

dimensions =[1,2,3,4,5,6,7,8,9,10,11,12,13,20,30,40,50,100,150,200]
cluster_number = 7
'''



'''
#dolphin
inputfile = "../datasets/dolphinscontinuous.txt"
outfile = "../datasets/clustering_results/dolphin_community.csv"
embeded = ("../datasets/embedding_results/dolphin_sparse_nb.txt","../datasets/embedding_results/dolphin_sparse_ua.txt")
dimensions =[1,2,3,4,5,6,7,8,9,10,20,30,40,50]
cluster_number = 7 
'''
'''
#football
inputfile = "../datasets/footballcontinuous.txt"
outfile = "../datasets/clustering_results/football_community.csv"
embeded = ("../datasets/embedding_results/football_sparse_nb.txt","../datasets/embedding_results/football_sparse_ua.txt")
dimensions =[1,2,3,4,5,6,7,8,9,10,11,12,13,14,20,30,40,50,100]
cluster_number = 11 
'''
'''
#blog
inputfile = "../datasets/polblog_connectedstarting_from_1.txt"
outfile = "../datasets/clustering_results/polblog_community.csv"
embeded = ("../datasets/embedding_results/blog_sparse_nb.txt","../datasets/embedding_results/blog_sparse_ua.txt")
dimensions =[1,2,3,4,5,6,7,8,9,10,20,30,40,50,100]
cluster_number = 7
'''
'''
#enronemail
inputfile = "../datasets/enronemail_lccstarting_from_1.txt"
outfile = "../datasets/clustering_results/enronemail_community.csv"
embeded = ("../datasets/embedding_results/enronemail_sparse_nb.txt","../datasets/embedding_results/enronemail_sparse_ua.txt")
dimensions =[1,2,3,4,5,6,7,8,9,10,20,30,40,50,100,150,200,250,300]
cluster_number = 3800
'''
'''
#condmat
inputfile = "../datasets/condmat_lccstarting_from_1.txt"
outfile = "../datasets/clustering_results/condmat_community.csv"
embeded = ("../datasets/embedding_results/condmat_sparse_nb.txt","../datasets/embedding_results/condmat_sparse_ua.txt")
dimensions =[1,2,3,4,5,6,7,8,9,10,20,30,40,50,100,150,200,250,300]
cluster_number = 2000 
'''
'''
#hepth
inputfile = "../datasets/hepth_lccstarting_from_1.txt"
outfile = "../datasets/clustering_results/hepth_community.csv"
embeded = ("../datasets/embedding_results/hepth_sparse_nb.txt","../datasets/embedding_results/hepth_sparse_ua.txt")
dimensions =[1,2,3,4,5,6,7,8,9,10,20,30,40,50,100,150,200,250,300]
cluster_number = 700 
'''
#hepth
inputfile = "../datasets/hepth.txt"
outfile = "../datasets/clustering_results/hepth_community_others.csv"
embeded = ("../datasets/embedding_results/hepth_sparse_nb.txt","../datasets/embedding_results/hepth_sparse_ua.txt","../datasets/embedding_results/others_embedding/isomap_hepth.txt","../datasets/embedding_results/others_embedding/laplacian_eigenmaps_hepth.txt","../datasets/embedding_results/others_embedding/pca_hepth.txt","../datasets/embedding_results/others_embedding/randomwalk_laplacian_hepth.txt")

dimensions =[1,2,3,4,5,6,7,8,9,10,11,12,13,20,30,40,50,100,150,200]
cluster_number = 700
