clear all;
close all;  %���� ĳ�ǿ�K����������Ƕ���Ŀ���ǽǾ�֮��Ĺ�ϵͼ
clc
%         ���뵼���ǿ�
load('�ǿ�_12_��ֵ�ָ�_�Ƕ�ɸѡ.mat','star_lib_total');
%load('�ǿ�_20_��ֵ�ָ�_˫���ں�_�Ƕ�ɸѡ.mat','star_lib_total');
% ����(����)K����
% load('K_vector(�ǿ�12 ��ֵ�ָ�  D=0.01).mat','K_vector')

% ����K����
D=0.1;
[Yn,~]=size(star_lib_total);
n=((star_lib_total(Yn,3)-star_lib_total(1,3))/D)+1;%���0.0002  �ֳ�500�� ��Ҫn=500+1
n=floor(n);
K_vector=make_K_vector(star_lib_total,n); %����K�������ұ�  �ɼ����޸� ������n=5000 ;K�����������ֶ�
figure(1)
Star_a_d_pair(K_vector,star_lib_total,D)