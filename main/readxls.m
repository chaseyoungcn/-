
getfilename=ls('C:\Users\Chase\matlab\xingtu*.xls'); %ȡĿ¼������excel�ļ����ļ���(.xls��.xlsx)
filename_all = cellstr(getfilename); %���ַ�������ת��Ϊcell������
num_of_files = length(filename_all); %excel�ļ���Ŀ
 for i=1:num_of_files %ѭ������excel���ݲ�����ṹ��database��     
 database(i) = struct('Name',filename_all(i),'Data',xlsread(filename_all{i}));

 end
%ע:�ýű������е�excel���ݶ��뵽����database�У�database������ÿ��Ԫ��Ϊһ�ṹ���ýṹ���ļ���Name���ļ��е�����Data��ɣ�
%������ʵ�i��excel���ݵķ���Ϊ��
%a=database(1).Data;
