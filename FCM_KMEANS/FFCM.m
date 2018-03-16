%% ffcm(快速模糊c聚类算法,仅用于图像分割处理)
%%只能处理灰度图像
%c是数据一共分多少类
%data是输入的不带分类标号的数据,图像数据
%p是每一类的中心
%re是返回的带分类标号的数据
%u是c*l的模糊划分矩阵(隶属度)
%m为平滑参数，经验得知（文献）一般取2比较好
function [u p re]=FFCM(data,c)
m=2;
% [M,N]=size(data); %M是数据个数，N是数据维数
H=Hist(data);
H=H';
L=reshape(1:255,1,255);
L=L';
 [~,N1]=size(H);
u=zeros(c,255);
p=zeros(c,N1);
%% 初始化c个聚类中心
% %将data按照密度由大到小排序，取前k个密度大的点作为初始聚类中心(密度法取初始聚类中心)
% initdata=Density(data);
% p=initdata(1:c,1:N);
%% 初始化K个聚类中心
for i=1:N1
    %计算同一属性的最大值，最小值
    mi=min(H(:,i));       %每一维最大的数
    ma=max(H(:,i));       %每一维最小的数
    for j=1:c
        %每一维随机初始化，随机取最大值与最小值之间的数作为聚类中心
        p(j,i)=ma+(mi-ma)*rand();
    end
end

%d表示数据点与每个聚类中心的距离矩阵
d=zeros(c,255);
while 1
    pre_p=p;
    %% 计算距离矩阵
    for i=1:c
        for j=1:255
            d(i,j)=Distance(p(i,:),j,1);
        end
    end
    %% 更新模糊划分矩阵u
    for i=1:c
        %% 当d（i,j）=0时，u(i,j)=1,u(i,k)=0,k~=j
        if find(d(i,:)==0)
            t=find(d(i,:)==0);
            u(i,t)=1;
            for k=1:255
                if k~=t
                    u(i,k)=0;
                end
            end
        else
            for k=1:255
                    u(i,k)=1/sum((d(i,k)./d(:,k)).^(2/(m-1)));
            end
        end
    end
    %% 更新模式矩阵（聚类中心点）
    for i=1:c
        up=zeros(1,N1);
        lo=0;
        for k=1:255
            up=up+(u(i,k)^m).*H(k)*k;
            lo=lo+u(i,k)^m*H(k);
        end
        p(i,:)=up./lo;
    end
    if (norm(p-pre_p)<10^-5)
        break;
    end
end
        
%%分类L(灰度级聚类)
re=[];
for i=1:255
    [~,index]=max(u(:,i));
    re=[re;L(i,:),index];
end





    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
