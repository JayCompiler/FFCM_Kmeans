%%�ú������ڼ���һ�о��������Ԫ�ص�ĳһԪ�صľ���
function d=std(data,vt)
[M,N]=size(data);
d=zeros(M,N);
for i=1:M
    for j=1:N
        d(i,j)=Distance(data(i,j),vt,1);
    end
end
