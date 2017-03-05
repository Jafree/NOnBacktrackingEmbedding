import os
import graph
import parameters
from network_properties import *
from collections import defaultdict
from sklearn.cluster import *
import numpy as np

#This function is used for computing modularity and permanence for a community configuration
def compute_modu_perm(g,labels):
    #Initiallize two mappings
    community_map_to_node = defaultdict(set)
    node_map_to_community = defaultdict(set)
    for index, node_class in enumerate(labels,start=1):
        node_map_to_community[index] = {node_class}
        if node_class not in community_map_to_node.iterkeys():
            #First node in a community
            community_map_to_node[node_class] = {index}
        else:
            community_map_to_node[node_class].add(index)
    modu_value = modularity.modularity(g,community_map_to_node,node_map_to_community)
    perm_value = permanence.permanence(g,community_map_to_node,node_map_to_community)
        
    return (modu_value,perm_value)

if __name__ == '__main__':
    filepath = parameters.inputfile
    #Initialize the graph structure from file
    graph_structure = graph.graph(filepath)
    for embeded_each_file in parameters.embeded:
        #For each embeded results, we run several clustering algorithms for comparison
        #Load embeded data
        print embeded_each_file
        embeded_all_dimensions = np.loadtxt(embeded_each_file)
        print embeded_each_file        
        for max_column in [1,2,3,5,10,20,30,100]:
            print "Analyizing dimension", max_column
            embeded_data = embeded_all_dimensions[:,0:max_column]
            
            # Run kmeans
            kmeans = KMeans(n_clusters=3).fit(embeded_data)
            #print kmeans.labels_
            print compute_modu_perm(graph_structure,kmeans.labels_)

            #Run DBSCAN   Have to tune eps
            dbscan = DBSCAN(eps = 0.1).fit(embeded_data)
            #print dbscan.labels_
            print compute_modu_perm(graph_structure,dbscan.labels_)

            #Run Agglomerative Clustering
            agglomerative = AgglomerativeClustering(n_clusters=3).fit(embeded_data)
            #print agglomerative.labels_
            print compute_modu_perm(graph_structure,agglomerative.labels_)

            #Run Spectral Clustering
            spectralclu= SpectralClustering(n_clusters=7).fit(embeded_data)
            #print spectralclu.labels_
            print compute_modu_perm(graph_structure,spectralclu.labels_)
