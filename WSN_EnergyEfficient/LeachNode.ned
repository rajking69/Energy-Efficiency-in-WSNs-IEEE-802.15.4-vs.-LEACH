package WSN_EnergyEfficient;

import inet.node.inet.AdhocHost;

module LeachNode extends SensorNode
{
    parameters:
        @class(LeachNode);
        bool isClusterHead = default(false);
        double clusterHeadProbability = default(0.05);  // P: desired percentage of cluster heads
        int roundNumber = default(0);                   // Current round number
        double initialEnergy = default(0.15);           // Initial energy in Joules
        double threshold = default(0.0);                // Threshold for CH selection
        
        @signal[roundChange](type=long);
        @signal[clusterHeadChange](type=bool);
        @signal[residualEnergy](type=double);
        @signal[packetsToBS](type=long);
        @signal[packetsToClusterHead](type=long);
        
        @statistic[roundNumber](source=roundChange; record=vector,stats);
        @statistic[isClusterHead](source=clusterHeadChange; record=vector,stats);
        @statistic[residualEnergy](source=residualEnergy; record=vector,stats);
        @statistic[packetsToBS](source=packetsToBS; record=vector,sum,count);
        @statistic[packetsToClusterHead](source=packetsToClusterHead; record=vector,sum,count);
} 