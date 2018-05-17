close all;
clear;
clc;
 
f = 50;
phase = 0;
a = 2;
t = 0:0.0005:0.5;
s = a*cos(2*pi*f*t+phase);
figure;
subplot(1,2,1);
plot(t,s);
subplot(1,2,2);
plot(abs(fft(s,1024)));

y = s+awgn(s,2);
figure;
subplot(1,2,1);
plot(t, y);
subplot(1,2,2);
plot(abs(fft(y,1024)));

[b, a] = butter(10, 60/500);
out = filter(b, a, y);
figure;
subplot(1,2,1);
plot(t, out);
subplot(1,2,2);
plot(abs(fft(out,1024)));

