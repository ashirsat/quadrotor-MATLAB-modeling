function [ F ] = quad_longitudinal_NL_eqns( x,u )
%QUAD_LONGITUDINAL_NL_EQNS Summary of this function goes here
%   Detailed explanation goes here
X=x;
U=u;
g=9.81;         % Acceleration due to gravity
m=0.468;        % mass of the quadrotor
l=0.225;        % Length of the arms
k=2.980*10^-6;%2.980*10^-6;
b=1.140*10^-7;
% Jm=%3.357*10^-5;
Ixx=4.856*10^-3;
Iyy=4.856*10^-3;
Izz=8.801*10^-3;
Ax=0.25;
Ay=0.25;
Az=0.25;
beta=0.25;
c13=(U(1)*cos(X(3)))/m - g - (Az*X(2))/m;
c11=(U(1)*sin(X(3)))/m - (Ax*X(1))/m;
c15= (U(2)/Iyy); %)/Iyy;
% c11=(U(1)*(sin(X(7))*sin(X(11)) + cos(X(7))*cos(X(11))*sin(X(9))))/m - (Ax*X(2))/m;
% c12= - (Ay*X(4))/m - (U(1)*(cos(X(11))*sin(X(7)) - cos(X(7))*sin(X(11))*sin(X(9))))/m;
% c13= (U(1)*cos(X(7))*cos(X(9)))/m - (Az*X(6))/m - g;
% c14=- ((U(2) - beta*X(7) + X(10)*(Ixx*X(12)*cos(X(9)) - sin(X(7))*(Iyy - Izz)*(X(10)*cos(X(7)) + X(12)*cos(X(9))*sin(X(7))) + X(12)*cos(X(7))^2*cos(X(9))*(Iyy - Izz)) + X(12)^2*cos(X(7))*cos(X(9))^2*sin(X(7))*(Iyy - Izz))*(Iyy*Izz + Ixx*Iyy*sin(X(9))^2 - Iyy*Izz*sin(X(9))^2 - Ixx*Iyy*sin(X(7))^2*sin(X(9))^2 + Ixx*Izz*sin(X(7))^2*sin(X(9))^2))/(Ixx*Iyy*Izz*(sin(X(9))^2 - 1)) - (sin(X(9))*(Iyy - Iyy*sin(X(7))^2 + Izz*sin(X(7))^2)*(U(4) - beta*X(11) + Ixx*X(8)*X(10)*cos(X(9)) + Iyy*X(8)*X(10)*cos(X(9)) - Izz*X(8)*X(10)*cos(X(9)) - Ixx*X(12)*X(10)*sin(2*X(9)) + Iyy*X(12)*X(10)*sin(2*X(9)) + Iyy*X(10)^2*cos(X(7))*sin(X(7))*sin(X(9)) - Izz*X(10)^2*cos(X(7))*sin(X(7))*sin(X(9)) - 2*Iyy*X(8)*X(10)*cos(X(7))^2*cos(X(9)) + 2*Izz*X(8)*X(10)*cos(X(7))^2*cos(X(9)) - 2*Iyy*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7)) + 2*Izz*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7)) - 2*Iyy*X(12)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9)) + 2*Izz*X(12)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9))))/(Iyy*Izz*(sin(X(9))^2 - 1)) - (2*cos(X(7))*sin(X(7))*sin(X(9))*(Iyy/2 - Izz/2)*(U(3) - beta*X(9) - X(8)*(Ixx*X(12)*cos(X(9)) + X(12)*cos(X(7))^2*cos(X(9))*(Iyy - Izz) - 2*cos(X(7))*sin(X(7))*(X(10) + X(12)*sin(X(7)))*(Iyy/2 - Izz/2)) + X(12)^2*cos(X(9))*sin(X(9))*(Ixx - Izz - Iyy*sin(X(7))^2 + Izz*sin(X(7))^2) + X(8)*X(10)*cos(X(7))*sin(X(7))*(Iyy - Izz)))/(Iyy*Izz*cos(X(9)));
% c15= ((Izz + Iyy*sin(X(7))^2 - Izz*sin(X(7))^2)*(U(3) - beta*X(9) - X(8)*(Ixx*X(12)*cos(X(9)) + X(12)*cos(X(7))^2*cos(X(9))*(Iyy - Izz) - 2*cos(X(7))*sin(X(7))*(X(10) + X(12)*sin(X(7)))*(Iyy/2 - Izz/2)) + X(12)^2*cos(X(9))*sin(X(9))*(Ixx - Izz - Iyy*sin(X(7))^2 + Izz*sin(X(7))^2) + X(8)*X(10)*cos(X(7))*sin(X(7))*(Iyy - Izz)))/(Iyy*Izz) - (sin(2*X(7))*(Iyy/2 - Izz/2)*(U(4) - beta*X(11) + Ixx*X(8)*X(10)*cos(X(9)) + Iyy*X(8)*X(10)*cos(X(9)) - Izz*X(8)*X(10)*cos(X(9)) - Ixx*X(12)*X(10)*sin(2*X(9)) + Iyy*X(12)*X(10)*sin(2*X(9)) + Iyy*X(10)^2*cos(X(7))*sin(X(7))*sin(X(9)) - Izz*X(10)^2*cos(X(7))*sin(X(7))*sin(X(9)) - 2*Iyy*X(8)*X(10)*cos(X(7))^2*cos(X(9)) + 2*Izz*X(8)*X(10)*cos(X(7))^2*cos(X(9)) - 2*Iyy*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7)) + 2*Izz*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7)) - 2*Iyy*X(12)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9)) + 2*Izz*X(12)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9))))/(Iyy*Izz*cos(X(9))) - (2*cos(X(7))*sin(X(7))*sin(X(9))*(Iyy/2 - Izz/2)*(U(2) - beta*X(7) + X(10)*(Ixx*X(12)*cos(X(9)) - sin(X(7))*(Iyy - Izz)*(X(10)*cos(X(7)) + X(12)*cos(X(9))*sin(X(7))) + X(12)*cos(X(7))^2*cos(X(9))*(Iyy - Izz)) + X(12)^2*cos(X(7))*cos(X(9))^2*sin(X(7))*(Iyy - Izz)))/(Iyy*Izz*cos(X(9)));
% c16= - ((Iyy - Iyy*sin(X(7))^2 + Izz*sin(X(7))^2)*(U(4) - beta*X(11) + Ixx*X(8)*X(10)*cos(X(9)) + Iyy*X(8)*X(10)*cos(X(9)) - Izz*X(8)*X(10)*cos(X(9)) - Ixx*X(12)*X(10)*sin(2*X(9)) + Iyy*X(12)*X(10)*sin(2*X(9)) + Iyy*X(10)^2*cos(X(7))*sin(X(7))*sin(X(9)) - Izz*X(10)^2*cos(X(7))*sin(X(7))*sin(X(9)) - 2*Iyy*X(8)*X(10)*cos(X(7))^2*cos(X(9)) + 2*Izz*X(8)*X(10)*cos(X(7))^2*cos(X(9)) - 2*Iyy*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7)) + 2*Izz*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7)) - 2*Iyy*X(12)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9)) + 2*Izz*X(12)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9))))/(Iyy*Izz*(sin(X(9))^2 - 1)) - (sin(X(9))*(Iyy - Iyy*sin(X(7))^2 + Izz*sin(X(7))^2)*(U(2) - beta*X(7) + X(10)*(Ixx*X(12)*cos(X(9)) - sin(X(7))*(Iyy - Izz)*(X(10)*cos(X(7)) + X(12)*cos(X(9))*sin(X(7))) + X(12)*cos(X(7))^2*cos(X(9))*(Iyy - Izz)) + X(12)^2*cos(X(7))*cos(X(9))^2*sin(X(7))*(Iyy - Izz)))/(Iyy*Izz*(sin(X(9))^2 - 1)) - (2*cos(X(7))*sin(X(7))*(Iyy/2 - Izz/2)*(U(3) - beta*X(9) - X(8)*(Ixx*X(12)*cos(X(9)) + X(12)*cos(X(7))^2*cos(X(9))*(Iyy - Izz) - 2*cos(X(7))*sin(X(7))*(X(10) + X(12)*sin(X(7)))*(Iyy/2 - Izz/2)) + X(12)^2*cos(X(9))*sin(X(9))*(Ixx - Izz - Iyy*sin(X(7))^2 + Izz*sin(X(7))^2) + X(8)*X(10)*cos(X(7))*sin(X(7))*(Iyy - Izz)))/(Iyy*Izz*cos(X(9)));

F=[c11;
%    c12;
   c13;
%    c14;
   c15];
%    c16];


end

