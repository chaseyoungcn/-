function A_sum = search_K(A12)      %����Ǿ�,����ƥ�������б�
global K_vector;%%��ʱ�����������ᱣ������  ����Ҫȫ�ֱ���
global star_lib_total;%���ǿ�����K_vector
%Error=0.002;
[K1,K2]=size(K_vector);

if K2~=1
    disp('K error')
end
global D;
iii=star_lib_total(1,3);
i=(A12-iii)/D ;
i= floor(i)+1;

%%%��Χ������
[~,kk2]=size(K_vector{i,1});

% if kk2~=2
%     disp('kk2 error')
% end

A_sum=K_vector{i,1};
% if i~=K1
%    A_sum=[K_vector{i,1};K_vector{i+1,1}]; 
% else
%    A_sum=K_vector{i,1};
% end

end

