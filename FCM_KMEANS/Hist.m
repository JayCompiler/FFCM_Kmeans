%%�ú�������ͳ��ÿ���Ҷȼ����ص����
function Z=Hist(Image)
Z=zeros(1,256);
for n=1:256
    A=find(Image==n-1);
    Z(n)=length(A);
end