clear all;
clc
close all;
FOV=20;%�ӽ� 
%������ӳ����Ƕ�ɸѡ
%function random_view(FOV)%����ӳ�  ѡ������ǰ6����   �ǿ��Ʊ�
tic %ʱ����ʼ
view=FOV;
star_star=[];
star_lib_total=[];
data=load('������_20_��ֵ�ָ�_˫���ں�.mat'); 
data=data.star_star;%���ĸ����ݵ��ǿ�?
for i =1 :1000000
    %W=rand(2,1,'single'); %Yr=W(2);
    %һ������,ĳ����ӳ�����//(ѡ�����)Ҳ���������½�//��Xr,Yr���������Χ�ڳྭ=��0+view/2,360-view/2),��γ=(-90+view/2,90-view/2)
    Xr=rand*(360-view)+view/2;
    Yr=( -1 + (1+1).*rand )*(90-view/2);    
    Xlmin=Xr-view/2;
    Xlmax=Xr+view/2;
    %Yl=(Yr-view/2,Yr+view/2);
    Ylmin=Yr-view/2;
    Ylmax=Yr+view/2;%�ָ����������ӳ���Χ
    star_lighting=Search(Xlmin,Xlmax,Ylmin ,Ylmax,data);%Ѱ�����������㷶Χ�����ǣ��������ȸߵͷ���������������Ϣ
    star_lib=star_lib_make(star_lighting);%�����ӳ��������� �ǿ� ��ֵ������star_lib  ���ǶԶ�ɸѡ     
    star_lib_total=[star_lib_total;star_lib];
    star_lib_total=unique(star_lib_total,'rows'); %�������ǶԿ� ��ţ�С�� ��ţ��� �Ǿ�ֵ
    star_star=[star_star;star_lighting];%���еĵ�����
    star_star=unique(star_star,'rows');%�洢��һ��ȫ�¾���ɾ���ظ�
end
star_lib_total=sortrows(star_lib_total,3);%���ǽǾ��С��������
[Yn,~]=size(star_lib_total);
% n=(star_lib_total(Yn,3)-star_lib_total(1,3))/0.0002;%���0.0002
% n=floor(n);
% K_vector=make_K_vector(star_lib_total,n); %����K�������ұ�  �ɼ����޸� ������n=5000 ;K�����������ֶ�
plot_earth(star_star)% �����е����� δ֪���� չʾΪ ��άɢ��ͼ
toc %��ʱֹͣ
%end

% (��������Ǳ�)12(20du)       �����Ǹ���(star_star) �����ǶԶ���(star_lib_total)   �ǿ��С
%��ֵ�ָ�+�Ƕ�ɸѡ��               3885(1881)           45304(21492)                 512KB(247KB)    
%��ֵ�ָ�+˫���ں�+�Ƕ�ɸѡ	       3022(1717)           33583(19798)                 328KB(227KB)
%��ֵ�ָ�+˫���ں�                 3280
%��ֵ�ָ�                          4856
%δ������Ľ����Ǳ�                4908