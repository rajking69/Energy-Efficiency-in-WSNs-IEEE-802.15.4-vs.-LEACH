package WSN_EnergyEfficient;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.AdhocHost;
import inet.node.inet.WirelessHost;
import inet.physicallayer.wireless.ieee802154.packetlevel.Ieee802154NarrowbandScalarRadioMedium;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;
import inet.routing.aodv.Aodv;
import inet.routing.dsdv.Dsdv;

module SensorNode extends AdhocHost
{
    parameters:
        @display("i=device/sensors;is=l;r=,,#707070;b=30,30,oval");
        wlan[*].radio.transmitter.power = default(2.24mW);
        wlan[*].radio.receiver.sensitivity = default(-85dBm);
        wlan[*].radio.receiver.energyDetection = default(-85dBm);
        wlan[*].radio.receiver.snirThreshold = default(4dB);
}

module AccessPoint extends WirelessHost
{
    parameters:
        @display("i=device/antennatower;is=l;r=,,#000000;b=40,40,oval");
        wlan[*].radio.transmitter.power = default(2.24mW);
        wlan[*].radio.receiver.sensitivity = default(-85dBm);
        wlan[*].radio.receiver.energyDetection = default(-85dBm);
        wlan[*].radio.receiver.snirThreshold = default(4dB);
}

network WSN_EnergyEfficient
{
    parameters:
        @display("bgb=1035,738,,,0;bgg=100,1,grey98;i=background/green,,0");
        
        // Minimal Essential Dashboard
        @figure[legend_box](type=rectangle; pos=835,50; size=220,250; fillColor=white; fillOpacity=0.95; lineColor=#e0e0e0; lineWidth=1; cornerRadius=8);
        @figure[legend_header](type=rectangle; pos=835,50; size=220,40; fillColor=#f8f9fa; fillOpacity=0.95; lineColor=#e0e0e0; lineWidth=1; cornerRadius=8,8,0,0);
        @figure[legend_title](type=text; pos=845,70; text="Sensor Network Status"; font=bold,13; color=#2c3e50);
        
        // Essential Environmental Data
        @figure[sensors_title](type=text; pos=845,105; text="Environmental Data"; font=bold,12; color=#34495e);
        @figure[temp_info](type=text; pos=855,130; text="● Temperature (22-28°C)"; font=normal,11; color=#3498db);
        @figure[humid_info](type=text; pos=855,150; text="● Humidity (45-65%)"; font=normal,11; color=#e67e22);
        @figure[press_info](type=text; pos=855,170; text="● Pressure (1010-1015 hPa)"; font=normal,11; color=#2ecc71);
        
        // Cluster Information
        @figure[cluster_title](type=text; pos=845,200; text="Network Clusters"; font=bold,12; color=#34495e);
        @figure[cluster_1](type=text; pos=855,220; text="● Cluster 1 (8 Nodes)"; font=normal,11; color=#95a5a6);
        @figure[cluster_2](type=text; pos=855,240; text="● Cluster 2 (7 Nodes)"; font=normal,11; color=#e67e22);
        
        // Essential Visualization Elements
        // Cluster Areas
        @figure[cluster1_circle](type=oval; pos=300,200; size=400,300; fillColor=#95a5a6; fillOpacity=0.05; lineColor=#95a5a6; lineWidth=1.5; lineStyle=dashed);
        @figure[cluster2_circle](type=oval; pos=700,400; size=400,300; fillColor=#e67e22; fillOpacity=0.05; lineColor=#e67e22; lineWidth=1.5; lineStyle=dashed);
        
        // Critical Alerts Only
        @figure[alert1](type=text; pos=700,350; text="⚠ 28°C"; font=normal,10; color=#e74c3c);
        @figure[alert2](type=text; pos=750,450; text="⚠ 65%"; font=normal,10; color=#e74c3c);

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=100,100");
            networkRouteVisualizer.lineColor = "blue";
            networkRouteVisualizer.lineWidth = 2;
            physicalLinkVisualizer.lineColor = "green";
            mobilityVisualizer.displayMovementTrails = true;
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=100,200");
        }

        radioMedium: Ieee802154NarrowbandScalarRadioMedium {
            @display("p=100,300");
        }

        // Existing nodes with enhanced visualization
        sensorNode0: SensorNode {
            @display("p=676,601;t=Sensor 0;i=misc/sensor");
        }
        sensorNode1: SensorNode {
            @display("p=754,143;t=Sensor 1;i=misc/sensor");
        }
        sensorNode2: SensorNode {
            @display("p=729,455;t=Sensor 2;i=misc/sensor");
        }
        sensorNode3: SensorNode {
            @display("p=582,502;t=Sensor 3;i=misc/sensor");
        }
        sensorNode4: SensorNode {
            @display("p=453,600;t=Sensor 4;i=misc/sensor");
        }
        sensorNode5: SensorNode {
            @display("p=281,409;t=Sensor 5;i=misc/sensor");
        }
        sensorNode6: SensorNode {
            @display("p=255,535;t=Sensor 6;i=misc/sensor");
        }
        sensorNode7: SensorNode {
            @display("p=384,301;t=Sensor 7;i=misc/sensor");
        }
        sensorNode8: SensorNode {
            @display("p=281,142;t=Sensor 8;i=misc/sensor");
        }
        sensorNode9: SensorNode {
            @display("p=245,268;t=Sensor 9;i=misc/sensor");
        }
        sensorNode10: SensorNode {
            @display("p=453,74;t=Sensor 10;i=misc/sensor");
        }
        sensorNode11: SensorNode {
            @display("p=594,354;t=Sensor 11;i=misc/sensor");
        }
        sensorNode12: SensorNode {
            @display("p=652,231;t=Sensor 12;i=misc/sensor");
        }
        sensorNode13: SensorNode {
            @display("p=622,98;t=Sensor 13;i=misc/sensor");
        }
        sensorNode14: SensorNode {
            @display("p=806,312;t=Sensor 14;i=misc/sensor");
        }

        accessPoint0: AccessPoint {
            @display("p=453,433;t=Gateway 1");
        }
        accessPoint1: AccessPoint {
            @display("p=510,200;t=Gateway 2");
        }
}
