function result=condition_CRE4(y,x)
[X,b1]=sort(x);
nsample=length(x);
delta = nsample^(-1/5)*std(x);
ran=max(x)-min(x);
T=ran/delta;
w=round(nsample/T);
w=500;
% if w<2000
%     w=2000;
% end
o=0;
for i=1:w:nsample-1
    o=o+1;
    try
        hh(o)=cumu_res_entropy(y(b1(i:i+w-1)));
    catch
        break;
    end
end
result=mean(hh);
end