%K������һ���ֶ�����
%data������Ĳ��������ŵ�����
%p��ÿһ�������
%re�Ƿ��صĴ������ŵ�����
function [p re]=KmeanC(data,K)
[m,n]=size(data); %m�����ݸ�����n������ά��
p=zeros(K,n);
%% ��ʼ��K����������
for i=1:n
    %����ͬһ���Ե����ֵ����Сֵ
    mi=min(data(:,i));       %ÿһά������
    ma=max(data(:,i));       %ÿһά��С����
    for j=1:K
        %ÿһά�����ʼ�������ȡ���ֵ����Сֵ֮�������Ϊ��������
        p(j,i)=ma+(mi-ma)*rand();
    end
end

%% �������̣�������̣�ֱ��������ֹ����
while 1
    preu=p;     %preuΪǰһ�ε����ľ�������
    for i=1:K
        %temp�洢�ĵ���ÿ�����ĵ������������Ӧ�����Ĳ�ֵ
        temp{i}=[];
        for j=1:m
            temp{i}=[temp{i};data(j,:)-p(i,:)];
        end
    end
    
    %tag ���ڱ�Ƿ�����Ϣ����������ݵ�ľ��룬����
    tag=zeros(m,K);
    for i=1:m
        %���㵽ÿ�����ģ��������ľ��뱣����c��
        c=[];
        for j=1:K
            c=[c norm(temp{j}(i,:))];
        end
        [inf,index]=min(c);
        tag(i,index)=1;      %�������ĳһ�������һ�б��1
    end
    
    %����ȷ����������
    for i=1:K
        for j=1:n
            p(i,j)=sum(tag(:,i).*data(:,j))/sum(tag(:,i));
        end
    end
    
    %��ֹ���������������ĵ㲻�ٷ����仯ʱ����ֹ����
    if(norm(preu-p)<0.0001)
        break;
    end
end
%% ������Ժ���ȷ��ÿ�����Ԫ�����
re=[];
for i=1:m
    tmp=[];
    for j=1:K
        tmp=[tmp norm(data(i,:)-p(j,:))];
    end
    [~, index]=min(tmp);
    re=[re;data(i,:) index];
end












