%%����ģ�������㷨����ͼ��ָ�
clc
clear 
I=imread('lena.jpg');
subplot(1,2,1);
%ת��Ϊ�Ҷ�ͼ��
I1=rgb2gray(I);
% I1=I;
imshow(I1);
title('ԭͼ');
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

%��ԭ��ԭͼ������ʽ
for i=1:M
    for j=1:N
        I1(i,j)=data(1,N*(i-1)+j);
    end
end

subplot(1,2,2);
imshow(I1);
title('ffcm�㷨��ͼ��ָ�');