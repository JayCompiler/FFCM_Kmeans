function dis=Distance(x,y,opt)
%% ѡ��1ʱ������ŷ����þ���(Euclidean Distance)
if opt==1
    dis=sqrt(sum((x-y).^2));
    %ѡ��2ʱ�������پ���(Manhattan Distance)
elseif opt==2
        dis=sum(abs(x-y));
        %ѡ��3ʱ���б�ѩ����� ( Chebyshev Distance )
elseif opt==3
    dis=max(abs(x-y));
end
   
    