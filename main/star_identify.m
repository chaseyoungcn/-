%star_identify.m
clear all
clc
close all;
%ƥ��Ĺ۲������β�ȫ
global K_vector;
global star_lib_total;
global b_cell;

%����Ը��ļ�
readxls; %b_cellΪ��ȡ��ÿ���ļ�num_of_files,filename_1

%���뵼���ǿ�
% load('�ǿ�_12_��ֵ�ָ�_�Ƕ�ɸѡ.mat','star_lib_total'
% ����(����)K����
% load('K_vector(�ǿ�12 ��ֵ�ָ�  D=0.01).mat','K_vector')

%����K����
% [Yn,~]=size(star_lib_total);
% n=((star_lib_total(Yn,3)-star_lib_total(1,3))/0.01)+1;%���0.0002  �ֳ�500�� ��Ҫn=500+1
% n=floor(n);
% K_vector=make_K_vector(star_lib_total,n); %����K�������ұ�  �ɼ����޸� ������n=5000 ;K�����������ֶ�

global D;
D=0.001;
% load('K_test_12˫��.mat','K_vector')

list_final=[];
for i=1:num_of_files
    i=8;
    if i>0 &&i<7            %������
                            %����12du�����ǿ�
        load('�ǿ�_12_��ֵ�ָ�_�Ƕ�ɸѡ.mat','star_lib_total')
                            % ����(����)K����
        load('K_vector(�ǿ�12 ��ֵ�ָ�  D=0.01).mat','K_vector')%
        D=0.01;
        N=512;
        FOV=12;
%         mm=mm+1;
    else
        %����20du�����ǿ�  ��һ�������� ��һ��K������...
        load('�ǿ�_20_��ֵ�ָ�_˫���ں�_�Ƕ�ɸѡ.mat','star_lib_total')    
        % ����(����)��ӦK����
        load('K_vector(�ǿ�20_��ֵ�ָ�_˫���ں�_�Ƕ�ɸѡ  D=0.007).mat','K_vector')
        N=1024;
        FOV=20;
        D=0.007;
%         nn=nn+1;
    end


          List=matching(filename_all{i,1},N,FOV);%filename{i,1}%%�����ٸĸ�  ����  20�ȵ����  ��д��if
%           List_1=List;
          %List_2=List;
     for jj=1:10000      
         if isempty(find(List(:,2)==-1)) %��-1ʱ            
             break;
         else
              List_1=matching(filename_all{i,1},N,FOV);
              List=List_fit(List,List_1);
         end        
     end
        
    SL=size(List,1);
    List_cell=cell(SL,2);
    for ii=1:SL  %�滻�ɹ�  �õ�List_cell
        List_cell{ii,2}=List(ii,2);
        List_cell{ii,1}=b_cell{List(ii,1),1};
    end
    list_final=[list_final;List_cell];
end


%ѭ������ÿһ�ļ�ƥ��List(��ת��Ϊ��ɵ� ����+���)
%�浽ϸ������
%��ӡ���

% 9.23  11.27  
%20�ǿ��Ʊ� bingo
%δ����� 
%����ͼ

