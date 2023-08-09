import QtQuick 2.0
import Car2Qml 1.0

Rectangle {
    id: instrumentcluster
    color: "black"
    width: 1280
    height: 400

    property int timer_interval: 100
    property int speed: 0
    property int battery: 0
    property bool brake: false

    function gui_update(){
        carinfo.dbus_update() //get data from dbus

        instrumentcluster.speed = carinfo.speed
        instrumentcluster.battery = carinfo.battery
        instrumentcluster.brake = carinfo.brake
    }

    LeftCluster {
        x: 146
        y: 43
    }

    RightCluster {
        x: 774
        y: 43
    }

    GearSelection {
        x: 512
        y: 43
    }

    CenterCar {
        x: 430
        y: 160
    }

    Timer {
        interval: instrumentcluster.timer_interval; running: true; repeat: true   // 50mms frequency update
        onTriggered: instrumentcluster.gui_update() //id window
    }

    Car2Qml{
        id: carinfo
    }
}
