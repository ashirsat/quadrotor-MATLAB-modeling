%% (/Users/aniketshirsat/Documents/MATLAB/Thesis/quad_model/3dofmodel/Hover_controller_09_10_2014.m)
clc;
clear all;
close all;
%% run('Longitudinal__linear_models_final_file.m')
%%% Linearisation file (/Users/aniketshirsat/Documents/MATLAB/Thesis/
%%% quad_model/3dofmodel/longitudinal_forward_flight_for_zdot_zero_M1.m)
clc;
clear all;
close all;

syms x y z ;
opt='NaN';
mode='up_vary_for_cons';

g=9.81;         % Acceleration due to gravity
m=0.468;        % mass of the quadrotor
l=0.225;        % Length of the arms
k=2.980*10^-6;%2.980*10^-6;
b=1.140*10^-7;

Ixx=4.856*10^-3; % Moment of Inertia about body x axis
Iyy=4.856*10^-3; % Moment of Inertia about body y axis
Izz=8.801*10^-3; % Moment of Inetaia about body z axis

Ax=0.25; % Co-efficient of drag along body x axis
Ay=0.25; % Co-efficient of drag along body y axis
Az=0.25; % Co-efficient of drag along body z axis
beta=0.25;

tic;
xdeq_x=0:0.1:10;
n=length(xdeq_x);

%% Longitudinal Flight Condition
%% For Longitudinal Flight:
%% Phi=Phid=0; ydot=0; Psi=Psid=0; zdot=0;
%% Tau_phi=Tau_psi=0
br=0;
xeq_z0=zeros(n,1);
zdeq_z0=0*ones(n,1)';
thx0=atan((Ax.*xdeq_x)./(m*g+Az.*zdeq_z0));
thetaeq_z0=thx0;
small=0.001;

as=0.02;
for i=1:n
    Te_z0(i)=(Az*zdeq_z0(i)+g*m)/(cos(thetaeq_z0(i)));%*cos(phieq_x0(i)));
    Tanaly(i)=sqrt((((Ax)*xdeq_x(i))^2) + (m*g)^2);  
end



disp('Generating linear A,B,C,D for zero forward velocity and varying upward velocity');
%% Upper and  lower bounds on states and control inputs
lbstatez0=diag([1 1 1]);
ubstatez0=diag([1 1 1]);
lbinputz0=diag([0.8 0.1]);
ubinputz0=diag([1.2 1.2]);
%% Getting linear models

for i=1:n
    %% Setting the equilibrium conditions
    xfor_z0(:,i)=[xdeq_x(i) zdeq_z0(i) thetaeq_z0(i)]';
    ufor_z0(:,i)=[Te_z0(i) 0]';
    %% Linearisation function
    [xtrim_z0(:,i), funvalz0(:,i)]=quad_long_trim_2(xfor_z0(:,i),ufor_z0(:,i)...
                                                  ,lbstatez0,ubstatez0,...
                                                  lbinputz0, ubinputz0);
    xdoteq_z0(:,i)=xtrim_z0(1,i);
    zdoteq_z0(:,i)=xtrim_z0(2,i);
    Thetaeq_z0(:,i)=xtrim_z0(3,i);    
    Teq_z0(:,i)=xtrim_z0(4,i);
    ttheeq_z0(:,i)=xtrim_z0(5,i);
    %% Verification with the non-linear model
    F1_z0(:,i)=nonlineareqnvalues(xtrim_z0(1:3,i),xtrim_z0(4:5,i));
    %% Generating state space matrices for the longitudinal flight 
    [A_zcu_xfvlin_z0(:,:,i),B_zcu_xfvlin_z0(:,:,i),C_zcu_xfvlin_z0(:,:,i),...
    D_zcu_xfvlin_z0(:,:,i)]=Jacobian_long_2(xtrim_z0(1:3,i),xtrim_z0(4:5,i));%,'6doflong_xz');
    sys_zcu_xfvlin_z0(:,:,i)=ss(A_zcu_xfvlin_z0(:,:,i),...
                                B_zcu_xfvlin_z0(:,:,i),...
                                C_zcu_xfvlin_z0(:,:,i),[],...
                                'statename',{'Zdot' 'Xdot' 'Theta' 'Thed'},...
                                'inputname',{'Thrust' '{\tau_\theta}'},...
                                'outputname',{'Zdot' 'Xdot'});%,'Theta','Thed'}));
    [Eigzfsolve_z0(:,i)]=eig(sys_zcu_xfvlin_z0(:,:,i));
    s=tf('s');
    Hs_xvfzculin0(:,:,i)=zpk((sys_zcu_xfvlin_z0(:,:,i)));
    Tz_xvfzculin0(:,i)=tzero(sys_zcu_xfvlin_z0(:,:,i));
    save('Plant_forward_flight.mat','sys_zcu_xfvlin_z0');
    save('Plant_zdot_zero_xdot_vary_upward_forward.mat','sys_zcu_xfvlin_z0');
    save('Teq','Teq_z0');
    save('Tautheta','ttheeq_z0')
    save('xdoteq','xdoteq_z0')
    save('zdoteq','zdoteq_z0')
    save('thetaeq','Thetaeq_z0');
end

