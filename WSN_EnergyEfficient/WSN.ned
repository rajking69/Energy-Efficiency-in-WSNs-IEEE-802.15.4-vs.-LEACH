package WSN_EnergyEfficient;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.AdhocHost;
import inet.node.inet.WirelessHost;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;
import inet.routing.aodv.Aodv;
import inet.routing.dsdv.Dsdv;
module SensorNode extends AdhocHost
{
    parameters:
        @display("i=device/wifilaptop");
}

module AccessPoint extends WirelessHost
{
    parameters:
        @display("i=device/antennatower");
}

network WSN_EnergyEfficient
{
    @display("bgb=900,650,,,0;i=background/terrain,,0");

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=100,100");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=100,200");
        }

        radioMedium: Ieee80211ScalarRadioMedium {
            @display("p=100,300");
        }

        sensorNode0: SensorNode {
            @display("p=770,394");
        }
        sensorNode1: SensorNode {
            @display("p=729,203");
        }
        sensorNode2: SensorNode {
            @display("p=573,501");
        }
        sensorNode3: SensorNode {
            @display("p=704,501");
        }
        sensorNode4: SensorNode {
            @display("p=463,483");
        }
        sensorNode5: SensorNode {
            @display("p=283,395");
        }
        sensorNode6: SensorNode {
            @display("p=326,501");
        }
        sensorNode7: SensorNode {
            @display("p=356,103");
        }
        sensorNode8: SensorNode {
            @display("p=232,146");
        }
        sensorNode9: SensorNode {
            @display("p=245,268");
        }
        sensorNode10: SensorNode {
            @display("p=573,99");
        }
        sensorNode11: SensorNode {
            @display("p=442,179");
        }
        sensorNode12: SensorNode {
            @display("p=604,203");
        }
        sensorNode13: SensorNode {
            @display("p=757,111");
        }
        sensorNode14: SensorNode {
            @display("p=704,301");
        }

        accessPoint0: AccessPoint {
            @display("p=433,301");
        }
        accessPoint1: AccessPoint {
            @display("p=565,365");
        }
}
