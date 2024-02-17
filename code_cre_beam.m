clear;clc;close all
% rng(10000)% random seed

tt=2000:1000:100000;
for kk=1:length(tt)
    nsample=tt(kk);       % no of random samples to be drawn
    nvar=6;             % no of variables
    xmean=[226.8 453.6 200e9 0.062 0.0987 2.54];    % mean
    xsd=[0.2*226.8   0.1*453.6  0.05*200e9   0.08*0.062    0.08*0.0987   0.08*2.54];    % std. deviation
    pwt=0;
    pwL=0;%0.3
    ptL=0;%0.3
    corr=[
        1.00  0    0     0       0     0
        0    1.00  0     0       0     0
        0    0     1.00  0       0     0
        0    0     0     1.00   pwt  pwL
        0    0     0     pwt   1.00  ptL
        0    0     0    pwL  ptL   1.00];
    
    z=lhs_stein(xmean,xsd,corr,nsample);
    gd=z;
    fx=gd(:,1)';
    fy=gd(:,2)';
    E=gd(:,3)';
    w=gd(:,4)';
    t=gd(:,5)';
    L=gd(:,6)';
    g=4*L.^3./(E.*w.*t).*(((fx./w.^2).^2+(fy./t.^2).^2).^0.5);
    
    train=[fx;fy;E;w;t;L;g];
    tic
    [W{kk},flag{kk},U1{kk},U2{kk},S{kk},R{kk},T{kk},TT{kk}]=ZL_CRE2(train);
    Time(kk)=toc;
end
% clearvars -except W flag U1 U2 S R T TT nsample xmean xsd corr Time
%% 
for kk=1:length(tt)
    for i=1:nvar
    if T{kk}(i,4)<0
        T{kk}(i,4)=0;
    end
    end
end
for kk=1:length(tt)
    W1(kk)=W{kk}(1);
    W2(kk)=W{kk}(2);
    W3(kk)=W{kk}(3);
    W4(kk)=W{kk}(4);
    W5(kk)=W{kk}(5);
    W6(kk)=W{kk}(6);
    S_12(kk)=T{kk}(1,4);
    S_13(kk)=T{kk}(2,4);
    S_14(kk)=T{kk}(3,4);
    S_15(kk)=T{kk}(4,4);
    S_16(kk)=T{kk}(5,4);
    S_23(kk)=T{kk}(6,4);
    S_24(kk)=T{kk}(7,4);
    S_25(kk)=T{kk}(8,4);
    S_26(kk)=T{kk}(9,4);
    S_34(kk)=T{kk}(10,4);
    S_35(kk)=T{kk}(11,4);
    S_36(kk)=T{kk}(12,4);
    S_45(kk)=T{kk}(13,4);
    S_46(kk)=T{kk}(14,4);
    S_56(kk)=T{kk}(15,4);
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
% xlim([0,6e5])
leg=legend('\itFx','\itFy','\itE','\itw','\itt','\itL');
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
plot(tt,S_15,'-o','color',[0 114 189]/255,'linewidth',width)
hold on;
plot(tt,S_16,'-h','color',[255 201 14]/255,'linewidth',width)
plot(tt,S_45,'->','color',[126 47 142]/255,'linewidth',width)
plot(tt,S_46,'-d','color',[217 83 25]/255,'linewidth',width)
plot(tt,S_56,'-s','color',[119 172 48]/255,'linewidth',width)
leg=legend('\itFx-\itt','\itFx-\itL','\itw-\itt','\itw-\itL','\itt-\itL');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
% set(gca,'ytick',-0.2:0.2:1)
ylim([0,0.2])
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('Sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\kappa ','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
%%
fosize=24;
HH=[W{end} T{end}(:,4)'];
HH=[HH 1-sum(W{end})-sum(T{end}(:,4))];
figure
hh=pie(HH,{'Fx: '+string(roundn(100*HH(1)/sum(HH),-2))+'%',...
    'Fy: '+string(roundn(100*HH(2)/sum(HH),-2))+'%',...
    'E: '+string(roundn(100*HH(3)/sum(HH),-2))+'%',...
    'w: '+string(roundn(100*HH(4)/sum(HH),-2))+'%',...
    't: '+string(roundn(100*HH(5)/sum(HH),-2))+'%',...
    'L: '+string(roundn(100*HH(6)/sum(HH),-2))+'%',...
    'Fx-Fy: '+string(roundn(100*HH(7)/sum(HH),-2))+'%',...
    'Fx-E: '+string(roundn(100*HH(8)/sum(HH),-2))+'%',...
    'Fx-w: '+string(roundn(100*HH(9)/sum(HH),-2))+'%',...
    'Fx-t: '+string(roundn(100*HH(10)/sum(HH),-2))+'%',...
    'Fx-L: '+string(roundn(100*HH(11)/sum(HH),-2))+'%',...
    'Fy-E: '+string(roundn(100*HH(12)/sum(HH),-2))+'%',...
    'Fy-w: '+string(roundn(100*HH(13)/sum(HH),-2))+'%',...
    'Fy-t: '+string(roundn(100*HH(14)/sum(HH),-2))+'%',...
    'Fy-L: '+string(roundn(100*HH(15)/sum(HH),-2))+'%',...
    'E-w: '+string(roundn(100*HH(16)/sum(HH),-2))+'%',...
    'E-t: '+string(roundn(100*HH(17)/sum(HH),-2))+'%',...
    'E-L: '+string(roundn(100*HH(18)/sum(HH),-2))+'%',...
    'w-t: '+string(roundn(100*HH(19)/sum(HH),-2))+'%',...
    'w-L: '+string(roundn(100*HH(20)/sum(HH),-2))+'%',...
    't-L: '+string(roundn(100*HH(21)/sum(HH),-2))+'%',...
    'Higher-order contribution: '+string(roundn(100*HH(22)/sum(HH),-2))+'%'});% »æÖÆ±ýÍ¼
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
set(gcf,'unit','centimeters','position',[0 0 56 42]);
% set(hh,'fontsize',16,'fontname','Times New Roman');