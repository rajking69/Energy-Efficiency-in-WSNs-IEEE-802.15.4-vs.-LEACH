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
        @display("i=device/wifilaptop");
}

module AccessPoint extends WirelessHost
{
    parameters:
        @display("i=device/antennatower");
}

network WSN_EnergyEfficient
{
    parameters:
        @display("bgb=936,688,,,0;bgg=100,1,grey95;i=background/terrain,,0");
        @figure[title](type=label; pos=0,0; anchor=sw; color=darkblue);

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=100,100");
        }

        configurator: Ipv4NetworkConfigurator {
            @display("p=100,200");
        }

        radioMedium: Ieee802154NarrowbandScalarRadioMedium {
            @display("p=100,300");
        }

        sensorNode0: SensorNode {
            @display("p=676,601");
        }
        sensorNode1: SensorNode {
            @display("p=754,143");
        }
        sensorNode2: SensorNode {
            @display("p=729,455");
        }
        sensorNode3: SensorNode {
            @display("p=582,502");
        }
        sensorNode4: SensorNode {
            @display("p=453,600");
        }
        sensorNode5: SensorNode {
            @display("p=281,409");
        }
        sensorNode6: SensorNode {
            @display("p=255,535");
        }
        sensorNode7: SensorNode {
            @display("p=384,301");
        }
        sensorNode8: SensorNode {
            @display("p=281,142");
        }
        sensorNode9: SensorNode {
            @display("p=245,268");
        }
        sensorNode10: SensorNode {
            @display("p=453,74");
        }
        sensorNode11: SensorNode {
            @display("p=583,345");
        }
        sensorNode12: SensorNode {
            @display("p=652,231");
        }
        sensorNode13: SensorNode {
            @display("p=622,98");
        }
        sensorNode14: SensorNode {
            @display("p=806,312");
        }

        accessPoint0: AccessPoint {
            @display("p=453,433");
        }
        accessPoint1: AccessPoint {
            @display("p=510,200");
        }
}
