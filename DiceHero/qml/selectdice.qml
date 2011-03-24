import QtQuick 1.0
import "createDice.js" as Script

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: 360; height: 640

    Component.onCompleted: {
        var temp = myDice;
        Script.clearData(temp);
        myDice = temp;
    }

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

        Image {
                anchors.fill: parent
                source: "felt.jpg"
        }

        Button {
            id: selectD4
            anchors {
                top: parent.top
            }
            text: "D4"
            onClicked: {
                var temp = myDice;
                Script.incd4(temp);
                myDice = temp;
            }
        }

        Button {
            id: selectD6
            anchors {
                left: selectD4.right
            }
            text: "D6"
            onClicked: {
                var temp = myDice;
                Script.incd6(temp);
                myDice = temp;
            }
        }

        Button {
            id: selectD8
            anchors {
                left: selectD6.right
            }
            text: "D8"
            onClicked: {
                var temp = myDice;
                Script.incd8(temp);
                myDice = temp;
            }
        }

        Button {
            id: selectD10
            anchors {
                left: parent.left
                top: selectD4.bottom
            }
            text: "D10"
            onClicked: {
                var temp = myDice;
                Script.incd10(temp);
                myDice = temp;
            }
        }

        Button {
            id: selectD12
            anchors {
                left: selectD10.right
                top: selectD6.bottom
            }
            text: "D12"
            onClicked: {
                var temp = myDice;
                Script.incd12(temp);
                myDice = temp;
            }
        }

        Button {
            id: selectD20
            anchors {
                left: selectD12.right
                top: selectD8.bottom
            }
            text: "D20"
            onClicked: {
                var temp = myDice;
                Script.incd20(temp);
                myDice = temp;
            }
        }

        Button {
            id: finalize
            anchors {
                bottom: screen.bottom
                horizontalCenter: screen.horizontalCenter
            }
            text: "Roll Dice"
            onClicked: screenBase.showScreen("engine.qml")
        }
    }
}
