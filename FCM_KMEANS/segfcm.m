clc
clear 
I=imread('lena.jpg');
subplot(1,2,1);
%转换为灰度图像
I1=rgb2gray(I);
imshow(I1);
title('原图');
I1=double(I1);
I1=medfilt2(I1);
[M,N]=size(I1);
data=[];
%将图像矩阵变成一行
for i=1:M
    data=[data,I1(i,:)];
end
data=data';
%像素聚类
tic
[u,p,re]=FcmC(data,2);
t=toc
[m,n]=size(re);
s1=0;
s2=0;
c1=0;
c2=0;
for i=1:m
    if re(i,n)==1
        s1=s1+re(i,1);
        c1=c1+1;
    else
        s2=s2+re(i,1);
        c2=c2+1;
    end
end
if (s1/c1)>=(s2/c2)
    for i=1:m
        if re(i,n)==1
            re(i,n-1)=255;
        else
            re(i,n-1)=0;
        end
    end
else
     for i=1:m
        if re(i,n)==1
            re(i,n-1)=0;
        else
            re(i,n-1)=255;
        end
     end
end
re(:,n)=[];
data=re';
%还原成原图像矩阵格式
for i=1:M
    for j=1:N
        I1(i,j)=data(1,N*(i-1)+j);
    end
end

subplot(1,2,2);
imshow(I1);
title('基于Fcm算法的图像分割');

