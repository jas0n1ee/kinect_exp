clear
clc
%data_name='train_data';
data_name='test_data';
f_svm=fopen(strcat('../data/',data_name),'w');
for fil=1:3
    filename=sprintf('../data/sensor0%d.dat',fil);
    f=fopen(filename,'rb');
    data=[];
    i=0;
    while 1;
        i=i+1;
        bodyIndex=fread(f,1,'int8');
        tracked_num=fread(f,1,'int8');
        bodyX=fread(f,25,'int16');
        bodyY=fread(f,25,'int16');
        bodyZ=fread(f,25,'int16');
        time=fread(f,1,'int64');
        temp=[bodyX; bodyY; bodyZ; bodyIndex; tracked_num; time];
        if length(temp)==78
           data=[data temp];
           fprintf(f_svm,'%d',fil);
           for cnt=1:75
               fprintf(f_svm,' %d:%d',cnt,temp(cnt));
           end
           fprintf(f_svm,'\n');
        end
        if feof(f)
            break;
        end
    end
    fclose(f);
    
    for i=0:5
        body{fil,i+1}=data(:,find(data(76,:)==i));
    end
end
fclose(f_svm);
save('sensor.mat','data','body');