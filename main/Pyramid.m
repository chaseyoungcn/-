function Sm_1=Pyramid(ScB1,Sm)%����n�� ����һ����
%ScB1�ǹ۲������� �� ��ͼ�еı�� ��С
%SmΪ���Ӧ�ĵ����ǿ��еı�� һһ��Ӧ
global b_cell;
% global star_lib_total;
[z1,z2]=size(Sm);
B1=ScB1(1);
B2=ScB1(2);
B3=ScB1(3);
Sm_1=[];
% for zz=1:z1
%���ƥ��һ�� 
for i=1:1000000
    Flag=0;
    zz=randi(z1);
    SB1=Sm(zz,:);
    %ѭ�� 
    S1=SB1(1);%����ֵ
    S2=SB1(2);
    S3=SB1(3);%��֪��
    [s1,~]=size(b_cell); 
    S_jian=randi(s1);%����� ���ǿ�����һ��
    
    for m=1:100000
        if S_jian==B1 || S_jian==B2 || S_jian==B3
            S_jian=randi(s1);
            continue;
        end
        break;
    end
    S1j=jiaoju_huduzhi(b_cell{B1,4},b_cell{S_jian,4});  %���ǿ� �Ե�־
    S2j=jiaoju_huduzhi(b_cell{B2,4},b_cell{S_jian,4});
    S3j=jiaoju_huduzhi(b_cell{B3,4},b_cell{S_jian,4});
    %S123J=[S1j,S2j,S3j];%�����Ǿ�
    S1AJ  = search_K(S1j); %%ӦΪB1AJ
    S2AJ = search_K(S2j); 
    S3AJ  = search_K(S3j) ;
    J= search_list(S1,S1AJ);%Ѱ��B1��Ӧ��s1  i
    if ~J  %���J=false�� δsearch��
        continue;
    end        
    s2j=[S2,J];
    s2j=sort(s2j);
    Flag=Flag+ismember(s2j,S2AJ,'rows');
    %Ѱ��S2AJ������
    s3j=[S3,J];
    s3j=sort(s3j);
    Flag=Flag+ismember(s3j,S3AJ,'rows');
    %Ѱ��S3AJ������
    
    %ͨ�����˳�
    if Flag==2%ƥ����
        Sm_1=SB1;
        break;
    end
    %ͨ�����˳�
end
%%%%%%%%%%%%   
% SB1=Sm(1,:);%���flag=2��˵��������ƥ��ɹ�
% SB2=Sm(2,:);
% S1=SB1(1);
% S2=SB1(2);
% S3=SB1(3);
% [s1,~]=size(b_cell); 
% S_jian=randi(s1);%�����
% for m=1:100000
%     if S_jian==S1 || S_jian==S2 || S_jian==S3
%         S_jian=randi(s1);
%         continue;
%     end
%     break;
% end
% S1j=jiaoju_huduzhi(b_cell{S1,4},b_cell{S2,4});
% S2j=jiaoju_huduzhi(b_cell{S1,4},b_cell{S3,4});
% S3j=jiaoju_huduzhi(b_cell{S2,4},b_cell{S3,4});
% %S123J=[S1j,S2j,S3j];%�����Ǿ�
% S1AJ  = search_K(S1j); 
% S2AJ = search_K(S2j); 
% S3AJ  = search_K(S3j) ;
% J= search_list(S1,S1AJ);
% s2j=[S2,J];
% s2j=sort(s2j);
% Flag=Flag+ismember(s2j,S2AJ,'rows');
% %Ѱ��S2AJ������
% s3j=[S3,J];
% s3j=sort(s3j);
% Flag=Flag+ismember(s3j,S3AJ,'rows');
% %Ѱ��S3AJ������
% if Flag==2
%     Sm_1=SB1;
% else
%     Sm_1=SB2;
%%%%%%%%%%%%
end