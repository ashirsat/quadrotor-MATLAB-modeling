function [ A_long, B_long, C_long, D_long] = Jacobian_long( trimx,trimu )
%JACOBIAN_LON linear models about the operating point
%   This function generates the state space [A,B,C,D] at trimx and trimu
%  trimx : The value of the states for equilibrium
%  trimu : The value of the inputs for equilibrium

g   =   9.81;         % Acceleration due to gravity
m   =   0.468;        % mass of the quadrotor
l   =   0.225;        % Length of the arms
k   =   2.980*10^-6;
b   =   1.140*10^-7;

Ixx     =   4.856*10^-3;
Iyy     =   4.856*10^-3;
Izz     =   8.801*10^-3;
Ax      =   0.25;
Ay      =   0.25;
Az      =   0.25;

xd      =   trimx(1,1);
zd      =   trimx(2,1);
theta   =   trimx(3,1);
T       =   trimu(1,1);
tthe    =   trimu(2,1);

%% Longitudinal eqns A B C D
% A_J =
%  
% [ -Ax/m,     0,  (T*cos(theta))/m, 0]
% [     0, -Az/m, -(T*sin(theta))/m, 0]
% [     0,     0,                 0, 1]
% [     0,     0,                 0, 0]

a11=-Ax/m; a12=0; a13=(T*cos(theta))/m; a14=0;
a21=0; a22=-Az/m; a23=-(T*sin(theta))/m; a24=0;
a31=0; a32=0; a33=0; a34=1;
a41=0; a42=0; a43=0; a44=0;

% B_J =
%  
% [ sin(theta)/m,     0]
% [ cos(theta)/m,     0]
% [            0,     0]
% [            0, 1/Iyy]
b11=sin(theta)/m; b12=0;
b21=cos(theta)/m; b22=0;
b31=0; b32=0;
b41=0; b42=1/Iyy;

A_long=[a22 a21 a23 a24;
        a12 a11 a13 a14;
        a32 a31 a33 a34;
        a42 a41 a43 a44];
B_long=[b21 b22;
        b11 b12;
        b31 b32;
        b41 b42];
C_long=eye(2,4); %% For forward flight condition with Hinfinity controller two outputs
% C_long=eye(4,4);%% For forward flight condition with LQ servo controller four outputs
D_long=[];


end

