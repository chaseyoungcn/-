function K_DATA = make_K_vector(data,n) %���޲����Ķ�
[s1,s2]=size(data);
if s2~=3
    disp('�ǿⲻ�����еľ���')
end
Y=data(:,3);%�ǿ� ���нǾ���Ϣ
Y1=min(Y);
Yn=max(Y);
if Y1~=Y(1) || Yn~=Y(s1)
    disp('�ǿⲢδ���Ǿ�ֵ����')
end
%n=s1;
%n=5000;%ÿ0.01�Ǿ�Ϊһ�� n������
% n=((Yn-Y1)/D )+1;
% n=floor(n);
global D;
D=(Yn-Y1)/(n-1);

K_DATA=cell(n-1,1);%K_DATA(i)=�ǽǾ���(Yi,Yi+D)�ڵ��ǶԶ�����  ��i�� == Yi
for i=1:s1-1
    K_Rows=floor((data(i,3)-Y1)/D)+1; %����ȡ�� ע��K_Rows ��1->n-1 ��Ϊ Y1 -> Yn-1  Yn(1<����n<����n-1)��ΧΪ()
    K_DATA{K_Rows,1}=[K_DATA{K_Rows,1};data(i,1:2)] ;%ѭ�� ������ÿ���ȼ��ǽǾ෶Χ�� �ǶԶ� ����K_data��Ԫ����
end
K_DATA{n-1,1}=[K_DATA{n-1,1};data(s1,1:2)] ;
% disp('��ӡ����Y1�ȼ��µ��ǶԶ�:')
% disp(K_DATA{1,1})%��ӡ����Y1�ȼ��µ��ǶԶ�

end

%����Y�������ݿ�  Y_name(i) Y1 -> Yn-1  һ����Ŵ���һ������  
%data���� ����Ҫ����ǶԶ������ǶԶ���� ����Ϊ n X 2 ����
%ʵ��α���� 
%
% for i=1:s1-1
%     Y_name(i)="Y��ʽ������i"; %һ���ַ���
% end
%����Y(n)�����ĸ����� ����Y1 -> Yn-1
% for i=1:s1
%     (Y(i)-Y(1))/D=ĳֵ
%     ֵ+1ƥ�� Y_name(i) ��Yi ��i��
%     Y_DATA(i)=[]   
%�����i�е���ά������ ��     


