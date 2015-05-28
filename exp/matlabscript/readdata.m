clear
clc
filename='../data/sensor.dat';
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
    end
    if feof(f)
        break;
    end
end
fclose(f);
for i=0:5
    body{i+1}=data(:,find(data(76,:)==i));
end
save('sensor.mat','data','body');