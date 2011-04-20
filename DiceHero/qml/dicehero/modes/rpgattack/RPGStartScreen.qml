import QtQuick 1.0
import "../common"
import "../common/createDice.js" as Script
import "motherload/RpgFunctions.js" as RPG

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight

    Component.onCompleted: {            //this code bit is needed or else nulls will be added to nulls upon use of the engine.qml file creating a NAN.
        var temp = myDice;
        Script.clearData(temp);
        myDice = temp;
        main.clearAll();
        var tempScores = scoreFields;
        RPG.loadBonuses(tempScores);
        scoreFields = tempScores;
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
            x: 0
            y: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            source: "../images/board.png"

            Text {
                id: text1
                x: 80
                y: 30
                anchors.rightMargin: 50
                anchors.bottomMargin: 50
                anchors.leftMargin: 100
                anchors.topMargin: 50
                text: "Please enter the \nAttacker's information."
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 24
            }
        }
    }

    Button {
        id: attbonus
        width: 200
        height: 60
        x: 20
        y: 150
        text: "Set Attack Bonus"
        onClicked: {

        }
    }

    Text{
        id: attbonustext
        text: "Hello"
        y: 170
        anchors{
            left: attbonus.right
        }
        anchors.leftMargin: 26
    }

    Button {
        id: critrange
        x: 20
        width: 200
        height: 60
        anchors {
            top: attbonus.bottom
        }
        text: "Set Critical Range"
        onClicked: {

        }
        anchors.topMargin: 26
    }

    Text{
        id: critrangetext
        text: "20"
        anchors{
            left: critrange.right
            top: attbonustext.bottom
        }
        anchors.leftMargin: 26
        anchors.topMargin: 56
    }

    Text{
        id: critrangemax
        text:  "to 20"
        anchors{
            left: critrangetext.right
            top: attbonustext.bottom
        }
        anchors.leftMargin: 10
        anchors.topMargin:  56
    }

    Button {
        id: critmult
        x: 20
        width: 200
        height: 60
        anchors {
            top: critrange.bottom
        }
        text: "Set Critical Multiplier"
        onClicked: {

        }
        anchors.topMargin: 26
    }

    Text{
        id: critmulttext
        text: "Hello2"
        anchors{
            left: critmult.right
            top: critrangetext.bottom
        }
        anchors.leftMargin: 26
        anchors.topMargin: 60
    }

    Button_AffirmativeButton {
        id: finalize
        //enabled:{
            //if()
              //  return true;
            //else
              //  return false;
        anchors.bottom: screen.bottom
        anchors.right: parent.horizontalCenter
        anchors.left: parent.left
        anchors.rightMargin:10
        anchors.leftMargin:30

        text: "Roll Attack"
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 40
        onClicked: {
            var temp = myDice;
            Script.incd20(temp);
            myDice = temp;
            returnFile="modes/RPGStartScreen.qml"       //Note: this should be changed to the damage Screen.
            screenBase.showScreen("engine/engine.qml")
        }
    }

    Button_NegativeButton {
        id: returnButton
        text: "Back to Modes"
        anchors.bottom: parent.bottom
        anchors.left: parent.horizontalCenter
        anchors.right: parent.right
        anchors.rightMargin:30
        anchors.leftMargin:10
        anchors.bottomMargin: 40
        onClicked: {
            main.clearAll();
            screenBase.showScreen("modes/gameSelection.qml");

        }
    }
}
