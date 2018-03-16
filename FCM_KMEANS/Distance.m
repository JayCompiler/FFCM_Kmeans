function dis=Distance(x,y,opt)
%% 选择1时，计算欧几里得距离(Euclidean Distance)
if opt==1
    dis=sqrt(sum((x-y).^2));
    %选择2时，曼哈顿距离(Manhattan Distance)
elseif opt==2
        dis=sum(abs(x-y));
        %选择3时，切比雪夫距离 ( Chebyshev Distance )
elseif opt==3
    dis=max(abs(x-y));
end
   
    