%% fcm(ģ��c�����㷨)
%c������һ���ֶ�����
%data������Ĳ��������ŵ�����
%p��ÿһ�������
%re�Ƿ��صĴ������ŵ�����
%u��c*M��ģ�����־���(������)
%mΪƽ�������������֪�����ף�һ��ȡ2�ȽϺ�
function [u p re]=FcmC(data,c)
m=2;
[M,N]=size(data); %M�����ݸ�����N������ά��
u=zeros(c,M);
p=zeros(c,N);
%% ��ʼ��c����������
% %��data�����ܶ��ɴ�С����ȡǰk���ܶȴ�ĵ���Ϊ��ʼ��������(�ܶȷ�ȡ��ʼ��������)
% initdata=Density(data);
% p=initdata(1:c,1:N);
%% ��ʼ��K����������
for i=1:N
    %����ͬһ���Ե����ֵ����Сֵ
    mi=min(data(:,i));       %ÿһά������
    ma=max(data(:,i));       %ÿһά��С����
    for j=1:c
        %ÿһά�����ʼ�������ȡ���ֵ����Сֵ֮�������Ϊ��������
        p(j,i)=ma+(mi-ma)*rand();
    end
end

%d��ʾ���ݵ���ÿ���������ĵľ������
d=zeros(c,M);
while 1
    pre_p=p;
    %% ����������
    for i=1:c
        for j=1:M
            d(i,j)=Distance(p(i,:),data(j,:),1);
        end
    end
    %% ����ģ�����־���u
    for i=1:c
        %% ��d��i,j��=0ʱ��u(i,j)=1,u(i,k)=0,k~=j
        if find(d(i,:)==0)
            t=find(d(i,:)==0);
            u(i,t)=1;
            for k=1:M
                if k~=t
                    u(i,k)=0;
                end
            end
        else
            for k=1:M
                    u(i,k)=1/sum((d(i,k)./d(:,k)).^(2/(m-1)));
            end
        end
    end
    %% ����ģʽ���󣨾������ĵ㣩
    for i=1:c
        up=zeros(1,N);
        lo=0;
        for k=1:M
            up=up+(u(i,k)^m).*data(k,:);
            lo=lo+u(i,k)^m;
        end
        p(i,:)=up./lo;
    end
    if (norm(p-pre_p)<10^-5)
        break;
    end
end
        
%%����
re=[];
for i=1:M
    [~,index]=max(u(:,i));
    re=[re;data(i,:),index];
end


    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
