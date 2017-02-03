close all; clear all; clc
SMA = SMAuthProtocol();

%Your code goes here: simulate the server impersonation attack 
%of Cai, Li, Li, and Deng.  

% eavedrop and block M3 send to Tag
[SMA,r1, M1, M2, M3] = eavesdropBlockLast(SMA);

% generate r'
l = 160;
r1_prime = generateRandBitString(l);

% [SMA, r1_prime] = initiateAsTag(SMA);
[SMA,M1_prime, M2_prime] = initiateAsReader(SMA,r1_prime);

% adversary generates M3' and send it to Tag
M3_prime_L = xorLongString(M1(81:160), xorLongString(M3(1:80), M1_prime(81:160)));
M3_prime_R = xorLongString(M1(1:80), xorLongString(M3(81:160), M1_prime(1:80)));

M3_prime = cat(2, M3_prime_L, M3_prime_R);
M3 = M3_prime;

[SMA, accept] = continueAsReader(SMA, M3);
%Code written after the call to continueAsReader will not be graded!