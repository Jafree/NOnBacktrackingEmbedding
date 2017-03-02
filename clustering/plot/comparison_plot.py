'''
Created on 2014/10/11

@author: free
'''
import matplotlib.pyplot as plt
import numpy as np
import sys
#sys.path.append("E:/9_Dataset/Evolving_network/as-733/output_permanence_modularity_game")
#sys.path.append("E:/9_Dataset/Evolving_network/as-733/output_others_code")
f1 = open("E:/9_Dataset/Evolving_network/as-733/output_permanence_modularity_game/analysis.txt")
f2 = open("E:/9_Dataset/Evolving_network/as-733/output_others_code/analysis_infomap.txt")

#f3 = open("E:/9_Dataset/Evolving_network/as-733/output_others_code/analysis_labelpropagation.txt")
f3 = open("E:/9_Dataset/Evolving_Network/as-733/origin/output/analysis_for_cc_time.txt")
f4 = open("E:/9_Dataset/Evolving_network/as-733/output_others_code/analysis_labelrankT.txt")
time_cost_1 = []
perm_1 = []
modu_1 = []
community_number_1 = []
max_community_size_1 = []
average_community_size_1 = []

time_cost_2 = []
perm_2 = []
modu_2 = []
community_number_2 = []
max_community_size_2 = []
average_community_size_2 = []

time_cost_3 = []
perm_3 = []
modu_3 = []
community_number_3 = []
max_community_size_3 = []
average_community_size_3 = []

time_cost_4 = []
perm_4 = []
modu_4 = []
community_number_4 = []
max_community_size_4 = []
average_community_size_4 = []
for line in f1:
    if len(line)<=1:
        break
    linepair = line.rstrip().split()
    time_cost_1.append(linepair[0])
    perm_1.append(linepair[1])
    modu_1.append(linepair[2])
    community_number_1.append(linepair[3])
    max_community_size_1.append(linepair[4])
    average_community_size_1.append(linepair[5])
for line in f2:
    if len(line)<=1:
        break
    linepair = line.rstrip().split()
    time_cost_2.append(linepair[0])
    perm_2.append(linepair[1])
    modu_2.append(linepair[2])
    community_number_2.append(linepair[3])
    max_community_size_2.append(linepair[4])
    average_community_size_2.append(linepair[5])
for line in f3:
    if len(line)<=1:
        break
    linepair = line.rstrip().split()
    time_cost_3.append(linepair[0])
    perm_3.append(linepair[1])
    modu_3.append(linepair[2])
    community_number_3.append(linepair[3])
    max_community_size_3.append(linepair[4])
    average_community_size_3.append(linepair[5])
for line in f4:
    if len(line)<=1:
        break
    linepair = line.rstrip().split()
    time_cost_4.append(linepair[0])
    perm_4.append(linepair[1])
    modu_4.append(linepair[2])
    community_number_4.append(linepair[3])
    max_community_size_4.append(linepair[4])
    average_community_size_4.append(linepair[5])
f1.close()
f2.close()
f3.close()
f4.close()

plt.figure(dpi=100)

x = np.arange(1,734,1)
plt.ylabel("Modularity")
plt.xlabel("Snapshots")
plt.xlim(0,750)

plt.plot(x,modu_1,color="blue",label="PDG",linewidth=2.5)
plt.plot(x,modu_2,color="red",label="Infomap")
plt.plot(x,modu_3,color="green",label="LabelPro")
plt.plot(x,modu_4,color="yellow",label="LabelRankT",linewidth=2.5)

#plt.plot(x,perm_1,color="blue",label="PDG",linewidth=2.5)
#plt.plot(x,perm_2,color="red",label="Infomap")
#plt.plot(x,perm_3,color="green",label="LabelPro")
#plt.plot(x,perm_4,color="yellow",label="LabelRankT")

#plt.plot(x,community_number_1,color="blue",label="PDG",linewidth=2)
#plt.plot(x,community_number_2,color="red",label="Infomap")
#plt.plot(x,community_number_3,color="green",label="LabelPro")
#plt.plot(x,community_number_4,color="yellow",label="LabelRankT")

#plt.yticks([0,200,500,1000,2000,3000,4000,4500],[0,200,500,1000,2000,3000,4000,4500])
#plt.plot(x,max_community_size_1,color="blue",label="PDG",linewidth=2.5)
#plt.plot(x,max_community_size_2,color="red",label="Infomap")
#plt.plot(x,max_community_size_3,color="green",label="LabelPro")
#plt.plot(x,max_community_size_4,color="yellow",label="LabelRankT")
"""
modu_sum_1 = sum(map(float,modu_1))
modu_sum_2 = sum(map(float,modu_2))
modu_sum_3 = sum(map(float,modu_3))
modu_sum_4 = sum(map(float,modu_4))
print modu_sum_1
print modu_sum_2
print modu_sum_3
print modu_sum_4

print modu_sum_1/modu_sum_2
print modu_sum_1/modu_sum_3
print modu_sum_1/modu_sum_4
"""
"""
time_sum_1 = sum(map(float,time_cost_1))
time_sum_2 = sum(map(float,time_cost_2))
#time_sum_3 = sum(map(float,time_cost_3))
time_cost_3 = map(float,time_cost_3)
time_sum_3 = 0
for x in xrange(400):
    time_sum_3 += time_cost_3[x]
print time_sum_1/733
print time_sum_2/733
print time_sum_3/400
"""
plt.legend(loc='lower left')
plt.tight_layout()
plt.show()
