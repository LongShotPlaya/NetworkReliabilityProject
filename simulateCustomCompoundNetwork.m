% Simulation parameters
N = 1000; % Number of simulations

% Define different scenarios with packet failure probabilities
scenarios = [
    0.1, 0.6, 0.01;  % Scenario 1
    0.6, 0.1, 0.01;  % Scenario 2
    0.1, 0.01, 0.6;  % Scenario 3
    0.6, 0.01, 0.1;  % Scenario 4
    0.01, 0.1, 0.6;  % Scenario 5
    0.01, 0.6, 0.1   % Scenario 6
];

% Values of K
K_values = [1, 5, 10];

% Create a cell array to store results for each scenario
all_results = cell(size(scenarios, 1), length(K_values));

% Plot for each scenario
for scenario_index = 1:size(scenarios, 1)
    p_values = scenarios(scenario_index, :);

    % Plot for each K value
    for k_index = 1:length(K_values)
        K = K_values(k_index);

        % Simulate results
        simulated_results = zeros(1, N);
        for i = 1:N
            simulated_results(i) = runCustomCompoundNetworkSim(K, p_values, N);
        end

        % Store simulated results
        all_results{scenario_index, k_index} = simulated_results;
    end
end

% Save all results to a single file
save('all_results.mat', 'all_results');

% Load the saved results
load('all_results.mat');

% Now you can access the simulated results using all_results{i, j}
% For example, to access the results for scenario 1 and K = 5:
scenario_index = 1;
K_index = 2;
simulated_results = all_results{scenario_index, K_index};

% You can then use these results for further analysis or plotting.

