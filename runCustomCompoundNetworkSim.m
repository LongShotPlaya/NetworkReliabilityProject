%% Function runCustomCompoundNetworkSim()
% Parameters
%  K - the number of packets in the application message
%  p_values - a vector of probability of failure for each link
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runCustomCompoundNetworkSim(K, p_values, N)

    simResults = ones(1, N); % a place to store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
    
        while pktSuccessCount < K
            
            % Simulate transmission across the parallel links
            for j = 1:length(p_values)
                if rand > p_values(j)
                    % Successful transmission through at least one parallel link
                    pktSuccessCount = pktSuccessCount + 1;
                    break; % exit the loop if successful transmission
                end
            end
            
            txAttemptCount = txAttemptCount + 1; % count transmission attempt
            
            % Simulate transmission across the series link
            if rand > p_values(end)
                % Successful transmission through the series link
                pktSuccessCount = pktSuccessCount + 1;
            end
        end
        
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before the entire application message (K successful packets) is transmitted
    end

    result = mean(simResults);
end
