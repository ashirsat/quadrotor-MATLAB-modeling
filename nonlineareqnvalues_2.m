function [ Fval ] = nonlineareqnvalueseqnvalues( X, U )
%NONLINEAREQNVALUESEQNVALUES Summary of this function goes here
%   Checking the equilibrium values with the nonlinear model

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
% T=k*(U(1)^2+ U(2)^2 + U(3)^2 + U(4)^2);
T=U(1);
tphi=0;%l*k*(-U(2)^2 + U(4)^2);
tthe=U(2);%l*k*(-U(1)^2 + U(3)^2);
tpsi=0;%b*(U(2)^2 + U(4)^2 - U(1)^2 - U(3)^2);
xd=X(1);
yd=0;
zd=X(2);
phi=0;
phid=0;
theta=X(3);
thed=0;
psi=0;
psid=0;
beta=0.25;
xdd= (T*sin(theta))/m - (Ax*xd)/m;
% ydd= T/m*(sin(psi)*cos(phi)*sin(theta)-cos(psi)*sin(phi))-(Ay*yd)/m;
zdd=(T*cos(theta))/m - g - (Az*zd)/m;
% phidd = - (sin(theta)*(Iyy - Iyy*sin(phi)^2 + Izz*sin(phi)^2)*(tpsi + Ixx*phid*thed*cos(theta) + Iyy*phid*thed*cos(theta) - Izz*phid*thed*cos(theta) - Ixx*psid*thed*sin(2*theta) + Iyy*psid*thed*sin(2*theta) + Iyy*thed^2*cos(phi)*sin(phi)*sin(theta) - Izz*thed^2*cos(phi)*sin(phi)*sin(theta) - 2*Iyy*phid*thed*cos(phi)^2*cos(theta) + 2*Izz*phid*thed*cos(phi)^2*cos(theta) - 2*Iyy*phid*psid*cos(phi)*cos(theta)^2*sin(phi) + 2*Izz*phid*psid*cos(phi)*cos(theta)^2*sin(phi) - 2*Iyy*psid*thed*cos(phi)^2*cos(theta)*sin(theta) + 2*Izz*psid*thed*cos(phi)^2*cos(theta)*sin(theta)))/(Iyy*Izz*(sin(theta)^2 - 1)) - ((tphi + thed*(Ixx*psid*cos(theta) - sin(phi)*(Iyy - Izz)*(thed*cos(phi) + psid*cos(theta)*sin(phi)) + psid*cos(phi)^2*cos(theta)*(Iyy - Izz)) + psid^2*cos(phi)*cos(theta)^2*sin(phi)*(Iyy - Izz))*(Iyy*Izz + Ixx*Iyy*sin(theta)^2 - Iyy*Izz*sin(theta)^2 - Ixx*Iyy*sin(phi)^2*sin(theta)^2 + Ixx*Izz*sin(phi)^2*sin(theta)^2))/(Ixx*Iyy*Izz*(sin(theta)^2 - 1)) - (cos(phi)*sin(phi)*sin(theta)*(Iyy - Izz)*(tthe - phid*(Ixx*psid*cos(theta) + psid*cos(phi)^2*cos(theta)*(Iyy - Izz) - 2*cos(phi)*sin(phi)*(thed + psid*sin(phi))*(Iyy/2 - Izz/2)) + psid^2*cos(theta)*sin(theta)*(Ixx - Izz - Iyy*sin(phi)^2 + Izz*sin(phi)^2) + phid*thed*cos(phi)*sin(phi)*(Iyy - Izz)))/(Iyy*Izz*cos(theta)) - beta*phi;
thetadd=(tthe/Iyy); %)/Iyy;
% psidd= (Izz*tpsi + Izz*tphi*sin(theta) + Iyy*tpsi*cos(phi)^2 - Izz*tpsi*cos(phi)^2 + (Izz^2*psid*thed*sin(2*theta))/2 + Iyy*tphi*cos(phi)^2*sin(theta) - Izz*tphi*cos(phi)^2*sin(theta) - Izz^2*phid*thed*cos(theta) - (Ixx*Izz*psid*thed*sin(2*theta))/2 + (Iyy*Izz*psid*thed*sin(2*theta))/2 - Iyy*tthe*cos(phi)*cos(theta)*sin(phi) + Izz*tthe*cos(phi)*cos(theta)*sin(phi) + Ixx*Izz*phid*thed*cos(theta) + Iyy*Izz*phid*thed*cos(theta) - Iyy^2*phid*thed*cos(phi)^2*cos(theta) + Izz^2*phid*thed*cos(phi)^2*cos(theta) - Iyy^2*phid*psid*cos(phi)^3*cos(theta)^2*sin(phi) - Izz^2*phid*psid*cos(phi)^3*cos(theta)^2*sin(phi) + Iyy^2*psid^2*cos(phi)*cos(theta)^2*sin(phi)*sin(theta) - Izz^2*psid^2*cos(phi)*cos(theta)^2*sin(phi)*sin(theta) - Iyy^2*phid*psid*cos(phi)^2*cos(theta)*sin(phi) + Iyy^2*phid*psid*cos(phi)^4*cos(theta)*sin(phi) + 2*Izz^2*phid*psid*cos(phi)*cos(theta)^2*sin(phi) - Izz^2*phid*psid*cos(phi)^2*cos(theta)*sin(phi) + Izz^2*phid*psid*cos(phi)^4*cos(theta)*sin(phi) + Iyy^2*psid*thed*cos(phi)^2*cos(theta)*sin(theta) - Izz^2*psid*thed*cos(phi)^2*cos(theta)*sin(theta) + Ixx*Iyy*phid*thed*cos(phi)^2*cos(theta) - Ixx*Izz*phid*thed*cos(phi)^2*cos(theta) + 2*Iyy*Izz*phid*psid*cos(phi)^3*cos(theta)^2*sin(phi) - Ixx*Iyy*psid^2*cos(phi)*cos(theta)^2*sin(phi)*sin(theta) + Ixx*Izz*psid^2*cos(phi)*cos(theta)^2*sin(phi)*sin(theta) + Ixx*Iyy*phid*psid*cos(phi)*cos(theta)^2*sin(phi) - Ixx*Izz*phid*psid*cos(phi)*cos(theta)^2*sin(phi) - 2*Iyy*Izz*phid*psid*cos(phi)*cos(theta)^2*sin(phi) + 2*Iyy*Izz*phid*psid*cos(phi)^2*cos(theta)*sin(phi) - 2*Iyy*Izz*phid*psid*cos(phi)^4*cos(theta)*sin(phi) - Ixx*Iyy*psid*thed*cos(phi)^2*cos(theta)*sin(theta) + Ixx*Izz*psid*thed*cos(phi)^2*cos(theta)*sin(theta))/(Iyy*Izz*cos(theta)^2) -beta*psi;
% c11=(250*k*(U(1)^2+U(2)^2+U(3)^2+U(4)^2)*(sin(X(7))*sin(X(11)) + cos(X(7))*cos(X(11))*sin(X(9))))/117 - (125*X(2))/234;
% c12=- (125*X(4))/234 - (250*k*(U(1)^2+U(2)^2+U(3)^2+U(4)^2)*(cos(X(11))*sin(X(7)) - cos(X(7))*sin(X(11))*sin(X(9))))/117;
% c13=(250*k*(U(1)^2+U(2)^2+U(3)^2+U(4)^2)*cos(X(7))*cos(X(9)))/117 - (125*X(6))/234 - 981/100;
% c14=(11698535590903044325595185267343360*l*k*(-U(2)^2+U(4)^2) - 5243804443371492749301702497140736*l*k*(-U(2)^2+U(4)^2)*cos(X(7))^2 + 11698535590903044325595185267343360*b*(U(1)^2+U(3)^2-U(2)^2-U(4)^2)*sin(X(9)) + 102958811735537690717176652419600*X(12)*X(10)*cos(X(9)) + 5243804443371492749301702497140736*l*k*(-U(2)^2+U(4)^2)*cos(X(7))^2*cos(X(9))^2 + 5328682961656338744358208076340*X(8)*X(10)*sin(2*X(9)) - 5243804443371492749301702497140736*b*(U(1)^2+U(3)^2-U(2)^2-U(4)^2)*cos(X(7))^2*sin(X(9)) - 46150722906112506614230118133460*X(12)^2*cos(X(7))*cos(X(9))^2*sin(X(7)) + 46150722906112506614230118133460*X(10)^2*cos(X(7))*cos(X(9))^2*sin(X(7)) - 46150722906112506614230118133460*X(12)*X(10)*cos(X(7))^2*cos(X(9)) - 46150722906112506614230118133460*X(12)*X(10)*cos(X(7))^2*cos(X(9))^3 + 46150722906112506614230118133460*X(8)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9)) + 5243804443371492749301702497140736*l*k*(-U(1)^2+U(3)^2)*cos(X(7))*cos(X(9))*sin(X(7))*sin(X(9)) + 66837531435213044053321778961581*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7))*sin(X(9)) - 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^2*cos(X(9))*sin(X(7))*sin(X(9)) + 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^4*cos(X(9))*sin(X(7))*sin(X(9)) - 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^3*cos(X(9))^2*sin(X(7))*sin(X(9)))/(56808088829425184102946534286140*cos(X(9))^2);
% c15=(2621902221685746374650851248570368*b*(U(1)^2+U(3)^2-U(2)^2-U(4)^2)*sin(2*X(7)) + 6454731147531551576293482770202624*l*k*(-U(1)^2+U(3)^2)*cos(X(9)) - 31344174452413214927808076980801*X(8)*X(12)*cos(X(9))^2 + 5243804443371492749301702497140736*l*k*(-U(1)^2+U(3)^2)*cos(X(7))^2*cos(X(9)) + 4777105847911431736046796477218*X(8)*X(12)*cos(X(7))^3*cos(X(9)) + 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^5*cos(X(9)) + 5243804443371492749301702497140736*l*k*(-U(2)^2+U(4)^2)*cos(X(7))*sin(X(7))*sin(X(9)) - 46150722906112506614230118133460*X(12)^2*cos(X(7))^2*cos(X(9))^2*sin(X(9)) + 41373617058201074878183321656242*X(8)*X(12)*cos(X(7))^2*cos(X(9))^2 - 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^4*cos(X(9))^2 - 25463914377011969175138457305339*X(8)*X(12)*cos(X(7))*cos(X(9)) - 46150722906112506614230118133460*X(8)*X(10)*cos(X(7))*cos(X(9))*sin(X(7)) + 46150722906112506614230118133460*X(12)*X(10)*cos(X(7))*cos(X(9))*sin(X(7))*sin(X(9)))/(56808088829425184102946534286140*cos(X(9)));
% c16=(11698535590903044325595185267343360*b*(U(1)^2+U(3)^2-U(2)^2-U(4)^2) - 5243804443371492749301702497140736*b*(U(1)^2+U(3)^2-U(2)^2-U(4)^2)*cos(X(7))^2 + 11698535590903044325595185267343360*l*k*(-U(2)^2+U(4)^2)*sin(X(9)) + 10657365923312677488716416152680*X(8)*X(10)*cos(X(9)) + 51479405867768845358588326209800*X(12)*X(10)*sin(2*X(9)) - 5243804443371492749301702497140736*l*k*(-U(2)^2+U(4)^2)*cos(X(7))^2*sin(X(9)) + 46150722906112506614230118133460*X(8)*X(10)*cos(X(7))^2*cos(X(9)) + 5243804443371492749301702497140736*l*k*(-U(1)^2+U(3)^2)*cos(X(7))*cos(X(9))*sin(X(7)) - 46150722906112506614230118133460*X(12)^2*cos(X(7))*cos(X(9))^2*sin(X(7))*sin(X(9)) + 66837531435213044053321778961581*X(8)*X(12)*cos(X(7))*cos(X(9))^2*sin(X(7)) - 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^2*cos(X(9))*sin(X(7)) + 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^4*cos(X(9))*sin(X(7)) - 46150722906112506614230118133460*X(12)*X(10)*cos(X(7))^2*cos(X(9))*sin(X(9)) - 20686808529100537439091660828121*X(8)*X(12)*cos(X(7))^3*cos(X(9))^2*sin(X(7)))/(56808088829425184102946534286140*cos(X(9))^2);
Fval=[xdd;
%     ydd;
    zdd;
%     phidd;
    thetadd];
% psidd];

end

