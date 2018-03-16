clc
clear all
%%数据点
data=rand(100,2);
%自编fcm
tic
[u,p,re]=FcmC(data,3);
t1=toc;
tic
%自编kmeans
[p1,re1]=KmeansC(data,3);
t2=toc;

[K,n]=size(p);
[M,N]=size(re);
figure(1)
%采用fcm分类结果图
% for i=1:K
%     plot(p(i,1)+0.01,p(i,2),'rp','markersize',10);
%     hold on
%     grid on
% end

for i=1:M
    if re(i,n+1)==1
        plot(re(i,1),re(i,2),'ro','MarkerFaceColor','r');
         hold on
    elseif re(i,n+1)==2
         plot(re(i,1),re(i,2),'bo','MarkerFaceColor','b');
          hold on
    else
         plot(re(i,1),re(i,2),'go','MarkerFaceColor','g');
          hold on
    end
end
title('fcm聚类结果')
%%采用kmeans分类结果图

figure (2)
[K,n]=size(p1);
[M,N]=size(re1);
% for i=1:K
%     plot(p1(i,1)+0.01,p1(i,2),'rp','markersize',10);
%     hold on
%     grid on
% end

for i=1:M
    if re1(i,n+1)==1
        plot(re1(i,1),re1(i,2),'ro','MarkerFaceColor','r');
         hold on
    elseif re(i,n+1)==2
         plot(re1(i,1),re1(i,2),'bo','MarkerFaceColor','b');
    else
         plot(re1(i,1),re1(i,2),'go','MarkerFaceColor','g');
    end
end
title('kmeans聚类结果')



%MATLAB自带fcm
tic
[p2,u2,func]=fcm(data,3);
t3=toc
re2=[];
for i=1:M
    [~,index]=max(u2(:,i));
    re2=[re2;data(i,:),index];
end 

%%MATLAB自带fcm函数得到的结果
figure(3)
[K,n]=size(p2);
[M,N]=size(re2);
for i=1:K
    plot(p2(i,1)+0.01,p2(i,2),'rp','markersize',10);
    hold on
    grid on
end

for i=1:M
    if re2(i,n+1)==1
        plot(re2(i,1),re2(i,2),'ro');
    elseif re2(i,n+1)==2
         plot(re2(i,1),re2(i,2),'bo');
    else
         plot(re2(i,1),re2(i,2),'go');
    end
end
title('自带fcm聚类结果')

t1,t2,t3
