 %�����ྭ��γͼ
 %�������� �ڶ�����Ϊ�ྭ��γ
function   plot_earth(data)
X = data(:,2);
Y = data(:,3);
sz = 15;
scatter(X, Y,sz,'filled')    
grid on;
set(gca,'GridLineStyle','-','GridColor','k','GridAlpha',1);%
title('�����Ƿֲ�ʾ��ͼ')
xlabel('�ྭ/��')
ylabel('��γ/��')
end