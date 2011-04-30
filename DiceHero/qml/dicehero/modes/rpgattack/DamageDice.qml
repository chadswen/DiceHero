import QtQuick 1.0
import "../../common"
import "../../common/createDice.js" as Script

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight
    Connections {
        target: main
        onMyDiceChanged:{
            statusDynamicText.text = "Selected: "+Script.getNumberDice(myDice);
            if(Script.getNumberDice(myDice) >= 1)
            {
                finalize.enabled = true;
                finalize.opacity = 1;
            }

            if(Script.getNumberDice(myDice) >= 20){
                statusDynamicText.color = "red";
                statusDynamicText.text = "Selected: MAX";

                d4M.enabled = false;
                d6M.enabled = false;
                d8M.enabled = false;
                d10M.enabled = false;
                d12M.enabled = false;
                d20M.enabled = false;


                selectD4.opacity =.5;
                selectD6.opacity =.5;
                selectD8.opacity =.5;
                selectD10.opacity =.5;
                selectD12.opacity =.5;
                selectD20.opacity =.5;
            }
        }
    }

    Component.onCompleted: {
        var temp = myDice;
        Script.clearData(temp);
        myDice = temp;
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
            property string bgString: "../../images/backgrounds/"
            property string bgStringComplete: bgString+myBackground
            source: bgStringComplete
        }




        Rectangle {
            id: buttonHolder

            anchors {
                top: screen.top;
                topMargin: 120
                bottomMargin: 150
                horizontalCenter: parent.horizontalCenter
            }
            color: "black"
            width: 250
            height: 350
            border.color: "#CCCCCC"
            border.width: 4
            smooth: true
            radius: 50
        }

        Rectangle {
            id: status
            height: 70; width: 320
            border.color:  "#CCCCCC"
            color: "black"
            border.width:  4
            opacity: .7
            radius: 10
            anchors {
                top: parent.top
                topMargin:20
                horizontalCenter:parent.horizontalCenter
            }
        }

        Text {
            id: statusDynamicText
            font.bold: false
            smooth: true
            text:"Selected: 0"
            font.pixelSize: 50
            color: "#CCCCCC"
            style: Text.Raised
            anchors.centerIn: status


        }

        Image {
            id: selectD4
            source: "../../images/d4_1.png"
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
                    d4s.text =  myDice[0] + "d4 + "
                }
                onPressed: {selectD4.opacity= .2}
                onReleased: {selectD4.opacity= 1}
            }
        }

        Image {
            id: selectD6
            source: "../../images/d6_1.png"
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
                    d6s.text = myDice[1] + "d6 + "
                }
                onPressed: {selectD6.opacity= .2}
                onReleased: {selectD6.opacity= 1}
            }
        }

        Image {
            id: selectD8
            source: "../../images/d8_1.png"
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
                    d8s.text = myDice[2]+"d8 + "
                }
                onPressed: {selectD8.opacity= .2}
                onReleased: {selectD8.opacity= 1}
            }
        }

        Image {
            id: selectD10
            source: "../../images/d10_1.png"
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
                    d10s.text = myDice[3] + "d10 + "
                }
                onPressed: {selectD10.opacity= .2}
                onReleased: {selectD10.opacity= 1}
            }
        }

        Image {
            id: selectD12
            source: "../../images/d12_1.png"
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
                    d12s.text = myDice[4] + "d12 + "
                }
                onPressed: {selectD12.opacity= .2}
                onReleased: {selectD12.opacity= 1}
            }
        }

        Image {
            id: selectD20
            source: "../../images/d20_1.png"
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
                    d20s.text = myDice[5] + "d20"
                }
                onPressed: {selectD20.opacity= .2}
                onReleased: {selectD20.opacity= 1}
            }
        }

        Text{
            id:d4s
            text: "0d4 + "
            anchors.right: d6s.left
            anchors.rightMargin: 5
            anchors.top: buttonHolder.bottom
            anchors.topMargin: 15
        }

        Text{
            id:d6s
            text: "0d6 + "
            anchors.top: buttonHolder.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 15
        }

        Text{
            id:d8s
            text: "0d8 + "
            anchors.left: d6s.right
            anchors.leftMargin: 5
            anchors.top: buttonHolder.bottom
            anchors.topMargin: 15
        }

        Text{
            id:d10s
            anchors.right: d12s.left
            anchors.rightMargin: 5
            text: "0d10 + "
            anchors.top: d4s.bottom
            anchors.topMargin: 15
        }

        Text{
            id:d12s
            text: "0d12 + "
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: d4s.bottom
            anchors.topMargin: 15
        }

        Text{
            id:d20s
            text: "0d20"
            anchors.left: d12s.right
            anchors.leftMargin: 5
            anchors.top: d4s.bottom
            anchors.topMargin: 15
        }


        Item {
            id: bottomBar
            width: parent.width; height: parent.height
            anchors{
                bottom: parent.bottom
                bottomMargin: 20
                horizontalCenter: parent.horizontalCenter
            }

            Button_AffirmativeButton {
                id: finalize
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.rightMargin:10
                anchors.leftMargin:30
                text: "Roll"
                opacity: .5
                enabled: false
                onClicked: returnFile="modes/rpgattack/DamageTotal.qml", screenBase.showScreen("engine/engine.qml")
            }
            Button_NegativeButton {
                id: returnButton
                text: "Back to Modes"
                anchors.bottom: parent.bottom
                anchors.left: parent.horizontalCenter
                anchors.right: parent.right
                anchors.rightMargin:30
                anchors.leftMargin:10
                onClicked: {
                    main.clearAll();
                    screenBase.showScreen("modes/gameSelection.qml");
                }
            }
        }
    }
}
