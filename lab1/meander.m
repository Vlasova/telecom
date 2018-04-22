close all;
clear all; 
clc;

f = 5;
phase = 3;
a = 0.3;

t = 0:0.001:0.5;
s = a*square(2*pi*f*t+phase);
figure;
suptitle(sprintf('frequency: %d, phase: %d, amplitude: %f', f, phase, a));
subplot(1,2,1);
plot(t,s);
axis([0 0.5 -1 1]);
subplot(1,2,2);
plot(abs(fft(s,1024)));