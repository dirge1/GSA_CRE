function result=mutual_CRE2(g,x)
% A=cumu_res_entropy(g)/mean(g);
% B=condition_CRE(g,x)/mean(g);
A=cumu_res_entropy(g);
B=condition_CRE4(g,x);
result=(A-B)/A;
end