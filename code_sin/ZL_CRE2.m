function [W,flag,U1,U2,S,R,T,TT]=ZL_CRE2(train)
%tar_x��ʵ����������Ϣ��W�������������Ϣ��������֤������ȷ�ԣ���ZL���α���������Ϣ
%U1,U2,S,R��Ϣ�ֽ�����Rz��flag������λ�ã�Tȫ�����������Ϣ�ֽ⣬TTȫ�����������Ϣ�ܺ�
g=train(end,:);
for i=1:size(train,1)-1
    x{i}=train(i,:);
    W(i)=mutual_CRE2(g,x{i});
end
for i=1:size(train,1)-1
    for j=(i+1):size(train,1)-1
        [U1(i,j),U2(j,i),S(i,j),R(i,j)]=PID_CRE_con2(x{i},x{j},g);%��ÿ��Դ����������Ϣ�ֽ�
    end
end
[~,flag]=max(W);%��¼����Ϣ����λ��

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