%% ffcm(����ģ��c�����㷨,������ͼ��ָ��)
%%ֻ�ܴ���Ҷ�ͼ��
%c������һ���ֶ�����
%data������Ĳ��������ŵ�����,ͼ������
%p��ÿһ�������
%re�Ƿ��صĴ������ŵ�����
%u��c*l��ģ�����־���(������)
%mΪƽ�������������֪�����ף�һ��ȡ2�ȽϺ�
function [u p re]=FFCM(data,c)
m=2;
% [M,N]=size(data); %M�����ݸ�����N������ά��
H=Hist(data);
H=H';
L=reshape(1:255,1,255);
L=L';
 [~,N1]=size(H);
u=zeros(c,255);
p=zeros(c,N1);
%% ��ʼ��c����������
% %��data�����ܶ��ɴ�С����ȡǰk���ܶȴ�ĵ���Ϊ��ʼ��������(�ܶȷ�ȡ��ʼ��������)
% initdata=Density(data);
% p=initdata(1:c,1:N);
%% ��ʼ��K����������
for i=1:N1
    %����ͬһ���Ե����ֵ����Сֵ
    mi=min(H(:,i));       %ÿһά������
    ma=max(H(:,i));       %ÿһά��С����
    for j=1:c
        %ÿһά�����ʼ�������ȡ���ֵ����Сֵ֮�������Ϊ��������
        p(j,i)=ma+(mi-ma)*rand();
    end
end

%d��ʾ���ݵ���ÿ���������ĵľ������
d=zeros(c,255);
while 1
    pre_p=p;
    %% ����������
    for i=1:c
        for j=1:255
            d(i,j)=Distance(p(i,:),j,1);
        end
    end
    %% ����ģ�����־���u
    for i=1:c
        %% ��d��i,j��=0ʱ��u(i,j)=1,u(i,k)=0,k~=j
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
    %% ����ģʽ���󣨾������ĵ㣩
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
        
%%����L(�Ҷȼ�����)
re=[];
for i=1:255
    [~,index]=max(u(:,i));
    re=[re;L(i,:),index];
end





    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
