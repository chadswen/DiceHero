import QtQuick 1.0
import "createDice.js" as Script

Rectangle {

    signal showScreen(string msg)

    id: screen

    width: 360; height: 640

    SystemPalette {
        id: activePalette
    }

    Item {
        id: background
        width: parent.width; height: parent.height
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Rectangle {
                anchors.fill: parent
                color: "green"
        }
    }

    Item {
        id: topToolbar
        width: parent.width; height: parent.height
        anchors{
            top: screen.top
            topMargin: 20
            horizontalCenter: screen.horizontalCenter
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
                border.color:  "black"
                border.width:  2
                opacity: .4
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
            color: "#000000"
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
            font.family: "Helvetica [Cronyx]"
            font.pixelSize: 20
            color: "#000000"
            wrapMode: Text.WordWrap
            style: Text.Raised
            anchors.left: statusText.right
        }
    }
    Button {
        id: selectDiceButton
        anchors {
            bottom: screen.bottom;
            bottomMargin: 75;
            horizontalCenter: screen.horizontalCenter
        }

        text: "Choose Dice"
        onClicked: screen.showScreen("selectdice.qml")
    }
}
