%%
clc;
clear;
close all

%%
k=4;
parameter=[];
result=[];
nsample=200000;
ka=normrnd(0.39,0.015,[nsample,1]);
ec=normrnd(0.75,0.08,[nsample,1]);
cu=normrnd(0.28,0.01,[nsample,1]);
p=normrnd(11.5,0.6,[nsample,1]);
C=ka<0.4;
B=~C;
result(C)=0.1*(1-(2.5671-2.2649./(ka(C).^0.054381)).^0.83.*(ec(C).*cu(C)./p(C)).^(1/3)).^(-9.3);
result(B)=0.1*(1-(2.5671-1.9987./(ka(B).^0.19087)).^0.83.*(ec(B).*cu(B)./p(B)).^(1/3)).^(-9.3);
parameter=[ka ec cu p];
for i=1:k
    measure_CRE(i)=mutual_CRE2(parameter(:,i)',result);
end

%% 

% cumu_res_entropy(ka')/mean(ka)
% cumu_res_entropy(ec')/mean(ec)
% cumu_res_entropy(cu')/mean(cu)
% cumu_res_entropy(p')/mean(p)
% 
% var(ka')/mean(ka)
% var(ec')/mean(ec)
% var(cu')/mean(cu)
% var(p')/mean(p)
% 
% std(ka')/cumu_res_entropy(ka')