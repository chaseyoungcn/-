function star_lib = star_lib_make(data) %�޲����Ķ�
[s1,s2]=size(data);
%s1 ����С��6
star_lib=[];
if  s2 ==4
%   star_lib=[];
    for i=1:s1-1 %���������Ǿ�
        for j=i+1:s1
            Alpha_i=data(i,2);
            Delte_i=data(i,3);
            Alpha_j=data(j,2);
            Delte_j=data(j,3);
            si=[ cos(Alpha_i)*cos(Delte_i);
                 cos(Alpha_i)*sin(Delte_i);
                 sin(Delte_i)];
            sj=[ cos(Alpha_j)*cos(Delte_j);
                 cos(Alpha_j)*sin(Delte_j);
                 sin(Delte_j)];
            a_d=acos(sum(si.*sj)/( norm(si)* norm(sj) ));%����Ǿ�
            if data(i,1)>data(j,1)
                t2=data(i,1);
                t1=data(j,1);
            else%���С����ǰ������˵���β����ݸĶ�����Ӱ��ʵ�� �������Է���һ
                t1=data(i,1);
                t2=data(j,1);           
            end
            star_lib=[star_lib;[t1,t2,a_d]];
        end
    end        
% else
%     disp('�Ǳ��������������ά�Ȳ��ԣ�����˵ӦΪ n X 4 ���� ')    
end

end

% star_lib=[];
% for i=1:s1-1 %���������Ǿ�
%     for j=i+1:s1
%         Alpha_i=data(i,2);
%         Delte_i=data(i,3);
%         Alpha_j=data(j,2);
%         Delte_j=data(j,3);
%         si=[ cos(Alpha_i)*cos(Delte_i);
%              cos(Alpha_i)*sin(Delte_i);
%              sin(Delte_i)];
%         sj=[ cos(Alpha_j)*cos(Delte_j);
%              cos(Alpha_j)*sin(Delte_j);
%              sin(Delte_j)];
%         a_d=acos(sum(si.*sj)/( norm(si)* norm(sj) ));%����Ǿ�
%         if data(i,1)>data(j,1)
%             t2=data(i,1);
%             t1=data(j,1);
%         else%���С����ǰ������˵���β����ݸĶ�����Ӱ��ʵ�� �������Է���һ
%             t1=data(i,1);
%             t2=data(j,1);           
%         end
%         star_lib=[star_lib;[t1,t2,a_d]];
%     end
% end


