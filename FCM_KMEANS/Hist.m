%%该函数用于统计每个灰度级像素点个数
function Z=Hist(Image)
Z=zeros(1,256);
for n=1:256
    A=find(Image==n-1);
    Z(n)=length(A);
end