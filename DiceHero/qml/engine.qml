import Qt 4.7
import QtQuick 1.0
import Box2D 1.0
import "createDice.js" as Script


Image {
    signal showScreen(string msg)
    id: engine
    width: 360;
    height: 640;


    SystemPalette {
        id: activePalette
    }
    anchors.fill: parent
    source: "felt.jpg"
    //source: "board.png"
    smooth: true


    Item {
        id: topToolbar
        width: parent.width; height: parent.height
        anchors{
            top: engine.top
            topMargin: 20
            horizontalCenter: engine.horizontalCenter
        }
        Button2 {
            id: clearButton
            text: "Clear Dice"
            anchors.rightMargin:20
            onClicked: console.log("nothingyet")
            anchors.right: topToolbar.right
        }
        Rectangle {
                id: status
                height: clearButton.height; width: 180
                border.color:  "#CCCCCC"
                color: "black"
                border.width:  4
                opacity: .7
                radius: 10
                anchors {
                    left: topToolbar.left
                    leftMargin:20
                }
        }
        Text {
            id: statusText
            smooth: true
            font.bold: false
            font.pixelSize: 20
            color: "#CCCCCC"
            wrapMode: Text.WordWrap
            text: "Dice on Table: "
            anchors.left: status.left
            anchors.leftMargin: 7
            anchors.top: status.top
            anchors.topMargin: 5
            anchors.bottom:  status.bottom
            anchors.bottomMargin: 5
        }
        Text {
            id: statusDynamicText
            font.bold: false
            smooth: true
            font.pixelSize: 20
            color: "#CCCCCC"
            wrapMode: Text.WordWrap
            style: Text.Raised
            anchors.top: status.top
            anchors.topMargin: 5
            anchors.right: status.right
            anchors.rightMargin: 7
            anchors.bottom:  status.bottom
            anchors.bottomMargin: 5
            Component.onCompleted: {
                var temp = myDice;
                Script.getNumberDice(myDice);
                myDice = temp;
            }
            text:  Script.getNumberDice(myDice);
        }
    }
    // box2d elements start here
    World {
            id: world;
            anchors.fill: parent
            gravity: Qt.point(-accX*20*currentlyRolling, -accY*20*currentlyRolling -5*!currentlyRolling); // 20 is the current scale up factor
            Component.onCompleted: {
                var temp = myDice;
                Script.finalizeBoard(temp);
                myDice = temp;
            }

        Wall {
            id: ground
            anchors { left: parent.left; right: parent.right; bottom: parent.bottom;
                bottomMargin: 50; }
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

//for debug purposes
   /* Text {
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
    }*/

    HoldButton {
                id: rollBtn
                anchors {
                    bottom: engine.bottom
                    horizontalCenter: engine.horizontalCenter
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
