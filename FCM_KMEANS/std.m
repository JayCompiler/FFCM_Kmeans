%%该函数用于计算一列矩阵的所有元素到某一元素的距离
function d=std(data,vt)
[M,N]=size(data);
d=zeros(M,N);
for i=1:M
    for j=1:N
        d(i,j)=Distance(data(i,j),vt,1);
    end
end
