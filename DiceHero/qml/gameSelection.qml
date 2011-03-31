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

        Component.onCompleted: {            //this code bit is needed or else nulls will be added to nulls upon use of the engine.qml file creating a NAN.
            var temp = myDice;
            Script.clearData(temp);
            myDice = temp;
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
        text: "Choose your mode wisely, Hero!"
        anchors.horizontalCenterOffset: 1
    }
}
        Button {
            id: heroModeButton
            x: 96
            y: 193
            anchors {
                bottom: screen.bottom;
                bottomMargin: 414
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "Hero Mode"
            anchors.horizontalCenterOffset: 0
           onClicked: screen.showScreen("selectdice.qml")
        }


        Text {
            id: heroModeText
            width:textHolder.width
            height: 60
            anchors {
                top: heroModeButton.bottom;
                topMargin: 5
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
            text: "Freestyle Rolling"
        }

        Button {
            id: motherloadButton
            x: 96
            y: 304
            width: 170
            height: 35
            text: "Motherload"
            anchors.horizontalCenterOffset: 0
            anchors.bottomMargin: 433
            onClicked: {
                rolls = 13;
                var temp = myDice;
                VarHold.motherloadDice(temp);
                myDice = temp;
                returnFile="RerollSelection.qml", screen.showScreen("engine.qml");
            }
    }

        Text {
            id: motherloadText
            width:textHolder.width
            height: 60
            anchors {
                top: motherloadButton.bottom;
                topMargin: 5
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
            text: "A \"Yahzt-ish\" family favorite!"
        }



        Button {
            id: quitButton
            text: "Quit"
            opacity: .8
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: Qt.quit()
        }


}
