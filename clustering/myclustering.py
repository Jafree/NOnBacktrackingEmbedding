import os
import graph
import parameters
from network_properties import *
from collections import defaultdict
from sklearn.cluster import *
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

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
    output_content = filepath+'\n'
    data_columns = ['embedding method', 'dimension','clustering method','modularity','permanence'];

    df = pd.DataFrame(columns = data_columns);
    for embeded_each_file in parameters.embeded:
        #For each embeded results, we run several clustering algorithms for comparison
        #Load embeded data
        output_content = output_content + embeded_each_file + '\n'
        embeded_all_dimensions = np.loadtxt(embeded_each_file)
        for max_column in parameters.dimensions:
            output_content = output_content + "Analyizing dimension:"+ str(max_column) + '\n'

            embeded_data = embeded_all_dimensions[:,0:max_column]
            
            # Run kmeans
            #kmeans = KMeans(n_clusters=parameters.cluster_number).fit(embeded_data)
            #print kmeans.labels_
            #k_result = compute_modu_perm(graph_structure,kmeans.labels_)
            #df=df.append(pd.Series([embeded_each_file,max_column,'kmeans',k_result[0],k_result[1]],index=data_columns),ignore_index=True)
            #output_content = output_content+ "kmeans"+str(k_result)+ '\n'
            #print 'kmeans',k_result

            #Run DBSCAN   Have to tune eps
            #dbscan = DBSCAN(eps = 0.1).fit(embeded_data)
            #print dbscan.labels_
            #DB_result= compute_modu_perm(graph_structure,dbscan.labels_)
            #df=df.append(pd.Series([embeded_each_file,max_column,'dbscan',DB_result[0],DB_result[1]],index=data_columns),ignore_index=True)
            #output_content = output_content+ 'dbscan:'+str(DB_result)+'\n'
            #print 'dbscan', DB_result

            #Run Agglomerative Clustering
            agglomerative = AgglomerativeClustering(n_clusters=parameters.cluster_number).fit(embeded_data)
            #print agglomerative.labels_
            ag_result = compute_modu_perm(graph_structure,agglomerative.labels_)
            output_content = output_content + 'agglomerative:' + str(ag_result) + '\n'
            df=df.append(pd.Series([embeded_each_file,max_column,'agglomerative',ag_result[0],ag_result[1]],index=data_columns),ignore_index=True)
            print 'ag', ag_result
            #Run Spectral Clustering
            spectralclu= SpectralClustering(n_clusters=parameters.cluster_number).fit(embeded_data)
            #print spectralclu.labels_
            sp_result = compute_modu_perm(graph_structure,spectralclu.labels_)
            output_content = output_content + 'spectral:' +str(sp_result) + '\n'

            df=df.append(pd.Series([embeded_each_file,max_column,'spectral',sp_result[0],sp_result[1]],index=data_columns),ignore_index=True)
            print sp_result
    df.to_csv(parameters.outfile)
    #f = open(parameters.outfile,'w')
    #f.write(output_content)
    #f.close()
