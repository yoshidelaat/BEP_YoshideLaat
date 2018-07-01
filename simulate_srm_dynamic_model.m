%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- name --
%   "simulate_srm_dynamic_model.m"
%       created by ir. Brandon Caasenbrood (27/9/17)    
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- description -- 
%   Simulates the free response of a 3-DOF soft robot manipulator 
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- Remarks -- 
%   This scrip is alterd by Yoshi de Laat (01/07/18) to be able to
%   run the extened model.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% init
clc; clear; close all;

addpath('lib');
addpath('src');

name = 'simulate_srm_dynamic_model';
name_sim = 'dynamical_model_extended';

call_display( 'excuting simulate_srm_dynamic_model.m' );
logger( name ,date, 'created setup', 0, 1, 0 );
run('data_simulate_srm_dynamic_model.m');

%% simulink
call_display ( 'excuting simulink simulation (press Ctrl + C to interrupt)' );
sim(name_sim)
call_display ( 'simulation done!' );
return

%% plot
call_display ( 'plotting results' );

figure(1);
subplot(3,1,1);
call_plot(-1,t,q(:,1),'k-','', '$l$ [m]',3);
subplot(3,1,2);
call_plot(-1,t,q(:,2),'k-','', '$\kappa_x$ [m$^{-1}$]',3);
subplot(3,1,3);
call_plot(-1,t,q(:,3),'k-','', '$\kappa_y$ [m$^{-1}$]',3);

figure
hold on;

axis equal;

n = 1;
for i = 1:1:length(t)
    [x(n),y(n),z(n)] = compute_srm_position(q(i,1), q(i,2), q(i,3)); 
    n = n+1;
end

% snaphots = [1 200 1000 2000 4000];
% 
% n= 1;
% for i = snaphots
%     [X{n},Y{n},Z{n}] = compute_srm_curve(q(i,1), q(i,2), q(i,3),100); 
%     plot3(X{n},Y{n},Z{n},'k','linewidth',0.5); hold on;
%     n = n+1;
% end

plot3(x,y,z,'k','linewidth',1); hold on;
plot3(x(1),y(1),z(1),'k.','MarkerSize',15);
axis vis3d;
axis tight
view(120,30);
grid on; box on;

xlabel('x-dim (m)','interpreter','latex')
ylabel('y-dim (m)','interpreter','latex')
zlabel('z-dim (m)','interpreter','latex')


%% additional code to run my model
addpath('Snelheid');
x = timeseries(x,t);
y = timeseries(y,t); 
z = timeseries(z,t);

ddq = timeseries(ddq,t);

save('Snelheid\positionXYZ','x','y','z','dt','t_span')
save('Snelheid\q','q')
RunSimulink


