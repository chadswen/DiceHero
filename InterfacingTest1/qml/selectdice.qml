import QtQuick 1.0
import "boardLogic.js" as Script

Rectangle {

    signal showScreen(string msg)

    id: screenBase

    width: 360; height: 640

    SystemPalette {
        id: activePalette
    }

    Item {
        id: screen
        width: parent.width; height: parent.height
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Rectangle {
                anchors.fill: parent
                color: "purple"
        }

        Button {
            id: selectD4
            anchors {
                top: parent.top
            }
            text: "D4"
            onClicked: Script.incd4
        }

        Button {
            id: selectD6
            anchors {
                left: selectD4.right
            }
            text: "D6"
            onClicked: Script.incd6
        }

        Button {
            id: selectD8
            anchors {
                left: selectD6.right
            }
            text: "D8"
            onClicked: Script.incd8
        }

        Button {
            id: selectD10
            anchors {
                left: parent.left
                top: selectD4.bottom
            }
            text: "D10"
            onClicked: Script.incd10
        }

        Button {
            id: selectD12
            anchors {
                left: selectD10.right
                top: selectD6.bottom
            }
            text: "D12"
            onClicked: Script.incd12
        }

        Button {
            id: selectD20
            anchors {
                left: selectD12.right
                top: selectD8.bottom
            }
            text: "D20"
            onClicked: Script.incd20
        }

        Button {
            id: finalize
            anchors {
                bottom: screen.bottom
                horizontalCenter: screen.horizontalCenter
            }
            text: "Roll Dice"
            onClicked: Script.finalizeBoard(), screenBase.showScreen("engine.qml")
        }
    }
}
