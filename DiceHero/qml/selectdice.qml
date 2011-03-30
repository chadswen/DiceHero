import QtQuick 1.0
import "createDice.js" as Script

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: 360; height: 640
    Connections {
        target: main
        onMyDiceChanged:{
            statusDynamicText.text = Script.getNumberDice(myDice);
            if(Script.getNumberDice(myDice) >= 20){
                statusDynamicText.color = "red";
                statusDynamicText.text = "20 (MAX)";

                selectD4.visible=false;
                selectD6.visible=false;
                selectD8.visible=false;
                selectD10.visible=false;
                selectD12.visible=false;
                selectD20.visible=false;
            }
        }
    }



    Item {
        id: topToolbar
        width: parent.width; height: parent.height
        anchors{
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        Button2 {
            id: quitButton
            text: "X"
            anchors.rightMargin:20
            onClicked: Qt.quit()
            anchors.right: topToolbar.right
        }
        Rectangle {
            id: status
            height: quitButton.height; width: 180
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
            source: "board.png"
        }

        Image {
            id: selectD4
            source: "d6_1.png"
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 90
                topMargin: 180
            }
            Text {
                text: "D4"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd4(temp);
                    myDice = temp;
                }
            }
        }

        Image {
            id: selectD6
            source: "d6_1.png"
            anchors {
                left: selectD4.right
                top: selectD4.top
            }
            Text {
                text: "D6"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd6(temp);
                    myDice = temp;
                }
            }
        }

        Image {
            id: selectD8
            source: "d8_1.png"
            anchors {
                left: selectD4.left
                top: selectD4.bottom
            }
            Text {
                text: "D8"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd8(temp);
                    myDice = temp;
                }
            }
        }

        Image {
            id: selectD10
            source: "d10_1.png"
            anchors {
                left: selectD6.left
                top: selectD4.bottom
            }
            Text {
                text: "D10"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd10(temp);
                    myDice = temp;
                }
            }
        }

        Image {
            id: selectD12
            source: "d12_1.png"
            anchors {
                left: selectD8.left
                top: selectD8.bottom
            }
            Text {
                text: "D12"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd12(temp);
                    myDice = temp;
                }
            }
        }

        Image {
            id: selectD20
            source: "d20_1.png"
            anchors {
                left: selectD10.left
                top: selectD10.bottom
            }
            Text {
                text: "D20"
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd20(temp);
                    myDice = temp;
                }
            }
        }

        Button {
            id: finalize
            anchors {
                bottom: screen.bottom
                horizontalCenter: screen.horizontalCenter
            }
            text: "Roll Dice"
            onClicked: returnFile="selectdice.qml", screenBase.showScreen("engine.qml")
        }
    }
}
