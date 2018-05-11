function run_tests()

env_size = 10;
step_count = 500;
plot_control = 0;
quick_stop = false;
img_output = true;

agents = [36 0 4; 26 10 4; 16 20 4; 6 30 4; 1 35 4];
disease = [0; 0.1; 0.2; 0.3; 0.4; 0.5; 0.6; 0.7; 0.8; 0.9; 1];

for i = 1:size(agents)
    vuln_count = agents(i, 1);
    vacc_count = agents(i, 2);
    infec_count = agents(i, 3);
    
    for j = 1:size(disease)
        lethality = disease(j);
        
        fprintf(...
            '\n\nherdlab(%i, %03i, %03i, %i, %i, %.1f, %i, %i, %i);\n',...
            env_size,...
            vuln_count,...
            vacc_count,...
            infec_count,...
            step_count,...
            lethality,...
            plot_control,...
            quick_stop,...
            img_output...
            );
        
        herdlab(env_size,...
            vuln_count,...
            vacc_count,...
            infec_count,...
            step_count,...
            lethality,...
            plot_control,...
            quick_stop,...
            img_output...
            );
    end
end
end

