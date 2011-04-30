import QtQuick 1.0
import "../../common"
import "../../common/createDice.js" as Script
import "RpgFunctions.js" as RPG

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight

    Component.onCompleted: {            //this code bit is needed or else nulls will be added to nulls upon use of the engine.qml file creating a NAN.
        var temp = myDice;
        Script.clearData(temp);
        myDice = temp;
        var tempScores = scoreFields;
        attbonustext.text = RPG.loadAttBonus(tempScores);
        critrangetext.text = RPG.loadCritRange(tempScores);
        critmulttext.text = RPG.loadCritMult(tempScores);
        scoreFields = tempScores;
        scoreFields[5] = false;         //sets critical value to false.
        rolls = 0;
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
            property string bgString: "../../images/backgrounds/"
            property string bgStringComplete: bgString+myBackground
            source: bgStringComplete

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
            screenBase.showScreen("modes/rpgattack/AttackBonus.qml")
        }
    }

    Text{
        id: attbonustext
        text: "--"
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
            screenBase.showScreen("modes/rpgattack/CritRange.qml")
        }
        anchors.topMargin: 26
    }

    Text{
        id: critrangetext
        text: "--"
        anchors{
            left: critrange.right
            top: attbonustext.bottom
        }
        anchors.leftMargin: 26
        anchors.topMargin: 56
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
            screenBase.showScreen("modes/rpgattack/CritMultiplier.qml")
        }
        anchors.topMargin: 26
    }

    Text{
        id: critmulttext
        text: "--"
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
            returnFile="modes/rpgattack/HitMissScreen.qml"
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
