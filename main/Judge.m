function Flag_linear= Judge(c) %ֱ��Flag_linear=1 ����ֱ��Flag_linear=0
global b_cell;
Angle_error=1;%�ٶ��Ƕ����Ϊ1��
% b_cell{c(1),4};   %Ϊ ��j k L�������������еĵ�λ����
% b_cell{c(2),4};
% b_cell{c(3),4};
vv1=b_cell{c(2),4}-b_cell{c(1),4};
vv2=b_cell{c(3),4}-b_cell{c(1),4};
al=acos(dot(vv1,vv2)/(norm(vv1)*norm(vv2)));
al=al/pi*180;
if (al>=0 && al<0+Angle_error)||(al>180-Angle_error && al<=180)
    Flag_linear=1;
else
Flag_linear=0;
end
end

