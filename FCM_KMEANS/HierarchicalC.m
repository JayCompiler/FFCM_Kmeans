%%����������ʵ�ֲ�ξ���
function HierarchicalC(data)
%�������ݵ�ľ���
Distance=pdist(data);
%�ϲ�����������ݵ�
Y=linkage(Distance);
%���Ʒֲ���ͼ
dendrogram(Y)
xlabel('���ݵ�')
ylabel('�ֲ�')

