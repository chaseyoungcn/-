%matching ����ӦΪ�ļ���
function List=matching(filename,N,FOV)
%  ObserΪ         1 2 3                 4 5 6
%                 S1 S2 S3            S12 S13 S23
%                                    ���ýǾ���K��Ѱ������ ����Ϊs12=a12
%         ��ƥ��ɹ�S1=A1;S2=A2,S3=A3һһ��Ӧ
%            (�����α��S��b_cell�к�)    (�����Ǿ�)
%
%            b_cellΪxls�ļ�ȫ��+������[MAX1,~]=size(b_cell);

% global Fail_star_map;
% global Fsm_sum;
Obser=Observe3(N,FOV,filename);%���Ե�ĳ���ļ�

[s1,s2]=size(Obser);
% s1=s1
Fail=[];
Succ=[];
List=[];
match_3_fail=0;
% for j=1:1000000
%     Fail_FLAG=0;
Fail_FLAG=0;
    for i=1:s1% ����S1�ǹ۲������� ����
%         Fail_FLAG=0;
        if match_3_fail<=0.8*s1 %��ƥ��������ʧ�ܴ��� ����ͼƥ��ʧ��            %WARNING ��ѡ�۲�������ʱ���ֹͣ   
            SB=Obser(i,4:6);%����S12�ܹ��ҵ�׼ȷS1 S2 �������ֻ�ҵ�A1 A2
%           SB1=Obser(i,1:3);%������Si��
            S12=SB(1);
            S13=SB(2);
            S23=SB(3);            
            A1A2=search_K(S12); %A_sum�ﺬ�в²��A1 A2����
            A1A3=search_K(S13);%
            A2A3=search_K(S23);
            if isempty(A1A2)||isempty(A1A3)||isempty(A2A3) %�Ǿ�������Ϊ��,��������δƥ�䵽
                match_3_fail=match_3_fail+1;
                continue;
            end
            Sm= match_L1_L2(A1A2,A1A3,A2A3);  %ֱ�ӻ��ƥ������ ���ܺü���  A1 A2 A3                   
            if size(Sm,1)>=2
                SB1=Obser(i,1:3);
                Sm=Pyramid(SB1,Sm);%�Ӹ�������ɸѡ 
            end
            if ~isempty(Sm)%����%ƥ��ɹ�
                SSB=Obser(i,1:3);%ƥ��ɹ�����Щb_cell�к�
%                 size(Sm);
                S=[SSB,Sm];
                Succ=[Succ;S]; %n*6
                %����Succ=[]            
            else
                match_3_fail=match_3_fail+1;%��һ��δ�ɹ�
                continue;
            end
        else
            Fail_FLAG=1; 
            break;
            %filename
            %disp('����ͼƥ��ʧ��!')
            %Fail=[Fail;filename,0]
            %���� ȫ�ֱ���Fail 
            %����ͼƥ��ʧ�� �����
        end      
%             %%%%%������ͼƥ��ʧ����ͼ
%             AAAAA='ƥ��ʧ��!'%����ͼ
%             Fail_FLAG=1;
%              dddd=struct('Name','State');   %****
%              %Fail_star_map(Fsm_sum) =struct('Name',filename,'State',AAAAA);
% %             Fsm_sum=Fsm_sum+1;
%             break;
%             Fail_star_map=[Fail_star_map;filename,disp('����ͼƥ��ʧ��!')]                
    end

    
[List1,List2]=size(Succ);

%  if List2~=6
%      sprintf([filename,'��Ȼһ��Ҳûƥ����']);
%  end
 
%Fail ��Succ��Ϊ����

        
for i=1:3
    if  List2~=0
        S=[Succ(:,i),Succ(:,i+3)];
        List=[List;S];
    end
end
if ~isempty(List)
    Su=List(:,1);%ƥ��ɹ�������
end
global b_cell; 
[sb1,~]=size(b_cell); 

for i=1:sb1
    Fail=[Fail;i];
end
% Fail=Fail%
% a=Fail_FLAG%

%������ͼƥ��ʧ��
if Fail_FLAG==1
    %List=[];%���֮ǰ����ƥ��� %��Ҫ�ɹ���     ���Բ�������ƥ��ʧ��
    Fail=Fail;
else
    %������    
    Fail=setxor(Fail,Su);    
end

[SF,~]=size(Fail);
for i=1:SF
    S=Fail(i,1);%��ʧ�ܵ����� -1
    SSS=[S,-1];
    List=[List;SSS];
end
List=del_list(List,sb1);
%  ɾ����һ����ͬԪ�ؼ����Ӧ����  ��ͼ����sb1������
%  find(List(:1)==)
%List ÿ���۲��� ��Ӧ�ǿ���
     
end