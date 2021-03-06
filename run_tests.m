function run_tests()

% function to run several consecutive herdlab tests and save results as
% jpegs

env_size = 35;      % size of arena side length
step_count = 150;   % total number of steps to simulate
plot_control = 0;   % how often to plot the graph (0 = only at the end)
quick_stop = false; % stop if the susceptible or infectedall die 
img_output = true;  % save graph as an image

% Reset the random seed here so it is the same for all herdlab simulations
random_selection(1);

% Define starting ratio and then iterate through it with the herdlab
% function, keeping all other values constant
agents = [...
    36 0 4;...
    30 6 4;...
    24 12 4;...
    18 18 4;...
    12 24 4;...
    6 30 4;...
    0 36 4;...
];

for i = 1:size(agents)
    susc_count = agents(i, 1);
    vacc_count = agents(i, 2);
    infec_count = agents(i, 3);
    
    fprintf(...
        '\nherdlab(%i, %03i, %03i, %i, %i, %i, %i, %i);',...
        env_size,...
        susc_count,...
        vacc_count,...
        infec_count,...
        step_count,...
        plot_control,...
        quick_stop,...
        img_output...
        );
    
    herdlab(...
        env_size,...
        susc_count,...
        vacc_count,...
        infec_count,...
        step_count,...
        plot_control,...
        quick_stop,...
        img_output...
        );
    
end
end

