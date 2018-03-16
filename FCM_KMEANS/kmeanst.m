clc
clear all
%数据点
data=rand(1000,2);
tic
[u,re]=KmeansC(data,3);
t2=toc
[K,n]=size(u);
[M,N]=size(re);
figure (2)
for i=1:K
    plot(u(i,1)+0.01,u(i,2),'kp','MarkerFaceColor','k','markersize',9);
    hold on
    grid on
end
for i=1:M
    if re(i,n+1)==1
        plot(re(i,1),re(i,2),'ro','MarkerFaceColor','r','markersize',7);
    elseif re(i,n+1)==2
         plot(re(i,1),re(i,2),'bo','MarkerFaceColor','b','markersize',7);
    else
         plot(re(i,1),re(i,2),'go','MarkerFaceColor','g','markersize',7);
    end
end
title('10000个数据点k-means聚类效果图')
xlabel('x')
ylabel('y')
