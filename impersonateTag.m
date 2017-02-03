close all; clear all; clc

SMA = SMAuthProtocol();

%Your code goes here: simulate the tag impersonation attack of Cai,
%Li, Li, and Deng

% generate r1'
l =160;
[SMA, r1] = initiateAsTag(SMA)
r1_prime = generateRandBitString(l);

% tag sends M1' and M2' to adversary
M1_prime = xorLongString(SMA.t_tag, SMA.r2);
tCatNonce = [SMA.t_tag xorLongString(r1_prime, SMA.r2)];
M2_prime = binHash(tCatNonce);


[SMA, accept] = continueAsTag(SMA, xorLongString(M1_prime, xorLongString(r1, r1_prime)), M2_prime);
%Code written after the call to impersonateTag will be DELETED
