%%本函数用于实现层次聚类
function HierarchicalC(data)
%计算数据点的距离
Distance=pdist(data);
%合并最相近的数据点
Y=linkage(Distance);
%绘制分层树图
dendrogram(Y)
xlabel('数据点')
ylabel('分层')

