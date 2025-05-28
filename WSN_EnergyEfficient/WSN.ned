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
            @display("p=918,416;i=old/cogwheel;is=s");
        }
        sensorNode1: SensorNode {
            @display("p=550,785;i=old/cogwheel;is=s");
        }
        sensorNode2: SensorNode {
            @display("p=835,783;i=old/cogwheel;is=s");
        }
        sensorNode3: SensorNode {
            @display("p=745,386;i=old/cogwheel;is=s");
        }
        sensorNode4: SensorNode {
            @display("p=552,295;i=old/cogwheel;is=s");
        }
        sensorNode5: SensorNode {
            @display("p=299,552;i=old/cogwheel;is=s");
        }
        sensorNode6: SensorNode {
            @display("p=448,444;i=old/cogwheel;is=s");
        }
        sensorNode7: SensorNode {
            @display("p=382,687;i=old/cogwheel;is=s");
        }
        sensorNode8: SensorNode {
            @display("p=685,173;i=old/cogwheel;is=s");
        }
        sensorNode9: SensorNode {
            @display("p=873,205;i=old/cogwheel;is=s");
        }
        sensorNode10: SensorNode {
            @display("p=1064,297;i=old/cogwheel;is=s");
        }
        sensorNode11: SensorNode {
            @display("p=1144,707;i=old/cogwheel;is=s");
        }
        sensorNode12: SensorNode {
            @display("p=791,904;i=old/cogwheel;is=s");
        }
        sensorNode13: SensorNode {
            @display("p=315,341;i=old/cogwheel;is=s");
        }
        sensorNode14: SensorNode {
            @display("p=1106,476;i=old/cogwheel;is=s");
        }

        accessPoint0: AccessPoint {
            @display("p=639,582;i=device/antennatower");
        }
        accessPoint1: AccessPoint {
            @display("p=871,584;i=device/antennatower");
        }

        adhocRouting: ADHOCRouting {
            @display("p=112.607994,88.32;i=device/router;is=s");
        }
}
