import Qt 4.7
import QtQuick 1.0
import Box2D 1.0


Image {

    id: screen
    width: 360;
    height: 640;


    SystemPalette {
        id: activePalette
    }
    anchors.fill: parent
    source: "board.png"
    smooth: true

    // box2d elements start here
    World {
            id: world;
            anchors.fill: parent
            gravity: Qt.point(-accX*20*currentlyRolling +2, -accY*20*currentlyRolling -3); // 20 is the current scale up factor


       /* Repeater {
            model: 8
            delegate: D6 {
                x: Math.random() * (screen.width - 70)+35; //randomly placed 35px away from edge
                y: Math.random() * (screen.height / 3); //randomly placed in top third of screen
                rotation: Math.random() * 90;
            }
        }*/

        Wall {
            id: ground
            anchors { left: parent.left; right: parent.right; top: parent.bottom }
        }
        Wall {
            id: ceiling
            anchors { left: parent.left; right: parent.right; bottom: parent.top }
        }
        Wall {
            id: leftWall
            anchors { right: parent.left; bottom: ground.top; top: ceiling.bottom }
        }
        Wall {
            id: rightWall
            anchors { left: parent.right; bottom: ground.top; top: ceiling.bottom }
        }

    }

    Text {
        id:xLabel
        x: 395
        y: 137
        color: "#45c3c3"
        text: "X Acceleration: " + accX
        anchors.verticalCenterOffset: -92
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }


    Text {
        id:yLabel
        x: 395
        y: 212
        color: "#45c3c3"
        text: "Y Acceleration: " + accY
        anchors.verticalCenterOffset: -17
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id:zLabel
        x: 395
        y: 282
        color: "#45c3c3"
        text: "Z Acceleration: " + accZ
        anchors.verticalCenterOffset: 53
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    HoldButton {
                id: rollBtn
                anchors {
                    bottom: screen.bottom
                    bottomMargin: 50
                    horizontalCenter: screen.horizontalCenter
                }
                text: "Hold to Roll!"
                onPressed: {
                    calibrate();
                    currentlyRolling = true;
                }
                onReleased: {
                    currentlyRolling =  false;
                }
    }



}
