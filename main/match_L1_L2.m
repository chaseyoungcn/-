function Sm= match_L1_L2(L1,L2,L3)  %����
%����Sm,ΪS123����Ӧ;
[n1,~] = size(L1);
[n3,~] = size(L2);
Sm=[];%%%%�������ƥ����
Flag=0;
Flag_nei=0;
for i = 1:n1
    for j = 1: n3  %����ж�����õ�һ��
        L = [L1(i,:) L2(j,:)];
        L_before=L1(i,:);
        L_after=L2(j,:);
        [~,n6] = size(L);
        if n6~=4
            disp('������������')
        end
        for k = 1: 2 %�����ظ�
            x = L(k);
            
            if size(find(L == x),2) ==2 %>1 ������ظ�  �й�����             
               A1 = x;
               A2 = L_before(find(L_before~=x ));
               A3 = L_after(find(L_after~=x ));
                %��L3���Ƿ��� �ж�A2 A3
                A_L3=sort([A2,A3]);
                if L_search(A_L3,L3)
                    Flag=1;
                    Flag_nei=1;
                    %��ƥ����
                    %������
                    
                   break;
                end
                            
            end
        end
        if  Flag_nei==1
            Flag_nei=0;
            
            break;
        end
    end
    if Flag==1
        Sm=[Sm;A1,A2,A3];%%
        
        Flag=0;
    end

end

