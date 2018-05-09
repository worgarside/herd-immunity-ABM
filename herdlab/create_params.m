function create_params

global PARAM

PARAM.VACC_SPEED = 1;               % Speed of vaccinated
PARAM.VULN_SPEED = 1;               % Speed of vulnerable
PARAM.INFEC_SPEED = 1;              % Speed of infected
PARAM.INFEC_LIFE = 20;              % Number of steps taken for death chance to be active
PARAM.INFEC_DEATH_CHANCE = 0.05;	% Chance of dying per step after INFEC_LIFE
PARAM.VACC_MAX_AGE = 50;            % Maximum age of vaccinated agent
PARAM.VULN_MAX_AGE = 50;            % Maximum age of vulnerable agent
PARAM.INFEC_MAX_AGE = 50;           % Maximum age of infected agent
PARAM.VACC_BREED_FREQ = 30;         % Iterations between offspring generation
PARAM.VULN_BREED_FREQ = 30;         % Iterations between offspring generation
PARAM.INFEC_BREED_FREQ = 30;        % Iterations between offspring generation
PARAM.VACC_BREED_CHANCE = 0.1;      % Chance of vaccinated breeding
PARAM.VULN_BREED_CHANCE = 0.1;      % Chance of vulnerable breeding
PARAM.INFEC_BREED_CHANCE = 0.05;    % Chance of infected breeding