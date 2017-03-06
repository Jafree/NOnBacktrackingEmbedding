import numpy as np
import parameters as para
"""
This function is used for sort the ndarray according to the items in first column and 
Then, delete the first column and last row
"""
infile = para.filename
outfile = para.outfile
ary =np.loadtxt(filename)
np.savetxt(outfile,ary[ary[:,0].argsort()][0:-1,1:])

