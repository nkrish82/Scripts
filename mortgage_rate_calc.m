%%% Mortgage rate calculator

clear all;
close all;
i = 2.5/100; % interest rate
t= 6; % loan period
P = 30000; %principal amount

%%%%Mortgage rate per month
%%%% solving P(t-1)*exp(i) - 12*M = 0, P(n) = P(n-1) - 12*M for n = 0:1:29
M = P*exp(t*i)/(sum (exp(i*(0:1:t)))*12);

T = 12*M*t; % total amount owed
