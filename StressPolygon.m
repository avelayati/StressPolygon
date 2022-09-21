%%
%%% Arian Velayati, PhD
%%%% This script can be used to plot stress polygon according to frictional
%%%% equilibrium. This yields upper and lower bounds of horizontal stresses
%%%% depending on the faulting regime, vertical stress, and Friction Angle

clc; close; clear;

%% input

Sv = 2000; % Vertical Stress "psi"
phi = 30; % Friction angle (deg)

%% calculations

q = (1 + sind(phi)) / (1 - sind (phi));  % Anisotropy factor
Sh_min = (1/q) * Sv; % min sh (Vertical line in NF) 
SH_s = Sv; % Starting point of SH for ss line 
SH_min = (1/q) * Sv;  
SH_max = q * Sv;
sh_max = SH_max;
 
% Normal Fault regime

Sh = (1/q) * Sv;

% SS

sh1 = Sh:Sv;
SH1 = q * sh1;

% RF

SH2 = q * Sv;

% SH = Sh

sh2 = Sh_min:sh_max;
SH3 = 1*sh2;

%% plot

A = SH_min:SH_s;
B = Sv:sh_max;

plot(Sh.*ones(1,length(A)),SH_min:SH_s,'r','LineWidth', 1.5)
hold on
plot(sh1,SH1,'b','LineWidth', 1.5)
plot(Sv:sh_max,SH2.*ones(1,length(B)),'g','LineWidth', 1.5)
plot(sh2,SH3, 'y','LineWidth', 1.5)
scatter(Sv,Sv,40,'MarkerEdgeColor','b','MarkerFaceColor','c','LineWidth', 1.5)
xlabel ('Sh (psi)')
ylabel('SH (psi)')
ylim([0 SH_max+(0.1*SH_max)])

