import tensorflow as tf
import numpy as np
from igraph import *
from scipy.linalg import eigh 
from scipy.sparse.linalg.eigen.arpack import eigsh
import parameters as para

infile = para.filename
outfile = para.outfilename
if infile.split(".")[1] == 'gml':
    g = Graph.Read_GML(infile )
else:
    g = Graph.Read_Edgelist(infile, directed = False)
A = g.get_adjacency().data
D = np.zeros((g.vcount(),g.vcount()))
for i in range(0,g.vcount()):
   D[i][i] = g.vs.degree()[i]

D_I = np.zeros((g.vcount(),g.vcount()))
for i in range(0,g.vcount()):
    if g.vs.degree()[i]==1:
        D_I[i][i] = 0
    else:
        D_I[i][i] = 1.0/(g.vs.degree()[i]-1)
D_ = np.zeros((g.vcount(),g.vcount()))
for i in range(0,g.vcount()):
    if g.vs.degree()[i]==0:
        D_[i][i] = 0
    else:
        D_[i][i] = 1.0/(g.vs.degree()[i])
I = np.identity(g.vcount())
Z = np.zeros((g.vcount(),g.vcount()))

M = np.bmat([[0.5*np.dot(np.dot(A,D_I),np.subtract(I,D_)), 0.5*I],[0.5*I,0.5*np.dot(np.dot(A,D_I),np.subtract(I,D_))]])

#eigva, eigvec = tf.self_adjoint_eig(M)
#eigva, eigvec = np.linalg.eig(M)
#eigva, eigvec = eigh(M, eigvals=(size(M,1)-100,size(M,1)-1))
with tf.Session() as sess:
    #The eigsh function with 'LA' return largest eigs but in ascenting order!!!
    eigva_result, eigvec_result = eigsh(M,100,which='LA')
    
    #eigva_result, eigvec_result = sess.run([eigva,eigvec])
    print eigva_result 
    np.savetxt(outfile,eigvec_result[:g.vcount(),0:100][:,::-1])
