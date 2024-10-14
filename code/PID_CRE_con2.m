function [U1,U2,S,R]=PID_CRE_con2(x1,x2,tar)
x1_tar=mutual_CRE2(tar,x1);
x2_tar=mutual_CRE2(tar,x2);
x12_tar=tri_CRE2(tar,x1,x2);
RMMI=min(x1_tar,x2_tar);
%Is=x1_x2/min(shannon_information(x1),shannon_information(x2));
Is=CRECC(x1,x2);
if Is<0.05
    Is=0;
end
II=x12_tar-x1_tar-x2_tar;
Rmin=max(0,-II);
R=Rmin+Is*(RMMI-Rmin);
U1=x1_tar-R;
U2=x2_tar-R;
S=x12_tar-U1-U2-R;
end