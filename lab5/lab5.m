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

fmod = 50;
mod_ph = pmmod(s, fmod, fd, pi/8);
figure;
subplot(1,2,1);
plot(t, mod_ph);
subplot(1,2,2);
plot(abs(fft(mod_ph, 1024)));

demod_ph = pmdemod(mod_ph, fmod, fd, pi/8);
figure;
subplot(1,2,1);
plot(t, demod_ph);
subplot(1,2,2);
plot(abs(fft(demod_ph, 1024)));

fmod = 50;
mod_f = fmmod(s, fmod, fd, 10);
figure;
subplot(1,2,1);
plot(t, mod_f);
subplot(1,2,2);
plot(abs(fft(mod_f, 1024)));

demod_f = fmdemod(mod_f, fmod, fd, 10);
figure;
subplot(1,2,1);
plot(t, demod_f);
subplot(1,2,2);
plot(abs(fft(demod_f, 1024)));