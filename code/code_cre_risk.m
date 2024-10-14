clear;clc;close all
tt=2000:1000:100000;
for kk=1:length(tt)
    nsample=tt(kk);
    m=2; % mean
    ef=2;
    sigma=log(ef)/1.64485;
    mu=log(m)-sigma^2/2;
    x1 = lognrnd(mu,sigma,[1,nsample]);
    
    m=3; % mean
    ef=2;
    sigma=log(ef)/1.64485;
    mu=log(m)-sigma^2/2;
    x2 = lognrnd(mu,sigma,[1,nsample]);
    
    m=0.001; % mean
    ef=2;
    sigma=log(ef)/1.64485;
    mu=log(m)-sigma^2/2;
    x3 = lognrnd(mu,sigma,[1,nsample]);
    
    m=0.002; % mean
    ef=2;
    sigma=log(ef)/1.64485;
    mu=log(m)-sigma^2/2;
    x4 = lognrnd(mu,sigma,[1,nsample]);
    
    m=0.004; % mean
    ef=2;
    sigma=log(ef)/1.64485;
    mu=log(m)-sigma^2/2;
    x5 = lognrnd(mu,sigma,[1,nsample]);
    
    m=0.005; % mean
    ef=2;
    sigma=log(ef)/1.64485;
    mu=log(m)-sigma^2/2;
    x6 = lognrnd(mu,sigma,[1,nsample]);
    
    m=0.003; % mean
    ef=2;
    sigma=log(ef)/1.64485;
    mu=log(m)-sigma^2/2;
    x7 = lognrnd(mu,sigma,[1,nsample]);
    
    g=x1.*x3.*x5+x1.*x3.*x6+x1.*x4.*x5+x1.*x4.*x6+x2.*x3.*x4+x2.*x3.*x5+...
        x2.*x4.*x5+x2.*x5.*x6+x2.*x4.*x7+x2.*x6.*x7;
    train=[x1;x2;x3;x4;x5;x6;x7;g];
    tic
    [W{kk},flag{kk},U1{kk},U2{kk},S{kk},R{kk},T{kk},TT{kk}]=ZL_CRE2(train);
    Time(kk)=toc;
    %     [W{kk}]=ZL_CRE3(train);
end
%%
for kk=1:length(tt)
    W1(kk)=W{kk}(1);
    W2(kk)=W{kk}(2);
    W3(kk)=W{kk}(3);
    W4(kk)=W{kk}(4);
    W5(kk)=W{kk}(5);
    W6(kk)=W{kk}(6);
    W7(kk)=W{kk}(7);
    S_12(kk)=T{kk}(1,4);
    S_13(kk)=T{kk}(2,4);
    S_14(kk)=T{kk}(3,4);
    S_15(kk)=T{kk}(4,4);
    S_16(kk)=T{kk}(5,4);
    S_17(kk)=T{kk}(6,4);
    S_23(kk)=T{kk}(7,4);
    S_24(kk)=T{kk}(8,4);
    S_25(kk)=T{kk}(9,4);
    S_26(kk)=T{kk}(10,4);
    S_27(kk)=T{kk}(11,4);
    S_34(kk)=T{kk}(12,4);
    S_35(kk)=T{kk}(13,4);
    S_36(kk)=T{kk}(14,4);
    S_37(kk)=T{kk}(15,4);
    S_45(kk)=T{kk}(16,4);
    S_46(kk)=T{kk}(17,4);
    S_47(kk)=T{kk}(18,4);
    S_56(kk)=T{kk}(19,4);
    S_57(kk)=T{kk}(20,4);
    S_67(kk)=T{kk}(21,4);
    P(kk)=1-sum(W{kk})-sum(T{kk}(:,4));
end
%%

fosize=16;
width=2;
figure
ggThemePlot(gca,'pale');
plot(tt,W1,'-o','color',[0 114 189]/255,'linewidth',width)
hold on;
plot(tt,W2,'-h','color',[255 201 14]/255,'linewidth',width)
plot(tt,W3,'->','color',[126 47 142]/255,'linewidth',width)
plot(tt,W4,'-d','color',[217 83 25]/255,'linewidth',width)
plot(tt,W5,'-s','color',[119 172 48]/255,'linewidth',width)
plot(tt,W6,'-*','color',[128 128 128]/255,'linewidth',width)
plot(tt,W7,'-p','color',[255 127 39]/255,'linewidth',width)
% xlim([0,6e5])
leg=legend('X1','X2','X3','X4','X5','X6','X7');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
% set(gca,'ytick',-0.2:0.2:1)
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('Sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\kappa ','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
%%

fosize=16;
width=2;
figure
ggThemePlot(gca,'pale');
plot(tt,S_12,'-o','color',[0 114 189]/255,'linewidth',width)
hold on;
plot(tt,S_13,'-h','color',[255 201 14]/255,'linewidth',width)
plot(tt,S_14,'->','color',[126 47 142]/255,'linewidth',width)
plot(tt,S_15,'-d','color',[217 83 25]/255,'linewidth',width)
plot(tt,S_16,'-s','color',[119 172 48]/255,'linewidth',width)
plot(tt,S_17,'-*','color',[128 128 128]/255,'linewidth',width)
% plot(tt,S_23,'-h','color',[255 201 14]/255,'linewidth',width)
% plot(tt,S_24,'->','color',[126 47 142]/255,'linewidth',width)
% plot(tt,S_25,'-d','color',[217 83 25]/255,'linewidth',width)
% plot(tt,S_26,'-s','color',[119 172 48]/255,'linewidth',width)
% plot(tt,S_27,'-*','color',[128 128 128]/255,'linewidth',width)
% plot(tt,S_34,'->','color',[126 47 142]/255,'linewidth',width)
% plot(tt,S_35,'-d','color',[217 83 25]/255,'linewidth',width)
% plot(tt,S_36,'-s','color',[119 172 48]/255,'linewidth',width)
% plot(tt,S_37,'-*','color',[128 128 128]/255,'linewidth',width)
% plot(tt,S_45,'-d','color',[217 83 25]/255,'linewidth',width)
% plot(tt,S_46,'-s','color',[119 172 48]/255,'linewidth',width)
% plot(tt,S_47,'-*','color',[128 128 128]/255,'linewidth',width)
% plot(tt,S_56,'-s','color',[119 172 48]/255,'linewidth',width)
% plot(tt,S_57,'-*','color',[128 128 128]/255,'linewidth',width)
% plot(tt,S_67,'-*','color',[128 128 128]/255,'linewidth',width)
% ylim([-0.15,1])
leg=legend('X1-X2','X1-X3','X1-X4','X1-X5','X1-X6','X1-X7');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
% set(gca,'ytick',-0.2:0.2:1)
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('Sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\kappa ','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');

% save('0822-sin_result_Rcu.mat')
%%
fosize=24;
HH=[W{end} T{end}(:,4)'];
HH=[HH 1-sum(HH)];
% pie(HH)
%%
figure
hh=pie(HH,{'X1: '+string(roundn(100*HH(1)/sum(HH),-2))+'%',...
    'X2: '+string(roundn(100*HH(2)/sum(HH),-2))+'%',...
    'X3: '+string(roundn(100*HH(3)/sum(HH),-2))+'%',...
    'X4: '+string(roundn(100*HH(4)/sum(HH),-2))+'%',...
    'X5: '+string(roundn(100*HH(5)/sum(HH),-2))+'%',...
    'X6: '+string(roundn(100*HH(6)/sum(HH),-2))+'%',...
    'X7: '+string(roundn(100*HH(7)/sum(HH),-2))+'%',...
    'X1-X2 '+string(roundn(100*HH(8)/sum(HH),-2))+'%',...
    'X1-X3 '+string(roundn(100*HH(9)/sum(HH),-2))+'%',...
    'X1-X4 '+string(roundn(100*HH(10)/sum(HH),-2))+'%',...
    'X1-X5 '+string(roundn(100*HH(11)/sum(HH),-2))+'%',...
    'X1-X6 '+string(roundn(100*HH(12)/sum(HH),-2))+'%',...
    'X1-X7 '+string(roundn(100*HH(13)/sum(HH),-2))+'%',...
    'X2-X3 '+string(roundn(100*HH(14)/sum(HH),-2))+'%',...
    'X2-X4 '+string(roundn(100*HH(15)/sum(HH),-2))+'%',...
    'X2-X5 '+string(roundn(100*HH(16)/sum(HH),-2))+'%',...
    'X2-X6 '+string(roundn(100*HH(17)/sum(HH),-2))+'%',...
    'X2-X7 '+string(roundn(100*HH(18)/sum(HH),-2))+'%',...
    'X3-X4 '+string(roundn(100*HH(19)/sum(HH),-2))+'%',...
    'X3-X5 '+string(roundn(100*HH(20)/sum(HH),-2))+'%',...
    'X3-X6 '+string(roundn(100*HH(21)/sum(HH),-2))+'%',...
    'X3-X7 '+string(roundn(100*HH(22)/sum(HH),-2))+'%',...
    'X4-X5 '+string(roundn(100*HH(23)/sum(HH),-2))+'%',...
    'X4-X6 '+string(roundn(100*HH(24)/sum(HH),-2))+'%',...
    'X4-X7 '+string(roundn(100*HH(25)/sum(HH),-2))+'%',...
    'X5-X6 '+string(roundn(100*HH(26)/sum(HH),-2))+'%',...
    'X5-X7 '+string(roundn(100*HH(27)/sum(HH),-2))+'%',...
    'X6-X7 '+string(roundn(100*HH(28)/sum(HH),-2))+'%',...
    'Higher-order contribution: '+string(roundn(100*HH(29)/sum(HH),-2))+'%'});% »æÖÆ±ýÍ¼
hh(2).FontSize = fosize;
hh(4).FontSize = fosize;
hh(6).FontSize = fosize;
hh(8).FontSize = fosize;
hh(10).FontSize = fosize;
hh(12).FontSize = fosize;
hh(14).FontSize = fosize;
hh(16).FontSize = fosize;
hh(18).FontSize = fosize;
hh(20).FontSize = fosize;
hh(22).FontSize = fosize;
hh(24).FontSize = fosize;
hh(26).FontSize = fosize;
hh(28).FontSize = fosize;
hh(30).FontSize = fosize;
hh(32).FontSize = fosize;
hh(34).FontSize = fosize;
hh(36).FontSize = fosize;
hh(38).FontSize = fosize;
hh(40).FontSize = fosize;
hh(42).FontSize = fosize;
hh(44).FontSize = fosize;
hh(46).FontSize = fosize;
hh(48).FontSize = fosize;
hh(50).FontSize = fosize;
hh(52).FontSize = fosize;
hh(54).FontSize = fosize;
hh(56).FontSize = fosize;
hh(58).FontSize = fosize;
hh(2).FontName = 'Times New Roman';
hh(4).FontName = 'Times New Roman';
hh(6).FontName = 'Times New Roman';
hh(8).FontName = 'Times New Roman';
hh(10).FontName = 'Times New Roman';
hh(12).FontName = 'Times New Roman';
hh(14).FontName = 'Times New Roman';
hh(16).FontName = 'Times New Roman';
hh(18).FontName = 'Times New Roman';
hh(20).FontName = 'Times New Roman';
hh(22).FontName = 'Times New Roman';
hh(24).FontName = 'Times New Roman';
hh(26).FontName = 'Times New Roman';
hh(28).FontName = 'Times New Roman';
hh(30).FontName = 'Times New Roman';
hh(32).FontName = 'Times New Roman';
hh(34).FontName = 'Times New Roman';
hh(36).FontName = 'Times New Roman';
hh(38).FontName = 'Times New Roman';
hh(40).FontName = 'Times New Roman';
hh(42).FontName = 'Times New Roman';
hh(44).FontName = 'Times New Roman';
hh(46).FontName = 'Times New Roman';
hh(48).FontName = 'Times New Roman';
hh(50).FontName = 'Times New Roman';
hh(52).FontName = 'Times New Roman';
hh(54).FontName = 'Times New Roman';
hh(56).FontName = 'Times New Roman';
hh(58).FontName = 'Times New Roman';
set(gcf,'unit','centimeters','position',[0 0 56 42]);
% % set(hh,'fontsize',16,'fontname','Times New Roman');
%%
clear;clc;
nsample=20000;
m=2; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x1 = lognrnd(mu,sigma,[1,nsample]);

m=3; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x2 = lognrnd(mu,sigma,[1,nsample]);

m=0.001; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x3 = lognrnd(mu,sigma,[1,nsample]);

m=0.002; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x4 = lognrnd(mu,sigma,[1,nsample]);

m=0.004; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x5 = lognrnd(mu,sigma,[1,nsample]);

m=0.005; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x6 = lognrnd(mu,sigma,[1,nsample]);

m=0.003; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x7 = lognrnd(mu,sigma,[1,nsample]);

g=x1.*x3.*x5+x1.*x3.*x6+x1.*x4.*x5+x1.*x4.*x6+x2.*x3.*x4+x2.*x3.*x5+...
    x2.*x4.*x5+x2.*x5.*x6+x2.*x4.*x7+x2.*x6.*x7;
train=[x1;x2;x3;x4;x5;x6;x7;g];
MI=enty_measure(train,g);
%%
clear;clc;
nsample=10000;
m=2; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x1 = lognrnd(mu,sigma,[1,nsample]);

m=3; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x2 = lognrnd(mu,sigma,[1,nsample]);

m=0.001; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x3 = lognrnd(mu,sigma,[1,nsample]);

m=0.002; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x4 = lognrnd(mu,sigma,[1,nsample]);

m=0.004; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x5 = lognrnd(mu,sigma,[1,nsample]);

m=0.005; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x6 = lognrnd(mu,sigma,[1,nsample]);

m=0.003; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x7 = lognrnd(mu,sigma,[1,nsample]);

g=x1.*x3.*x5+x1.*x3.*x6+x1.*x4.*x5+x1.*x4.*x6+x2.*x3.*x4+x2.*x3.*x5+...
    x2.*x4.*x5+x2.*x5.*x6+x2.*x4.*x7+x2.*x6.*x7;
z=[x1' x2' x3' x4' x5' x6' x7'];
measure_delta=Borgonovo_measure(z,g');
%%
%·½²î²â¶È
clear;clc;
nsample=10000;

for o=1:1000
    o
m=2; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x1 = lognrnd(mu,sigma,[1,nsample]);
xx1 = lognrnd(mu,sigma,[1,nsample]);

m=3; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x2 = lognrnd(mu,sigma,[1,nsample]);
xx2 = lognrnd(mu,sigma,[1,nsample]);

m=0.001; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x3 = lognrnd(mu,sigma,[1,nsample]);
xx3 = lognrnd(mu,sigma,[1,nsample]);

m=0.002; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x4 = lognrnd(mu,sigma,[1,nsample]);
xx4 = lognrnd(mu,sigma,[1,nsample]);

m=0.004; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x5 = lognrnd(mu,sigma,[1,nsample]);
xx5 = lognrnd(mu,sigma,[1,nsample]);

m=0.005; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x6 = lognrnd(mu,sigma,[1,nsample]);
xx6 = lognrnd(mu,sigma,[1,nsample]);

m=0.003; % mean
ef=2;
sigma=log(ef)/1.64485;
mu=log(m)-sigma^2/2;
x7 = lognrnd(mu,sigma,[1,nsample]);
xx7 = lognrnd(mu,sigma,[1,nsample]);


g=x1.*x3.*x5+x1.*x3.*x6+x1.*x4.*x5+x1.*x4.*x6+x2.*x3.*x4+x2.*x3.*x5+...
    x2.*x4.*x5+x2.*x5.*x6+x2.*x4.*x7+x2.*x6.*x7;
gg=xx1.*xx3.*xx5+xx1.*xx3.*xx6+xx1.*xx4.*xx5+xx1.*xx4.*xx6+xx2.*xx3.*xx4+xx2.*xx3.*xx5+...
    xx2.*xx4.*xx5+xx2.*xx5.*xx6+xx2.*xx4.*xx7+xx2.*xx6.*xx7;

k=7;
v=[x1' x2' x3' x4' x5' x6' x7' xx1' xx2' xx3' xx4' xx5' xx6' xx7'];
A=[g';gg'];
y_mean = mean(A);
D = mean(A.^2)-y_mean.^2;
for i=1:k
    z=[];
    z=[v(:,k+1:k+i-1) v(:,i) v(:,k+i+1:2*k)];
    
    x1_i=z(:,1)';
    x2_i=z(:,2)';
    x3_i=z(:,3)';
    x4_i=z(:,4)';
    x5_i=z(:,5)';
    x6_i=z(:,6)';
    x7_i=z(:,7)';
    g_i{i}=x1_i.*x3_i.*x5_i+x1_i.*x3_i.*x6_i+x1_i.*x4_i.*x5_i+x1_i.*x4_i.*x6_i+x2_i.*x3_i.*x4_i+x2_i.*x3_i.*x5_i+...
        x2_i.*x4_i.*x5_i+x2_i.*x5_i.*x6_i+x2_i.*x4_i.*x7_i+x2_i.*x6_i.*x7_i;
end
for i=1:k
    S(i,o)=mean(g.*(g_i{i}-gg))/D;
    ST(i,o)=mean((g_i{i}-gg).^2)/D/2;
end
end
measure_S=mean(S,2);
measure_ST=mean(ST,2);