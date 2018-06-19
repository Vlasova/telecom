close all;
clear; clc;

msg = [0 1 1 0]
code = encode(msg, 7, 4)
code_err = code;
code_err(1) = not(code_err(1))
[dec, err] = decode(code_err, 7, 4)

msg = [0 1 1 0]
[h, g, n, k] = hammgen(3)
m = msg * g;
m = rem(m, ones(1, n) .* 2);
m(1) = not(m(1));
synd = m * h';
synd = rem(synd, ones(1, n-k) .* 2)
stbl = syndtable(h);
tmp = bi2de(synd, 'left-msb');
z = stbl(tmp+1, :);
res = xor(m, z)

msg = [0 1 1 0]
pol = cyclpoly(7, 4);
[h, g] = cyclgen(7, pol);
code = msg * g;
code = rem(code, ones(1,n) .* 2)
code_err = code;
code_err(1) = not(code_err(1))
synd = code_err * h';
synd = rem(synd, ones(1,n-k) .* 2);
stbl = syndtable(h);
tmp = bi2de(synd, 'left-msb');
z = stbl(tmp+1, :);
res = xor(code_err, z)

msg = [1 0 1 0]
codebch = comm.BCHEncoder(7, 4);
decodebch = comm.BCHDecoder(7, 4);
temp = msg';
code = step(codebch, temp(:))
code_err = code;
code_err(1) = not(cod_err(1))
res = step(decodebch, code')

msg = gf(randi([0 7], 2, 3), 3)
code = rsenc(msg, 7, 3)
code_err = code;
code_err(1,2) = code_err(1,2) + 2;
code_err(2,3) = code_err(2,3) + 1;
code_err(2,5) = code_err(2,5) + 3
res = rsdec(code_err, 7, 3)