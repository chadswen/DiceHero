import Qt 4.7
import QtQuick 1.0
import Box2D 1.0
import "createDice.js" as Script


Image {
    signal showScreen(string msg)
    id: engine
    width: 360;
    height: 640;

    property int timeout: 0


    SystemPalette {
        id: activePalette
    }
    anchors.fill: parent
    source: "board.png"
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
            id: returnButton
            text: "Return"
            anchors.rightMargin:20
            onClicked: showScreen(returnFile)
            anchors.right: topToolbar.right
            visible: false
        }
        Rectangle {
            id: status
            height: returnButton.height; width: 180
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
        }
    }

    // box2d elements start here
    World {
        id: world;
        anchors.fill: parent
        gravity: Qt.point(-accX*150*currentlyRolling, -accY*150*currentlyRolling); // 150 is the current scale up factor
        Component.onCompleted: {
            Script.finalizeBoard(myDice);
            statusDynamicText.text = Script.getNumberDice(myDice);
            calibrate();
            currentlyRolling = true;

            //Clear select dice
            var temp = myDice;
            Script.clearData(temp);
            myDice = temp;

            //Clear roll results
            var temp = rollResults;
            Script.clearResults(temp);
            rollResults = temp;
        }

        Wall {
            id: ground
            height: 1
            anchors { left: parent.left; right: parent.right; bottom: parent.bottom;}
        }
        Wall {
            height: 60
            id: ceiling
            anchors { left: parent.left; right: parent.right; top: parent.top;}
        }
        Wall {
            width: 1
            id: leftWall
            anchors { right: parent.left; bottom: ground.top; top: ceiling.bottom }
        }
        Wall {
            width: 1
            id: rightWall
            anchors { left: parent.right; bottom: ground.top; top: ceiling.bottom }
        }

        Connections {
            target: main
            onAccXChanged: {
                calibrate();
            }
            onAccYChanged: {
                calibrate();
            }
        }

        /*DebugDraw {
            id: debugDraw
            world: world
            anchors.fill: world
            opacity: 0.75
            visible: false
        }
        MouseArea {
            id: debugMouseArea
            anchors.fill: world
            onPressed: debugDraw.visible = !debugDraw.visible
        }*/
    }

    //timer to stop rolling, currently 3.5 seconds of no movement.
    Timer{
        interval: 50; running: currentlyRolling; repeat: true;
        onTriggered:{
            if(accX==0 && accY ==0)
                timeout+=50;
            else
                timeout=0;

            if(timeout>=3000){
                currentlyRolling = false;
                returnButton.visible= true;

                for(var i = 0; i<6; i++)
                    console.log("Rolls of diceNumType "+i+": "+rollResults[i]);
                }
            }
    }
    //for debug purposes
    Text {
        id:xLabel
        x: 395
        y: 137
        color: "#CCCCCC"
        text: "X Acceleration: " + accX
        anchors.verticalCenterOffset: -92
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "black"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }


    Text {
        id:yLabel
        x: 395
        y: 212
        color: "#CCCCCC"
        text: "Y Acceleration: " + accY
        anchors.verticalCenterOffset: -17
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "black"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    Text {
        id:timeoutLabel
        x: 395
        y: 282
        color: "#CCCCCC"
        text: "Timeout clock: " + timeout
        anchors.verticalCenterOffset: 53
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "black"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    /*HoldButton {
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
    }*/
}
