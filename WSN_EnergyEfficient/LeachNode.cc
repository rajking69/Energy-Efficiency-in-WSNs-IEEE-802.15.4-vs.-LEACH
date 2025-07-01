#include "LeachNode.h"
#include "inet/common/packet/Packet.h"
#include "inet/networklayer/common/L3AddressTag_m.h"
#include "inet/applications/base/ApplicationPacket_m.h"

Define_Module(LeachNode);

// Define constants
const simtime_t LeachNode::ROUND_DURATION = 20;  // 20 seconds per round
const simtime_t LeachNode::ADVERTISEMENT_PHASE_DURATION = 2;
const simtime_t LeachNode::SCHEDULE_PHASE_DURATION = 3;
const simtime_t LeachNode::DATA_TRANSMISSION_PHASE_DURATION = 15;

LeachNode::LeachNode() {
    roundTimer = nullptr;
    advertisementTimer = nullptr;
    scheduleTimer = nullptr;
    dataTransmissionTimer = nullptr;
}

LeachNode::~LeachNode() {
    cancelAndDelete(roundTimer);
    cancelAndDelete(advertisementTimer);
    cancelAndDelete(scheduleTimer);
    cancelAndDelete(dataTransmissionTimer);
}

void LeachNode::initialize(int stage) {
    AdhocHost::initialize(stage);
    
    if (stage == INITSTAGE_APPLICATION_LAYER) {
        // Initialize parameters
        isClusterHead = par("isClusterHead");
        clusterHeadProbability = par("clusterHeadProbability");
        roundNumber = par("roundNumber");
        initialEnergy = par("initialEnergy");
        
        // Get energy storage module
        energyStorage = check_and_cast<power::SimpleEpEnergyStorage *>(getModuleByPath(".energyStorage"));
        
        // Register signals
        roundChangeSignal = registerSignal("roundChange");
        clusterHeadChangeSignal = registerSignal("clusterHeadChange");
        residualEnergySignal = registerSignal("residualEnergy");
        packetsToBaseStationSignal = registerSignal("packetsToBS");
        packetsToClusterHeadSignal = registerSignal("packetsToClusterHead");
        
        // Create and schedule timers
        roundTimer = new cMessage("roundTimer");
        advertisementTimer = new cMessage("advertisementTimer");
        scheduleTimer = new cMessage("scheduleTimer");
        dataTransmissionTimer = new cMessage("dataTransmissionTimer");
        
        // Start first round
        scheduleAt(simTime() + uniform(0, 1), roundTimer);
    }
}

void LeachNode::handleMessage(cMessage *msg) {
    if (msg->isSelfMessage()) {
        if (msg == roundTimer) {
            startNewRound();
        }
        else if (msg == advertisementTimer) {
            if (isClusterHead) {
                advertiseClusterHead();
            }
        }
        else if (msg == scheduleTimer) {
            if (isClusterHead) {
                createTDMASchedule();
            }
        }
        else if (msg == dataTransmissionTimer) {
            transmitData();
        }
    }
    else {
        // Handle received packets
        Packet *packet = check_and_cast<Packet *>(msg);
        const auto& l3AddressInd = packet->findTag<L3AddressInd>();
        
        if (l3AddressInd != nullptr) {
            if (isClusterHead) {
                // Aggregate data and forward to base station
                sendToBaseStation(packet);
                emit(packetsToBaseStationSignal, 1);
            }
            else {
                // Forward data to cluster head
                sendToClusterHead(packet);
                emit(packetsToClusterHeadSignal, 1);
            }
        }
        
        delete msg;
    }
}

void LeachNode::startNewRound() {
    roundNumber++;
    emit(roundChangeSignal, roundNumber);
    
    // Select whether this node becomes a cluster head
    selectClusterHead();
    
    // Schedule next round
    scheduleAt(simTime() + ROUND_DURATION, roundTimer);
    
    // Schedule advertisement phase
    if (isClusterHead) {
        scheduleAt(simTime() + uniform(0, ADVERTISEMENT_PHASE_DURATION), advertisementTimer);
    }
}

void LeachNode::selectClusterHead() {
    threshold = calculateThreshold();
    double random = uniform(0, 1);
    
    isClusterHead = (random < threshold);
    emit(clusterHeadChangeSignal, isClusterHead);
    
    // Reset cluster head if energy is too low
    if (isClusterHead && getResidualEnergy() < 0.1 * initialEnergy) {
        isClusterHead = false;
        emit(clusterHeadChangeSignal, isClusterHead);
    }
}

double LeachNode::calculateThreshold() {
    if (roundNumber % (int)(1/clusterHeadProbability) == 0) {
        return clusterHeadProbability / (1 - clusterHeadProbability * (roundNumber % (int)(1/clusterHeadProbability)));
    }
    return 0.0;
}

void LeachNode::advertiseClusterHead() {
    if (!isClusterHead) return;
    
    // Create and send advertisement message
    auto packet = new Packet("CH_ADV");
    packet->addTag<L3AddressReq>()->setDestAddress(L3Address::BROADCAST);
    sendToBaseStation(packet);  // Using existing network layer for advertisement
    
    // Schedule TDMA schedule creation
    scheduleAt(simTime() + SCHEDULE_PHASE_DURATION, scheduleTimer);
}

void LeachNode::createTDMASchedule() {
    if (!isClusterHead) return;
    
    // Create and broadcast TDMA schedule
    auto packet = new Packet("TDMA_SCHEDULE");
    packet->addTag<L3AddressReq>()->setDestAddress(L3Address::BROADCAST);
    sendToBaseStation(packet);
    
    // Schedule data transmission phase
    scheduleAt(simTime() + DATA_TRANSMISSION_PHASE_DURATION, dataTransmissionTimer);
}

void LeachNode::transmitData() {
    // Create and send data packet
    auto packet = new Packet("SENSOR_DATA");
    
    if (isClusterHead) {
        sendToBaseStation(packet);
        emit(packetsToBaseStationSignal, 1);
    }
    else {
        sendToClusterHead(packet);
        emit(packetsToClusterHeadSignal, 1);
    }
    
    // Schedule next transmission
    scheduleAt(simTime() + uniform(0, 5), dataTransmissionTimer);
}

double LeachNode::getResidualEnergy() {
    double residualEnergy = energyStorage->getResidualEnergyCapacity().get();
    emit(residualEnergySignal, residualEnergy);
    return residualEnergy;
}

void LeachNode::sendToClusterHead(cPacket *packet) {
    if (!currentClusterHead.isUnspecified()) {
        auto pkt = check_and_cast<Packet *>(packet);
        pkt->addTag<L3AddressReq>()->setDestAddress(currentClusterHead);
        send(pkt, "out");
    }
}

void LeachNode::sendToBaseStation(cPacket *packet) {
    auto pkt = check_and_cast<Packet *>(packet);
    L3AddressResolver resolver;
    auto destAddr = resolver.resolve("accessPoint0");
    pkt->addTag<L3AddressReq>()->setDestAddress(destAddr);
    send(pkt, "out");
}

void LeachNode::finish() {
    AdhocHost::finish();
    
    // Record final statistics
    recordScalar("finalRound", roundNumber);
    recordScalar("finalEnergy", getResidualEnergy());
} 