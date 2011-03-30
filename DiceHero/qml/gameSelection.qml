import QtQuick 1.0
import Qt.labs.particles 1.0
import "createDice.js" as Script
import "holdingDice.js" as VarHold

Rectangle {

signal showScreen(string msg)

        id: screen

        width: 360; height: 640

        SystemPalette {
                id: activePalette
        }


        Item {
            id: titleBackground
            width: parent.width; height: parent.height
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            Rectangle {
                    anchors.fill: parent
                    color: "black"
            }
        }


        Rectangle {
            id: textHolder

            anchors {
                top: screen.top;
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            color: "black"
            width: 300
            height: 400
            border.color: "#336633"
            border.width: 4
            smooth: true
            radius: 50

    Text {
        id: welcomeText
        x: 11
        y: 27
        width:280
        height: 60
        anchors {
            top: parent.bottom;
            topMargin: -373
            horizontalCenter: parent.horizontalCenter
        }
        font.bold: false
        smooth: true
        font.family: "Helvetica [Cronyx]"
        font.pixelSize: 20
        color: "#AAAAAA"
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        style: Text.Raised
        text: "Pick the application you want to use."
        anchors.horizontalCenterOffset: 1
    }
}
        Button {
            id: selectDiceButton
            x: 96
            y: 193
            anchors {
                bottom: screen.bottom;
                bottomMargin: 414
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "Hero Freeplay"
            anchors.horizontalCenterOffset: 0
            Particles {
                 id: particles
                 width: 1; height: 1
                 anchors.centerIn: parent
                 emissionRate: 0
                 lifeSpan: 700; lifeSpanDeviation: 600
                 angle: 0; angleDeviation: 360;
                 velocity: 100; velocityDeviation: 40
                 source: "d20_side_blue.png"
           }
           onClicked: screen.showScreen("selectdice.qml")
        }

        Button {
            id: selectDiceButton1
            x: 96
            y: 304
            width: 170
            height: 35
            text: "Motherload"
            anchors.horizontalCenterOffset: 0
            anchors.bottomMargin: 433
            onClicked: {
                var temp = myDice;
                VarHold.motherloadDice(temp);
                Script.getNumberDice(temp);
                myDice = temp;
                returnFile="RerollSelection.qml", screen.showScreen("engine.qml");
            }

    }
}
