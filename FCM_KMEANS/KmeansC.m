%K是数据一共分多少类
%data是输入的不带分类标号的数据
%p是每一类的中心
%re是返回的带分类标号的数据
function [p re]=KmeanC(data,K)
[m,n]=size(data); %m是数据个数，n是数据维数
p=zeros(K,n);
%% 初始化K个聚类中心
for i=1:n
    %计算同一属性的最大值，最小值
    mi=min(data(:,i));       %每一维最大的数
    ma=max(data(:,i));       %每一维最小的数
    for j=1:K
        %每一维随机初始化，随机取最大值与最小值之间的数作为聚类中心
        p(j,i)=ma+(mi-ma)*rand();
    end
end

%% 迭代过程，聚类过程，直到满足终止条件
while 1
    preu=p;     %preu为前一次迭代的聚类中心
    for i=1:K
        %temp存储的的是每个中心到所有样本点对应分量的差值
        temp{i}=[];
        for j=1:m
            temp{i}=[temp{i};data(j,:)-p(i,:)];
        end
    end
    
    %tag 用于标记分类信息，计算各数据点的距离，归类
    tag=zeros(m,K);
    for i=1:m
        %计算到每个中心（范数）的距离保存在c中
        c=[];
        for j=1:K
            c=[c norm(temp{j}(i,:))];
        end
        [inf,index]=min(c);
        tag(i,index)=1;      %如果属于某一类就在那一列标记1
    end
    
    %重新确定数据中心
    for i=1:K
        for j=1:n
            p(i,j)=sum(tag(:,i).*data(:,j))/sum(tag(:,i));
        end
    end
    
    %终止迭代条件，当中心点不再发生变化时，终止迭代
    if(norm(preu-p)<0.0001)
        break;
    end
end
%% 分类好以后再确定每个类的元素序号
re=[];
for i=1:m
    tmp=[];
    for j=1:K
        tmp=[tmp norm(data(i,:)-p(j,:))];
    end
    [~, index]=min(tmp);
    re=[re;data(i,:) index];
end












