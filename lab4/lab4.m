close all;
clear; clc;

f = 20;
fd = f * 40;
td = 1/fd;
tend = 0.5;
phase = 0;
a = 3;
t = 0:td:tend;
s = a*cos(2*pi*f*t+phase);
figure;
plot(t,s);

fmod = 100;
mod = ammod(s, fmod, fd, 5, 5);
figure;
subplot(1,2,1);
plot(t, mod);
subplot(1,2,2);
plot(abs(fft(mod, 1024)));

fmod = 150;
sub_mod = ammod(s, fmod, fd);
figure;
subplot(1,2,1);
plot(t, sub_mod);
subplot(1,2,2);
plot(abs(fft(sub_mod, 1024)));

single_mod = ssbmod(s, fmod, fd);
figure;
subplot(1,2,1);
plot(t, single_mod);
subplot(1,2,2);
plot(abs(fft(single_mod, 1024)));

sign = demod(single_mod, fmod, fd);
figure;
subplot(1,2,1);
plot(t, sign);
subplot(1,2,2);
plot(abs(fft(sign, 1024)));

M = a/5;
kpd = M^2/(M^2+2)