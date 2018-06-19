close all;
clear; clc;

%BPSK
h = modem.pskmod('M', 2);
g = modem.pskdemod('M', 2);
msg = randint(20, 1, 2);
modSignal = modulate(h, msg);
demodSignal = demodulate(g, modSignal);
scatterplot(modSignal);
title('BPSK');

%PSK
h = modem.pskmod('M', 8);
g = modem.pskdemod('M', 8);
msg = randint(20, 1, 8);
modSignal = modulate(h, msg);
demodSignal = demodulate(g, modSignal);
scatterplot(modSignal);
title('PSK');

%OQPSK
h = modem.oqpskmod('M', 4);
g = modem.oqpskdemod('M', 4);
msg = randint(50, 1, 4);
modSignal = modulate(h, msg);
demodSignal = demodulate(g, modSignal);
scatterplot(modSignal);
title('OQPSK');

%genQAM
h = modem.genqammod('Constellation', exp(j*2*pi*[0:10]/10));
g = modem.genqamdemod('Constellation', exp(j*2*pi*[0:10]/10));
msg = randint(20, 1, 7);
modSignal = modulate(h, msg);
demodSignal = demodulate(g, modSignal);
scatterplot(modSignal);
title('genQAM');

%MSK
h = modem.mskmod('SamplesPerSymbol', 10);
g = modem.mskdemod('SamplesPerSymbol', 10);
msg = randint(10, 1, 2);
modSignal = modulate(h, msg);
demodSignal = demodulate(g, modSignal);
scatterplot(modSignal);
title('MSK');