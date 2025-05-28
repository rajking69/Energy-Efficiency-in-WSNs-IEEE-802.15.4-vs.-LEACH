package WSN_EnergyEfficient;

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.arp.Arp;
import inet.node.inet.AccessPoint;
import inet.node.inet.SensorNode;
import inet.world.radio.ChannelControl;
import inet.routing.extras.ADHOCRouting;

network WSN
{
    parameters:
        @display("bgb=1960.704,1322.5919,black;bgi=background/terrain,s");
    submodules:
        configurator: IPv4NetworkConfigurator {
            config = xml("<config><interface hosts='*' address='192.168.x.x' netmask='255.255.0.0'/></config>");
            @display("p=276,70.656;i=block/cogwheel");
        }

        channelControl: ChannelControl {
            @display("p=112.607994,225.21599;i=misc/sun");
        }

        sensorNode0: SensorNode {
            @display("p=1088.544,991.39197;i=old/cogwheel");
        }
        sensorNode1: SensorNode {
            @display("p=801.50397,927.36;i=old/cogwheel");
        }
        sensorNode2: SensorNode {
            @display("p=1000.224,393.024;i=old/cogwheel");
        }
        sensorNode3: SensorNode {
            @display("p=638.112,328.992;i=old/cogwheel");
        }
        sensorNode4: SensorNode {
            @display("p=869.95197,209.76;i=old/cogwheel");
        }
        sensorNode5: SensorNode {
            @display("p=377.568,680.06396;i=old/cogwheel");
        }
        sensorNode6: SensorNode {
            @display("p=328.992,443.80798;i=old/cogwheel");
        }
        sensorNode7: SensorNode {
            @display("p=514.464,900.86395;i=old/cogwheel");
        }
        sensorNode8: SensorNode {
            @display("p=1485.984,633.696;i=old/cogwheel");
        }
        sensorNode9: SensorNode {
            @display("p=1156.992,185.472;i=old/cogwheel");
        }
        sensorNode10: SensorNode {
            @display("p=1329.216,328.992;i=old/cogwheel");
        }
        sensorNode11: SensorNode {
            @display("p=1267.392,547.584;i=old/cogwheel");
        }
        sensorNode12: SensorNode {
            @display("p=1397.664,812.544;i=old/cogwheel");
        }
        sensorNode13: SensorNode {
            @display("p=446.016,227.424;i=old/cogwheel");
        }
        sensorNode14: SensorNode {
            @display("p=1088.544,744.096;i=old/cogwheel");
        }

        accessPoint0: AccessPoint {
            @display("p=639,582;i=device/antennatower;is=l");
        }
        accessPoint1: AccessPoint {
            @display("p=871,584;i=device/antennatower;is=l");
        }

        adhocRouting: ADHOCRouting {
            @display("p=112.607994,88.32;i=device/router;is=s");
        }
}
