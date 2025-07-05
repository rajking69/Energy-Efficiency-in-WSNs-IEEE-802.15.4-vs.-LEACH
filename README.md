# WSN Energy Efficient
> Advanced Implementation of LEACH Protocol for Energy-Efficient Wireless Sensor Networks

[![OMNeT++](https://img.shields.io/badge/OMNeT++-6.1.0-blue.svg)](https://omnetpp.org/)
[![INET](https://img.shields.io/badge/INET-4.5.0-green.svg)](https://inet.omnetpp.org/)
[![License](https://img.shields.io/badge/license-Academic-yellow.svg)](LICENSE)

## Project Team
| Role | Name | ID |
|------|------|------|
| **Team Leader** | Sheikh Mohammad Rajking | C221011 |
| Member 1 | Adrishikar Barua | C221022 |
| Member 2 | Abu Tanvir Hasan Tanmoy | C221001 |

## Table of Contents
- [Overview](#overview)
- [Technical Architecture](#technical-architecture)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Performance Analysis](#performance-analysis)
- [Documentation](#documentation)
- [Future Work](#future-work)

## Overview
This project implements an advanced energy-efficient Wireless Sensor Network (WSN) using the LEACH (Low Energy Adaptive Clustering Hierarchy) protocol. Built on OMNeT++ with INET framework integration, it focuses on optimizing network lifetime through intelligent clustering and energy management.

### Key Objectives
- Minimize network energy consumption
- Extend WSN lifetime through efficient clustering
- Optimize data transmission paths
- Provide real-time network visualization
- Enable comprehensive performance analysis

## Technical Architecture

### Network Components
```
WSN Architecture
├── Base Station (Gateway)
├── Sensor Nodes
│   ├── Cluster Heads (Dynamic)
│   └── Member Nodes
└── Network Parameters
    ├── Frequency: 2.4 GHz
    ├── Bandwidth: 2 MHz
    └── TX Power: 2.24 mW
```

### Protocol Stack
- **Physical Layer**: IEEE 802.15.4
- **MAC Layer**: TDMA + CSMA/CA
- **Network Layer**: LEACH Protocol
- **Application Layer**: Sensor Data Collection

### Energy Model
```ini
Energy Configuration:
- Initial: 0.15J
- Threshold: 0.06J
- Generation: 3mW
```

## Features

### 1. LEACH Implementation
- Dynamic cluster head rotation
- Energy-aware node selection
- Adaptive clustering mechanism
- Optimized TDMA scheduling

### 2. Network Visualization
- Real-time energy monitoring
- Dynamic cluster formation display
- Node status tracking
- Data flow visualization
- Professional minimalist legend

### 3. Sensor Capabilities
| Sensor Type | Range | Resolution |
|-------------|-------|------------|
| Temperature | -40°C to 125°C | 0.1°C |
| Humidity | 0-100% RH | 0.1% |
| Pressure | 300-1100 hPa | 0.1 hPa |

### 4. Energy Management
- Real-time consumption tracking
- Dynamic power adjustment
- State-based energy modeling
- Threshold-based node control

## Requirements
- OMNeT++ 6.1.0
- INET Framework 4.5.0
- C++ Compiler (C++14 or later)
- Minimum 8GB RAM
- 64-bit OS (Windows/Linux)

## Installation

1. **Environment Setup**
```bash
# Clone repository
git clone https://github.com/your-repo/WSN_EnergyEfficient.git

# Navigate to project
cd WSN_EnergyEfficient

# Build project
make clean
make makefiles
make
```

2. **IDE Configuration**
```bash
# Import project in OMNeT++ IDE
File -> Import -> Existing Projects into Workspace
Select WSN_EnergyEfficient directory
```

## Configuration

### Network Parameters
```ini
# omnetpp.ini
[General]
network = WSN_EnergyEfficient
sim-time-limit = 200s

# Node Configuration
*.sensorNode*.energyStorage.nominalCapacity = 0.15J
*.sensorNode*.energyStorage.initialCapacity = 0.15J

# LEACH Parameters
*.sensorNode*.clusterHeadProbability = 0.05
```

### Radio Configuration
```ini
# IEEE 802.15.4 Settings
**.wlan[*].typename = "Ieee802154NarrowbandInterface"
**.wlan[*].radio.transmitter.power = 2.24mW
**.wlan[*].radio.receiver.sensitivity = -85dBm
```

## Usage

### Running Simulations
1. Open OMNeT++ IDE
2. Select WSN_EnergyEfficient project
3. Choose configuration:
   - General (IEEE 802.15.4)
   - LEACH
4. Run/Debug simulation

### Analysis Tools
- Energy consumption graphs
- Network lifetime analysis
- Packet delivery statistics
- Cluster formation metrics

## Performance Analysis

### Metrics
- Network Lifetime
- Energy Consumption
- Packet Delivery Ratio
- Clustering Efficiency
- End-to-End Delay

### Visualization Features
- Energy level indicators
- Cluster boundaries
- Node status
- Data paths
- Sensor readings

## Documentation

### Project Structure
```
WSN_EnergyEfficient/
├── src/
│   ├── LeachNode.cc
│   ├── LeachNode.h
│   └── WSN.ned
├── simulations/
│   └── omnetpp.ini
├── results/
└── doc/
```

### Key Files
- `LeachNode.h/cc`: LEACH protocol implementation
- `WSN.ned`: Network definition
- `omnetpp.ini`: Simulation parameters

## Future Work
1. Multi-hop clustering implementation
2. Machine learning integration
3. Mobile node support
4. Advanced energy harvesting
5. Cross-layer optimization

## Contributing
We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md).

## License
This project is licensed under the Academic License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
- OMNeT++ Development Team
- INET Framework Contributors
- Department of Computer Science & Engineering
- [Your University Name]

## Contact
For technical queries:
- Sheikh Mohammad Rajking - C221011@ugrad.iiuc.ac.bd
- Adrishikar Barua - C221022@ugrad.iiuc.ac.bd
- Abu Tanvir Hasan Tanmoy - C221001@ugrad.iiuc.ac.bd

---
*Last Updated: March 2024* 