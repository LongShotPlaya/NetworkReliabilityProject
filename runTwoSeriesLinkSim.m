%% Function runTwoSeriesLinkSim()
% Parameters
%  K - the number of packets in the application message
%  p - the probability of failure for an individual link
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runTwoSeriesLinkSim(K, p, N)

    simResults = ones(1, N); % a place to store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
    
        while pktSuccessCount < K
            
            % Simulate the first link
            if rand > p
                % Successful transmission through the first link
                pktSuccessCount = pktSuccessCount + 1;
            end
            
            txAttemptCount = txAttemptCount + 1; % count 1st attempt
            
            % Simulate the second link
            if rand > p
                % Successful transmission through the second link
                pktSuccessCount = pktSuccessCount + 1;
            end
        end
        
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before the entire application message (K successful packets) is transmitted
    end

    result = mean(simResults);
end
