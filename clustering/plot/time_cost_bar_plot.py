'''
Created on 2014/10/11

@author: free
'''
import matplotlib.pyplot as plt
import numpy as np
import sys
   
  
 
time_cost = [10000,100,9000]
index = np.arange(3)  
bar_width = 0.35     

#rects1 = plt.bar(index, means_men, bar_width,alpha=opacity, color='b',label=    'Men')  
plt.bar(  bar_width, [14.2], bar_width,color="y")
plt.bar(1 + bar_width, [3.7], bar_width,color="b")     
plt.bar(2 + bar_width, [12.4], bar_width,color="r")     
     
plt.ylabel('Time Cost Per Snapshot (s)')  
plt.xticks(index + 0.175 + bar_width, ('PDG-Restart', 'PDG-Optimized', 'Infomap') )
plt.ylim(0,30)
plt.tight_layout()  
plt.show()  
