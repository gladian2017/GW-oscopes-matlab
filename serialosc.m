clear
s2 = serial('COM12','BaudRate',115200,'DataBits',8);
s2.InputBufferSize=8500;
fopen(s2)
fprintf(s2,'*IDN?')
idn = fscanf(s2)
tic
fprintf(s2,':ACQ1:MEM?')
strr='uint16';
%strr='uint8';
div=25;
fscanf(s2,'%s',15)
A=zeros(1,3998);
%A=(100*fread(s2,1, strr)+fread(s2,1,strr))/div;
while(s2.BytesAvailable<7900)
%     wait(1)
%    bb= s2.BytesAvailable
end

if(s2.BytesAvailable>=7900)
    ii=1
%     while(s2.BytesAvailable>2)
%      A(1,ii)= (100*fread(s2,1,strr)+fread(s2,1,strr))/div;
%      ii=ii+1;
%      bb= s2.BytesAvailable;
%     end
%     plot(A)


    st=fread(s2,(s2.BytesAvailable/2),strr);%strr='uint16'
    plot(st/div)


%     st=fread(s2,(s2.BytesAvailable),strr);%strr='uint8'
%     lo=st(1:2:7998,1);
%     hig=st(2:2:7998,1);
%     plot((254*hig+lo)/25)
toc
fclose(s2)
end
