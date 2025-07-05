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
        @display("i=misc/sensor;is=l;r=,,#707070;b=30,30,oval");
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
        @display("bgb=1035,872,,,0;bgg=100,1,grey95;i=background/green,,0");

        // Main Cluster Areas 
        @figure[cluster1_outer](type=oval; pos=300,200; size=340,240; fillColor=#e6f3ff; fillOpacity=0.05; lineColor=#3399ff; lineWidth=2; lineStyle=solid);
        @figure[cluster1_inner](type=oval; pos=300,200; size=320,220; fillColor=#e6f3ff; fillOpacity=0.1; lineColor=#3399ff; lineWidth=1; lineStyle=solid);
        @figure[cluster1_core](type=oval; pos=300,200; size=300,200; fillColor=#e6f3ff; fillOpacity=0.15; lineColor=#3399ff; lineWidth=1; lineStyle=solid);
        @figure[cluster1_info](type=text; pos=300,145; anchor=c; text="Temperature Monitoring Cluster"; font=bold,14; color=#0066cc);
        @figure[cluster1_stats](type=text; pos=300,165; anchor=c; text="Coverage: 85% | Range: -40°C to 125°C"; font=bold,12; color=#0066cc);

        @figure[cluster2_outer](type=oval; pos=700,400; size=340,240; fillColor=#ffe6e6; fillOpacity=0.05; lineColor=#ff3333; lineWidth=2; lineStyle=solid);
        @figure[cluster2_inner](type=oval; pos=700,400; size=320,220; fillColor=#ffe6e6; fillOpacity=0.1; lineColor=#ff3333; lineWidth=1; lineStyle=solid);
        @figure[cluster2_core](type=oval; pos=700,400; size=300,200; fillColor=#ffe6e6; fillOpacity=0.15; lineColor=#ff3333; lineWidth=1; lineStyle=solid);
        @figure[cluster2_info](type=text; pos=700,345; anchor=c; text="Humidity Monitoring Cluster"; font=bold,14; color=#cc0000);
        @figure[cluster2_stats](type=text; pos=700,365; anchor=c; text="Coverage: 90% | Range: 0-100% RH"; font=bold,12; color=#cc0000);

        @figure[cluster3_outer](type=oval; pos=500,600; size=290,220; fillColor=#e6ffe6; fillOpacity=0.05; lineColor=#33cc33; lineWidth=2; lineStyle=solid);
        @figure[cluster3_inner](type=oval; pos=500,600; size=270,200; fillColor=#e6ffe6; fillOpacity=0.1; lineColor=#33cc33; lineWidth=1; lineStyle=solid);
        @figure[cluster3_core](type=oval; pos=500,600; size=250,180; fillColor=#e6ffe6; fillOpacity=0.15; lineColor=#33cc33; lineWidth=1; lineStyle=solid);
        @figure[cluster3_info](type=text; pos=500,545; anchor=c; text="Pressure Monitoring Cluster"; font=bold,14; color=#009900);
        @figure[cluster3_stats](type=text; pos=500,565; anchor=c; text="Coverage: 75% | Range: 300-1100 hPa"; font=bold,12; color=#009900);

        // Network Zones 
        @figure[zone_critical](type=rectangle; pos=400,300; size=400,200; fillColor=#fff0f0; fillOpacity=0.05; lineColor=#ff6666; lineWidth=1; lineStyle=dashed);
        @figure[zone_critical_info](type=text; pos=400,295; anchor=c; text="Critical Zone | 24/7 Monitoring"; font=bold,12; color=#cc3333);

        @figure[zone_normal](type=rectangle; pos=600,500; size=400,200; fillColor=#f0fff0; fillOpacity=0.05; lineColor=#66ff66; lineWidth=1; lineStyle=dashed);
        @figure[zone_normal_info](type=text; pos=600,495; anchor=c; text="Standard Zone | Periodic Monitoring"; font=bold,12; color=#33cc33);

        // Connection Lines
        @figure[conn1](type=line; points=300,200,700,400; lineColor=#999999; lineStyle=dotted; lineWidth=1);
        @figure[conn2](type=line; points=700,400,500,600; lineColor=#999999; lineStyle=dotted; lineWidth=1);
        @figure[conn3](type=line; points=300,200,500,600; lineColor=#999999; lineStyle=dotted; lineWidth=1);

        // Enhanced Minimalist Legend
        @figure[legend_box](type=rectangle; pos=850,50; size=200,180; fillColor=white; fillOpacity=0.98; lineColor=#444444; lineWidth=1.5; cornerRadius=5);
        @figure[legend_title](type=text; pos=860,75; text="Network Sensors"; font=bold,12; color=#333333);
        @figure[legend_temp](type=text; pos=870,100; text="● Temperature"; font=bold,11; color=#0066cc);
        @figure[legend_temp_range](type=text; pos=885,120; text="(-40°C to 125°C)"; font=normal,10; color=#666666);
        @figure[legend_humid](type=text; pos=870,140; text="● Humidity"; font=bold,11; color=#cc0000);
        @figure[legend_humid_range](type=text; pos=885,160; text="(0-100% RH)"; font=normal,10; color=#666666);
        @figure[legend_press](type=text; pos=870,180; text="● Pressure"; font=bold,11; color=#009900);
        @figure[legend_press_range](type=text; pos=885,200; text="(300-1100 hPa)"; font=normal,10; color=#666666);
        @figure[legend_divider](type=line; points=860,210,1030,210; lineColor=#dddddd; lineWidth=1);
        @figure[legend_gateway](type=text; pos=870,225; text="▲ Gateway Node"; font=bold,11; color=#333333);

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

        // Temperature Monitoring Sensors (Blue Cluster)
        sensorNode0: SensorNode {
            @display("p=676,601;t=-10°C;i=misc/sensor;is=l;r=,,#3399ff");
        }
        sensorNode1: SensorNode {
            @display("p=754,143;t=25°C;i=misc/sensor;is=l;r=,,#3399ff");
        }
        sensorNode2: SensorNode {
            @display("p=729,455;t=15°C;i=misc/sensor;is=l;r=,,#3399ff");
        }
        sensorNode3: SensorNode {
            @display("p=582,502;t=22°C;i=misc/sensor;is=l;r=,,#3399ff");
        }
        sensorNode4: SensorNode {
            @display("p=453,600;t=18°C;i=misc/sensor;is=l;r=,,#3399ff");
        }

        // Humidity Monitoring Sensors (Red Cluster)
        sensorNode5: SensorNode {
            @display("p=281,409;t=45%;i=misc/sensor;is=l;r=,,#ff3333");
        }
        sensorNode6: SensorNode {
            @display("p=255,535;t=60%;i=misc/sensor;is=l;r=,,#ff3333");
        }
        sensorNode7: SensorNode {
            @display("p=384,301;t=55%;i=misc/sensor;is=l;r=,,#ff3333");
        }
        sensorNode8: SensorNode {
            @display("p=281,142;t=65%;i=misc/sensor;is=l;r=,,#ff3333");
        }
        sensorNode9: SensorNode {
            @display("p=245,268;t=50%;i=misc/sensor;is=l;r=,,#ff3333");
        }

        // Pressure Monitoring Sensors (Green Cluster)
        sensorNode10: SensorNode {
            @display("p=453,74;t=1013hPa;i=misc/sensor;is=l;r=,,#33cc33");
        }
        sensorNode11: SensorNode {
            @display("p=594,354;t=1015hPa;i=misc/sensor;is=l;r=,,#33cc33");
        }
        sensorNode12: SensorNode {
            @display("p=652,231;t=1010hPa;i=misc/sensor;is=l;r=,,#33cc33");
        }
        sensorNode13: SensorNode {
            @display("p=622,98;t=1012hPa;i=misc/sensor;is=l;r=,,#33cc33");
        }
        sensorNode14: SensorNode {
            @display("p=806,312;t=1014hPa;i=misc/sensor;is=l;r=,,#33cc33");
        }

        // Gateway Nodes 
        accessPoint0: AccessPoint {
            @display("p=453,433;t=Primary;i=device/antennatower;is=l;r=,,#000000");
        }
        accessPoint1: AccessPoint {
            @display("p=510,200;t=Backup;i=device/antennatower;is=l;r=,,#000000");
        }
}
