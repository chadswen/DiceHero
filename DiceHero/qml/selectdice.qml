import QtQuick 1.0
import "createDice.js" as Script

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: 360; height: 640
    Connections {
        target: main
        onMyDiceChanged:{
            statusDynamicText.text = "Selected: "+Script.getNumberDice(myDice);
            if(Script.getNumberDice(myDice) >= 20){
                statusDynamicText.color = "red";
                statusDynamicText.text = "Selected: MAX";

                d4M.enabled = false;
                d6M.enabled = false;
                d8M.enabled = false;
                d10M.enabled = false;
                d12M.enabled = false;
                d20M.enabled = false;


                selectD4.opacity =.2;
                selectD6.opacity =.2;
                selectD8.opacity =.2;
                selectD10.opacity =.2;
                selectD12.opacity =.2;
                selectD20.opacity =.2;
            }
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




        Rectangle {
            id: buttonHolder

            anchors {
                top: screen.top;
                topMargin: 150
                bottomMargin: 150
                horizontalCenter: parent.horizontalCenter
            }
            color: "black"
            width: 250
            height: 350
            border.color: "#336633"
            border.width: 4
            smooth: true
            radius: 50
        }

        Rectangle {
            id: status
            height: 35; width: 150
            border.color:  "#CCCCCC"
            color: "black"
            border.width:  4
            opacity: .7
            radius: 10
            anchors {
                left: parent.left
                leftMargin:20
                top: parent.top
                topMargin:20
            }
        }

        Text {
            id: statusDynamicText
            font.bold: false
            smooth: true
            text:"Selected: "
            font.pixelSize: 20
            color: "#CCCCCC"
            style: Text.Raised
            anchors.top: status.top
            anchors.topMargin: 5
            anchors.left: status.left
            anchors.leftMargin: 7
            anchors.bottom:  status.bottom
            anchors.bottomMargin: 5
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
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
            MouseArea {
                id: d4M
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd4(temp);
                    myDice = temp;
                }
                onPressed: {selectD4.opacity= .2}
                onReleased: {selectD4.opacity= 1}
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
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
            MouseArea {
                id: d6M
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd6(temp);
                    myDice = temp;
                }
                onPressed: {selectD6.opacity= .2}
                onReleased: {selectD6.opacity= 1}
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
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
            MouseArea {
                id: d8M
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd8(temp);
                    myDice = temp;
                }
                onPressed: {selectD8.opacity= .2}
                onReleased: {selectD8.opacity= 1}
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
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
            MouseArea {
                id: d10M
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd10(temp);
                    myDice = temp;
                }
                onPressed: {selectD10.opacity= .2}
                onReleased: {selectD10.opacity= 1}
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
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
            MouseArea {
                id: d12M
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd12(temp);
                    myDice = temp;
                }
                onPressed: {selectD12.opacity= .2}
                onReleased: {selectD12.opacity= 1}
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
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
            MouseArea {
                id: d20M
                anchors.fill: parent
                onClicked: {
                    var temp = myDice;
                    Script.incd20(temp);
                    myDice = temp;
                }
                onPressed: {selectD20.opacity= .2}
                onReleased: {selectD20.opacity= 1}
            }
        }


        Item {
            id: bottomBar
            width: parent.width; height: parent.height
            anchors{
                bottom: parent.bottom
                bottomMargin: 20
                horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: finalize
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.rightMargin:10
                anchors.leftMargin:30
                text: "Roll Dice"
                onClicked: returnFile="selectdice.qml", screenBase.showScreen("engine.qml")
            }
            Button {
                id: quitButton
                text: "Exit"
                anchors.bottom: parent.bottom
                anchors.left: parent.horizontalCenter
                anchors.right: parent.right
                anchors.rightMargin:30
                anchors.leftMargin:10
                onClicked: Qt.quit()
            }
        }
    }
}
