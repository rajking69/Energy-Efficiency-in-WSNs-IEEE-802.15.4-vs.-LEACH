#ifndef __WSN_ENERGYEFFICIENT_LEACHNODE_H
#define __WSN_ENERGYEFFICIENT_LEACHNODE_H

#include <omnetpp.h>
#include "inet/node/inet/AdhocHost.h"
#include "inet/common/ModuleAccess.h"
#include "inet/networklayer/common/L3AddressResolver.h"
#include "inet/power/storage/SimpleEpEnergyStorage.h"

using namespace omnetpp;
using namespace inet;

class LeachNode : public AdhocHost
{
  protected:
    // LEACH parameters
    bool isClusterHead;
    double clusterHeadProbability;
    int roundNumber;
    double initialEnergy;
    double threshold;
    
    // Current cluster head for this node (if not a CH)
    L3Address currentClusterHead;
    
    // Energy monitoring
    power::SimpleEpEnergyStorage *energyStorage;
    
    // Statistics
    simsignal_t roundChangeSignal;
    simsignal_t clusterHeadChangeSignal;
    simsignal_t residualEnergySignal;
    simsignal_t packetsToBaseStationSignal;
    simsignal_t packetsToClusterHeadSignal;
    
    // Timers
    cMessage *roundTimer;
    cMessage *advertisementTimer;
    cMessage *scheduleTimer;
    cMessage *dataTransmissionTimer;
    
    // Constants
    static const simtime_t ROUND_DURATION;
    static const simtime_t ADVERTISEMENT_PHASE_DURATION;
    static const simtime_t SCHEDULE_PHASE_DURATION;
    static const simtime_t DATA_TRANSMISSION_PHASE_DURATION;
    
  protected:
    virtual void initialize(int stage) override;
    virtual void handleMessage(cMessage *msg) override;
    virtual void finish() override;
    
    // LEACH protocol phases
    void startNewRound();
    void selectClusterHead();
    void advertiseClusterHead();
    void joinCluster(L3Address clusterHeadAddr);
    void createTDMASchedule();
    void transmitData();
    
    // Helper functions
    double calculateThreshold();
    double getResidualEnergy();
    void sendToClusterHead(cPacket *packet);
    void sendToBaseStation(cPacket *packet);
    
  public:
    LeachNode();
    virtual ~LeachNode();
};

#endif 