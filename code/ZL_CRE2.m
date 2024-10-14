function [W,flag,U1,U2,S,R,T,TT]=ZL_CRE2(train)
%tar_x真实二变量互信息，W计算二变量互信息（用于验证计算正确性），ZL二次变量增量信息
%U1,U2,S,R信息分解结果，Rz，flag最大变量位置，T全部多变量互信息分解，TT全部多变量互信息总和
g=train(end,:);
for i=1:size(train,1)-1
    x{i}=train(i,:);
    W(i)=mutual_CRE2(g,x{i});
end
for i=1:size(train,1)-1
    for j=(i+1):size(train,1)-1
        [U1(i,j),U2(j,i),S(i,j),R(i,j)]=PID_CRE_con2(x{i},x{j},g);%对每对源变量进行信息分解
    end
end
[~,flag]=max(W);%记录互信息最大的位置

UST=[];UPT=[];RRT=[];SST=[];
for i=1:size(train,1)-1
    for j=(i+1):size(train,1)-1
        UST=[UST U1(i,j)];
        UPT=[UPT U2(j,i)];
        SST=[SST S(i,j)];
        RRT=[RRT R(i,j)];
    end
end
T=[UST;UPT;RRT;SST]';
TT=sum(T,2);
end