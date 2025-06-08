clear;clc;close all
% rng(10000)
tt=2000:1000:100000;
for kk=1:length(tt)
    nvar=3;
    a=5;
    b=1;
    nsample=tt(kk);
    
    z=rand([nsample,3])*2*pi-pi;
    x1=z(:,1)';
    x2=z(:,2)';
    x3=z(:,3)';
    g=fun_sin(x1,x2,x3,a,b);
    train=[x1;x2;x3;g];
    tic
    [W{kk},flag{kk},U1{kk},U2{kk},S{kk},R{kk},T{kk},TT{kk}]=ZL_CRE2(train);
    Time(kk)=toc;
end
for kk=1:length(tt)
    for i=1:3
    if T{kk}(i,4)<0
        T{kk}(i,4)=0;
    end
    end
end
for kk=1:length(tt)
    W1(kk)=W{kk}(1);
    W2(kk)=W{kk}(2);
    W3(kk)=W{kk}(3);
    S_1(kk)=T{kk}(1,4);
    S_2(kk)=T{kk}(2,4);
    S_3(kk)=T{kk}(3,4);
    P(kk)=1-W1(kk)-W2(kk)-W3(kk)-S_1(kk)-S_2(kk)-S_3(kk);
end
clearvars -except tt a b W1 W2 W3 S_1 S_2 S_3 P Time T W
%% 
% load('result-sin-b1.mat')
fosize=16;
width=2;
figure
% ggThemePlot(gca,'pale');
plot(tt,W1,'-o','color',[0 114 189]/255,'linewidth',width)
hold on;
plot(tt,W2,'-h','color',[255 201 14]/255,'linewidth',width)
plot(tt,W3,'->','color',[126 47 142]/255,'linewidth',width)
plot(tt,S_1,'-d','color',[217 83 25]/255,'linewidth',width)
plot(tt,S_2,'-s','color',[119 172 48]/255,'linewidth',width)
plot(tt,S_3,'-*','color',[128 128 128]/255,'linewidth',width)
% xlim([0,6.5e5])
leg=legend('x1','x2','x3','x1-x2','x1-x3','x2-x3');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
% set(gca,'ytick',-0.2:0.2:1)
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('Sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\kappa ','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
%% 
fosize=24;
HH=[W{end} T{end}(:,4)' P(end)];
figure
hh=pie(HH,{'x1: '+string(roundn(100*HH(1)/sum(HH),-2))+'%',...
                    'x2: '+string(roundn(100*HH(2)/sum(HH),-2))+'%',...
                    'x3: '+string(roundn(100*HH(3)/sum(HH),-2))+'%',...
                    'x1-x2: '+string(roundn(100*HH(4)/sum(HH),-2))+'%',...
                    'x1-x3: '+string(roundn(100*HH(5)/sum(HH),-2))+'%',...
                    'x2-x3: '+string(roundn(100*HH(6)/sum(HH),-2))+'%',...
                    'x1-x2-x3: '+string(roundn(100*HH(7)/sum(HH),-2))+'%'});% »æÖÆ±ýÍ¼
hh(2).FontSize = fosize;
hh(4).FontSize = fosize;
hh(6).FontSize = fosize;
hh(8).FontSize = fosize;
hh(10).FontSize = fosize;
hh(12).FontSize = fosize;
hh(14).FontSize = fosize;

hh(2).FontName = 'Times New Roman';
hh(4).FontName = 'Times New Roman';
hh(6).FontName = 'Times New Roman';
hh(8).FontName = 'Times New Roman';
hh(10).FontName = 'Times New Roman';
hh(12).FontName = 'Times New Roman';
hh(14).FontName = 'Times New Roman';
set(gcf,'unit','centimeters','position',[0 0 56 42]);
% set(hh,'fontsize',16,'fontname','Times New Roman');   