function ob3= random_select(s1)  %�޲����Ķ�
ob3=[];
Flag_ob3=0;
%���ѡ��->�ж��Ƿ���һ��ֱ����->���� ʧ��ֵ+1 ������һ��ѭ��
%                              ->���ǵ�->��������������/��仰���Ҹ��鷳��,�ɴ඼���ظ�Ȼ��lack�����ټ����ظ�����//
%                                           ->����Ѵ�����ɾ��  
%                                           ->����洢��һ��������
%�õ��������������� �����ε���������кŴ洢��ob3��  һ�� һ��������
Warning=0;%�����ƥ����ֵ
    while Warning~=10000
          Pass=0;
          random_sum=randperm(s1,3);          
          j=random_sum(1);
          k=random_sum(2);
          L=random_sum(3);
          c=sort([j,k,L]);
          %�ж����������� �Ƿ���һ��ֱ��������� ��break;
          if Judge(c)==1
%               break;
             continue;
          end
          Secelt=0;%������һ��ֱ����ʱ

                    if Flag_ob3==1 %������ǵ�һ������  ���ظ���secelt=1
                        for i=1:ob3s1
                            re_sum=0;%һ��Ҳ���ظ� re_sum=1;%�ظ�1�� 
                            if size(find(ob3(i,:)==c(1)),2)>re_sum 
                                Pass=Pass+0.5;
                            end
                            if size(find(ob3(i,:)==c(2)),2)>re_sum 
                                Pass=Pass+0.5;
                            end
                            if size(find(ob3(i,:)==c(3)),2)>re_sum
                                Pass=Pass+0.5;
                            end
                            if  Pass>0.5*re_sum        %�ظ�1��PASS=0.5 һ��Ҳ���ظ�pass=0
%                                Pass=0;
                                Warning=Warning+1;%Secelt=0;
                                break; %���Ƽ���ظ�������ѭ��,������һ�����������״̬  
                            end
                        end
                        Secelt=1;      %һ��Ҳ���ظ�          
                    else  %��һ������
                        ob3=[ob3;c];
                        Flag_ob3=1;
                        [ob3s1,~]=size(ob3);
                    end
                        
                    %breakλ
           if Secelt==1 %�������� ob3���ظ���c
              ob3=[ob3;c];
              [ob3s1,~]=size(ob3);  
              if ob3s1==s1%floor(s1/3)+5  %����������  10�������ξ�30���� 
                 Warning=10000; 
              end    
           end
                    
                    
    end%��ѡ����������
 %������warning
    ob3_rows=ob3(:);%������%�кܶ�
    ob3_rows=unique(ob3_rows,'rows');
    all_cols=[];
    for i=1:s1
        all_cols=[all_cols;i];
    end
    lack_star=setxor(ob3_rows,all_cols);
    [l_s_s1,~]=size(lack_star);
    if l_s_s1==1
       j=lack_star(1,1);
       for i=1:100000
           k=randi(s1);
           for m=1:100000
                if k==j
                   k=randi(s1);
                   continue;
                end
                break;
           end       
           L=randi(s1);
           for ssb=1:100000
                if L==j|| L==k
                   L=randi(s1);
                   continue;
                end
                break;
           end                              
           c=sort([j,k,L]);
           if Judge(c)~=1
              break;
           end%�ж�ֱ��           
       end
       ob3=[ob3;c];%ͨ�������ob3
    end
    
    if l_s_s1==2 %%
       j=lack_star(1,1);
       k=lack_star(2,1);
       for i=1:10000
           L=randi(s1);
           for ssc=1:100000
                if L==j|| L==k
                   L=randi(s1);
                   continue;
                end
                break;
            end     
                    
           c=sort([j,k,L]);
           if Judge(c)~=1
              break;
           end
       end
       ob3=[ob3;c];
    end         %%
    if l_s_s1>=3
        disp('����,lack star����3')
    end
    %��ȡ��ob3�洢�˹۲������ε��к�
    %��ѯob3����Ԫ��(��ʱΪ���ظ�)��1:s1�еĲ�ֵ
    
end

