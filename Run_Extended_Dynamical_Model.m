%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- name --
%   "Run_Extended_Dynamical_Model"
%       created by Yoshi de Laat (01/07/18)    
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- description -- 
%   Simulates the extended dynamical model to see how accurate the 
%   inverse kinematics are.
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% -- instructions -- 
%   This model used an altered version form of
%   "simulate_srm_dynamic_model.m" created by 
%   ir. Brandon Caasenbrood (27/9/17).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run the provided model with extension
simulate_srm_dynamic_model
save = 0;
make_subplot = 1;

% Trim of first element from every vector
tout   = tout(1:end-1);
q_in   = q_in(2:end,:);
q_out  = q_out(2:end,:);
dq_in  = dq_in(2:end,:);
dq_out = dq_out(2:end,:);

if make_subplot == 1
    %% position in vs position out

    figure('position', [400, 50, 850, 550])
    subplot(3,1,1);
    call_plot(-1,tout,q_in(:,1),'k-','', '$l$ [m]',2);
    hold on
    call_plot(-1,tout,q_out(:,1),'r--','', '$l$ [m]',1);
    legend('reference','result')

    subplot(3,1,2);
    call_plot(-1,tout,q_in(:,2),'k-','', '$\kappa_x$ [m$^{-1}$]',2);
    hold on
    call_plot(-1,tout,q_out(:,2),'r--','', '$\kappa_x$ [m$^{-1}$]',1);
    legend('reference','result')

    subplot(3,1,3);
    call_plot(-1,tout,q_in(:,3),'k-','Time [s]', '$\kappa_y$ [m$^{-1}$]',2);
    hold on
    call_plot(-1,tout,q_out(:,3),'r--','Time [s]', '$\kappa_y$ [m$^{-1}$]',1);
    legend('reference','result')

    if save == 1
        saveas(gcf,'Snelheid\Figures\position_in','epsc')
    end

    %% Velocity in vs out
    figure('position', [400, 50, 850, 550]);
    subplot(3,1,1);
    call_plot(-1,tout,dq_in(:,1),'k-','', '$dl$ [m/s]',2);
    hold on
    call_plot(-1,tout,dq_out(:,1),'r--','', '$dl$ [m/s]',1);
    legend('reference','result')

    subplot(3,1,2);
    call_plot(-1,tout,dq_in(:,2),'k-','', '$d\kappa_x$ [(ms)$^{-1}$]',2);
    hold on
    call_plot(-1,tout,dq_out(:,2),'r--','', '$d\kappa_x$ [(ms)$^{-1}$]',1);
    legend('reference','result')

    subplot(3,1,3);
    call_plot(-1,tout,dq_in(:,3),'k-','Time [s]', '$d\kappa_y$ [(ms)$^{-1}$]',2);
    hold on
    call_plot(-1,tout,dq_out(:,3),'r--','Time [s]', '$d\kappa_y$ [(ms)$^{-1}$]',1);
    legend('reference','result')

    if save == 1
        saveas(gcf,'Snelheid\Figures\velocity_in','epsc')
    end

    %% Position error
    figure('position', [400, 50, 850, 550]);
    subplot(3,1,1);
    call_plot(-1,tout,q_out(:,1) - q_in(:,1),'k-','', 'error $l$ [m]',2);

    subplot(3,1,2);
    call_plot(-1,tout,q_out(:,2) - q_in(:,2),'k-','', 'error $\kappa_x$ [m$^{-1}$]',2);

    subplot(3,1,3);
    call_plot(-1,tout,q_out(:,3) - q_in(:,3),'k-','Time [s]', 'error $\kappa_y$ [m$^{-1}$]',2);

    if save == 1
        saveas(gcf,'Snelheid\Figures\position_error','epsc')
    end

    %% Velocity error

    figure('position', [400, 50, 850, 550]);
    subplot(3,1,1)
    call_plot(-1,tout,dq_out(:,1) - dq_in(:,1),'k-','', 'error d$l$ [m/s]',2);

    subplot(3,1,2)
    call_plot(-1,tout,dq_out(:,2) - dq_in(:,2),'k-','', 'error d$\kappa_x$ [(ms)$^{-1}$]',2);

    subplot(3,1,3);
    call_plot(-1,tout,dq_out(:,3) - dq_in(:,3),'k-','Time [s]', 'error d$\kappa_y$ [(ms)$^{-1}$]',2);

    if save == 1
        saveas(gcf,'Snelheid\Figures\velocity_error','epsc')
    end

else
    %% Position in vs position out

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,q_in(:,1),'k-','Time [s]', '$l$ [m]',2);
    hold on
    call_plot(-1,tout,q_out(:,1),'r--','Time [s]', '$l$ [m]',1);
    legend('reference','result')
    if save == 1
        saveas(gcf,'Snelheid\Figures\l_in','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,q_in(:,2),'k-','Time [s]', '$\kappa_x$ [m$^{-1}$]',2);
    hold on
    call_plot(-1,tout,q_out(:,2),'r--','Time [s]', '$\kappa_x$ [m$^{-1}$]',1);
    legend('reference','result')
    if save == 1
        saveas(gcf,'Snelheid\Figures\kappa_x_in','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,q_in(:,3),'k-','Time [s]', '$\kappa_y$ [m$^{-1}$]',2);
    hold on
    call_plot(-1,tout,q_out(:,3),'r--','Time [s]', '$\kappa_y$ [m$^{-1}$]',1);
    legend('reference','result')
    if save == 1
        saveas(gcf,'Snelheid\Figures\kappa_y_in','epsc')
    end

    %% velocity in vs velocity out
    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,dq_in(:,1),'k-','Time [s]', '$dl$ [m/s]',2);
    hold on
    call_plot(-1,tout,dq_out(:,1),'r--','Time [s]', '$dl$ [m/s]',1);
    legend('reference','result')
    if save == 1
        saveas(gcf,'Snelheid\Figures\dl_in','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,dq_in(:,2),'k-','Time [s]', '$d\kappa_x$ [(ms)$^{-1}$]',2);
    hold on
    call_plot(-1,tout,dq_out(:,2),'r--','Time [s]', '$d\kappa_x$ [(ms)$^{-1}$]',1);
    legend('reference','result')
    if save == 1
        saveas(gcf,'Snelheid\Figures\dkappa_x_in','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,dq_in(:,3),'k-','Time [s]', '$d\kappa_y$ [(ms)$^{-1}$]',2);
    hold on
    call_plot(-1,tout,dq_out(:,3),'r--','Time [s]', '$d\kappa_y$ [(ms)$^{-1}$]',1);
    legend('reference','result')
    if save == 1
        saveas(gcf,'Snelheid\Figures\dkappa_y_in','epsc')
    end

    %% Position error
    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,q_out(:,1) - q_in(:,1),'k-','Time [s]', 'error $l$ [m]',2);
    if save == 1
        saveas(gcf,'Snelheid\Figures\l_error','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,q_out(:,2) - q_in(:,2),'k-','Time [s]', 'error $\kappa_x$ [m$^{-1}$]',2);
    if save == 1
        saveas(gcf,'Snelheid\Figures\kappa_x_error','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,q_out(:,3) - q_in(:,3),'k-','Time [s]', 'error $\kappa_y$ [m$^{-1}$]',2);
    if save == 1
        saveas(gcf,'Snelheid\Figures\kappa_y_error','epsc')
    end
    %% Velocity error

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,dq_out(:,1) - dq_in(:,1),'k-','Time [s]', 'error d$l$ [m/s]',2);
    if save == 1
        saveas(gcf,'Snelheid\Figures\dl_error','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,dq_out(:,2) - dq_in(:,2),'k-','Time [s]', 'error d$\kappa_x$ [(ms)$^{-1}$]',2);
    if save == 1
        saveas(gcf,'Snelheid\Figures\dkappa_x_error','epsc')
    end

    figure('position', [250, 250, 1000, 300]);
    call_plot(-1,tout,dq_out(:,3) - dq_in(:,3),'k-','Time [s]', 'error d$\kappa_y$ [(ms)$^{-1}$]',2);
    if save == 1
        saveas(gcf,'Snelheid\Figures\dkappa_y_error','epsc')
    end

end
