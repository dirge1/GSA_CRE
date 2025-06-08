function result=tri_CRE2(g,x,y)
A=cumu_res_entropy(g);
B=condition_two_CRE5(g,x,y);
result=(A-B)/A;
end