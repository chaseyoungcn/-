function Obser=Observe3(N,FOV,filename) %�õ������Ǿ�
global b_cell;     %%��������
% [~,~,b_cell]=xlsread('xingtu01.xls'); %������ĳ���ļ�   %bΪcell  
[~,~,b_cell]=xlsread(filename);
pixel_size=25*(1e-3);
% N=512; %������  !!�ǵø���       %ͼ������ϵ ת��Ϊ ������
f=(N*pixel_size)/(2*tand(FOV/2));%fovΪ��

[s1,~]=size(b_cell); %b  3 X 3

for i=1:s1  %ͼ������ϵ ת��Ϊ ������ %b_cell������Ϊÿ����������з������� ���ٹ�һ��
    b_cell{i,4}=[(b_cell{i,2}-N/2)*pixel_size;
            (b_cell{i,3}-N/2)*pixel_size;
            -f];%b cell������Ϊÿ���������������
     
end

Obser=random_select(s1); %ȡ�ù۲�������  n x 3����
[size1,~]=size(Obser);
A=[];
for i=1:size1
    S1=Obser(i,1);
    S2=Obser(i,2);
    S3=Obser(i,3);
    S12=jiaoju_huduzhi(b_cell{S1,4},b_cell{S2,4});
    S13=jiaoju_huduzhi(b_cell{S1,4},b_cell{S3,4});
    S23=jiaoju_huduzhi(b_cell{S2,4},b_cell{S3,4});
    A=[A;S12,S13,S23];%�����Ǿ�
end
[sizeA1,sizeA2]=size(A);
if sizeA1~=size1 && sizeA2~=3
    disp('A�����');
end
Obser=[Obser,A];%����һ��  ObserΪ         1 2 3                 4 5 6
                %                 (�����α�ż�b_cell�к�)     (�����Ǿ�)
                %                  B_cellΪxls�ļ�ȫ��+������
          
end