function A=del_list(A,ab1)%���Ū�����ɾ��  ɾ�� �ظ���һ�� ����(����Ψһ)
A=sortrows(A,1);
for i=1:ab1
    SSS=find(A(:,1)==i);
    [S1,~]=size(SSS);%�ж��ٸ���ͬԪ��
    if S1>1  
        %���ѡһ��   
        baoliu_cols=randi(S1);              
        SSS(baoliu_cols)=[];
        A(SSS,:)=[];
    end
    
end

% a=A(:,1)


