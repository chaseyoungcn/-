function view_in_six= Search(Xlmin,Xlmax,Ylmin ,Ylmax,data)
%global data_copy;
%[d1,d2]=size(data_copy);%˫�Ǻϳɺ����ݣ�������
% data=load('��ֵ�ָ�_˫���ں�_������.mat');
% double_star=data.star_data_4;%%ÿ����Ҫ�� ����
double_star=data;
%global double_star;%����˫���ں�����  %=data_copy;%������ֵ�ָ�������ݴ���
%���������������ǿ�
[d1,d2]=size(double_star);%˫�Ǻϳɺ����ݣ�������
%Ŀǰ���ֶ��滻
view_in=[];
for m=1:d1
    if double_star(m,2)>Xlmin && double_star(m,2)<Xlmax
        if double_star(m,3)>Ylmin && double_star(m,3)<Ylmax
            view_in=[view_in;double_star(m,:)];%ĳ����ӳ������е�����
%           disp('������')            
        end
    end           
end
[ov,pv]=size(view_in);
% ov
% pv
view_in_six=[];
if ov==0 || pv==0 % view_in=[]ʱ
%    disp('��ǰ����ӳ��޵�����')
    
else
    view_in_sort=sortrows(view_in,d2);%���ǵ�����  %4,d2
    [o,~]=size(view_in_sort);
%    view_in_six=[];
    if o>6
        o=6;
    end    
    view_in_six=[view_in_six;view_in_sort(1:o,:)];%ȡ�ǵ�ǰ���ĵ�����
end
% for i=1:ov
%     view_in(i,4)=view_in(i,4)*10;
% end
% 
% view_in_sort=sortrows(view_in,4);%���ǵ�����  %4,d2


end

