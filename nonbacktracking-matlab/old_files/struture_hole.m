load datasets/karatern_1_edge_dir.txt.mtx
uniqueEdgeList = unique(sort([karatern_1_edge_dir_txt(2:end,2),karatern_1_edge_dir_txt(2:end,1)],2),'rows');
H = graph(uniqueEdgeList(:,1),uniqueEdgeList(:,2));
H = graph_to_d_atleast2(H);
[U1,U2,U3,D1,D2,D3] = graph_embedding(H,numnodes(H));

load datasets/com-youtube.ungraph_1_IC.txt.mtx 
uniqueEdgeList = unique(sort([com_youtube_ungraph_1_IC_txt(2:end,2),com_youtube_ungraph_1_IC_txt(2:end,1)],2),'rows');
H1 = graph(uniqueEdgeList(:,1),uniqueEdgeList(:,2));
H1 = graph_to_d_atleast2(H1);
[U1,U2,U3,D1,D2,D3] = graph_embedding(H1,numnodes(H1));


load datasets/com-dblp.ungraph_1_IC.txt.mtx
uniqueEdgeList = unique(sort([com_dblp_ungraph_1_IC_txt(2:end,2),com_dblp_ungraph_1_IC_txt(2:end,1)],2),'rows');
H2 = graph(uniqueEdgeList(:,1),uniqueEdgeList(:,2));
H2 = graph_to_d_atleast2(H2);
[U1_DBLP,U2_DBLP,U3_DBLP,D1_DBLP,D2_DBLP,D3_DBLP] = graph_embedding(H2,20);

[~,idx_you]=sort(abs(U1(:,5)));
U1(idx_you,5)
seleted_you = []
for i = 1:200
    if idx_you(i) <= 783
        seleted_you = [seleted_you,idx_you(i)-1];
    end
end
seleted_you_78 = seleted_you(1:78)
    

[~,idx_dblp]=sort(abs(U1_DBLP(:,5)));
U1_DBLP(idx_dblp,5)
seleted_dblp = []
for i = 1:200
    if idx_dblp(i) <= 1557
        seleted_dblp = [seleted_dblp,idx_dblp(i)-1];
    end
end
seleted_dblp_42 = seleted_dblp(1:42)