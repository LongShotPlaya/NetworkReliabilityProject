%% Function runTwoParallelLinkSim()
% Parameters
%  K - the number of packets in the application message
%  p - the probability of failure for an individual link
%  N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runTwoParallelLinkSim(K, p, N)

    simResults = ones(1, N); % a place to store the result of each simulation
    
    for i = 1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across
    
        while pktSuccessCount < K
            
            % Simulate transmission across two parallel links
            if rand > p || rand > p
                % Successful transmission through at least one link
                pktSuccessCount = pktSuccessCount + 1;
            end
            
            txAttemptCount = txAttemptCount + 1; % count transmission attempt
        end
        
        simResults(i) = txAttemptCount; % record total number of attempted transmissions before the entire application message (K successful packets) is transmitted
    end

    result = mean(simResults);
end
