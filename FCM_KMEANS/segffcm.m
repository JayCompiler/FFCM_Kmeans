%%快速模糊聚类算法用于图像分割
clc
clear 
I=imread('lena.jpg');
subplot(1,2,1);
%转换为灰度图像
I1=rgb2gray(I);
% I1=I;
imshow(I1);
title('原图');
I1=double(I1);
I1=medfilt2(I1);
[M,N]=size(I1);
data=[];
for i=1:M
    data=[data,I1(i,:)];
end
tic
[u,p,re]=FFCM(data,2);
t=toc
[minp,index1]=min(p);
[maxp,index2]=max(p);
for i=1:M*N
    if (Distance(data(1,i),maxp,1))<=(Distance(data(1,i),minp,1))
        data(1,i)=255;
    else
        data(1,i)=0;
    end
end

%还原成原图像矩阵格式
for i=1:M
    for j=1:N
        I1(i,j)=data(1,N*(i-1)+j);
    end
end

subplot(1,2,2);
imshow(I1);
title('ffcm算法的图像分割');