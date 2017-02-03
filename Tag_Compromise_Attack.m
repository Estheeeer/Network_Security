% Tag Compromise Attack
% Authors: Xinxin Zhang, Hongting Wang

close all; clear all; clc
N = 100;
branch = 10;

% total keys needed
totalkeys = N+N/branch+1;

% generate binary-tree tags
% col:100(tags)   row:3(0-2 levels)
M = zeros(3, N);

for i = 1:3
    for j = 1:N
        M(i, j) = floor((j-1)/(branch^(3-i)));
    end
end

% choose tag to compromise
% range of the tag can be chose: 0~99

for tag = 0:99;
S1 = ['Tag', num2str(tag), ' compromised keys: '];
display(S1);
display(compromised_keys(tag, M));
end

% count = 0;
% t = round(1+99*rand(1));
% tags(1, :) = M(2:3, t); 
% t = round(1+99*rand(1));
    
% generate plot
q = linspace(0, N, N+1);
% f = 1 - ((N-1)/N).^(2*q);
m = 10;
f = 1 - ((m-1)/m).^(2*q);
plot(q, f), grid on;
xlabel('Number of compromised tags');
ylabel('Probability that two tags can be differenciated')


