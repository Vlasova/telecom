close all;
clear all; 
clc;

f = 10;
phase = 0;
a = 5;

t = 0:0.005:0.5;
s = a*cos(2*pi*f*t+phase);
figure;
suptitle(sprintf('frequency: %d, phase: %d, amplitude: %d', f, phase, a));
subplot(1,2,1);
plot(t,s);
axis([0 0.5 -10 10]);
subplot(1,2,2);
plot(abs(fft(s,1024)));