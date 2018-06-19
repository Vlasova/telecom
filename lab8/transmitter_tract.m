clear all;
close all;

data = int16([0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 ...
              0 1 1 0 0 1 0 0 0 0 0 0 0 0 0 1 0 1 1 1 0 1 0 1 ...
              0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);

msg = transmit(data);
          
fid=fopen('test.sig', 'w','l');
fwrite(fid, msg, 'int16');
fclose(fid);