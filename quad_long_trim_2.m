function [ Xtrim,funval ] = quad_long_trim(x,u,lbx,ubx,lbu,ubu)
%QUAD_LONG_TRIM 
%   The equilibrium values are calcualted around an operating point (x,u) by
%   performing linearization around the operating point with lower (lbx
%   lbu) and upper bounds(ubx ubu) for the operating point value.

%% Operating Point
x_operate=x;
u_operate=u;
%% Setting the bounds for states
lbou_xwei=lbx;
ubou_xwei=ubx;
%% Setting the bounds for inputs
lbou_uwei=lbu;
ubou_uwei=ubu;
%%  Upper and lower bounds on states and inputs
dV_xLB = lbou_xwei*x_operate;
dV_xUB = ubou_xwei*x_operate;
dV_uLB = lbou_uwei*u_operate;
dV_uUB = ubou_uwei*u_operate;
dV_xini=0.5*(dV_xLB+dV_xUB);

%% Initial guess
dV_x0 = [dV_xLB;dV_uLB]*0.5+[dV_xUB;dV_uUB]*(1-0.5);
options=optimoptions('fmincon','Algorithm','interior-point',...
                     'Display','iter-detailed','MaxIter',1e6, ...
                     'MaxFunEvals',1e10);
%% Implementing the minimization using fmincon                 
[dV_Solution, d_FunVal, n_ExitFlag, k_OptimRes] = fmincon(@(X,U)...
                           norm(quad_longitudinal_NL_eqns(x_operate,...
                           u_operate),Inf),dV_x0,[],[],[],[],[dV_xLB;...
                           dV_uLB],[dV_xUB;dV_uUB],[],options);

%% Solution of the minimization
Xtrim=dV_Solution;
%% Function value after minimization
funval=d_FunVal;

end

