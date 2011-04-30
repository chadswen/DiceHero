import QtQuick 1.0
import "../../common"
import "../../common/createDice.js" as Script
import "RpgFunctions.js" as RPG

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight

    Component.onCompleted: {
        rolls++;
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
        }
      }

      Text {
            id: critText
            y: 30
            text: if(rollResults[5][0] > scoreFields[1] && rolls == 1)
                  {return "Critical!"}
                  else
                  {return ""}
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 40
        }

      Text {
            id: totalIdentifier
            anchors{
                top: critText.bottom
            }
            y: 30
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Attack Total: " + Number(Number(rollResults[5][0]) + Number(scoreFields[0]))
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 40
        }

      Text {
            id: breakdown
            anchors{
                top: totalIdentifier.bottom
            }
            anchors.horizontalCenter: screenBase.horizontalCenter
            y: 30
            anchors.topMargin: 50
            text: "Breakdown: " + rollResults[5][0] + " + " + scoreFields[0]
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }

    Button_AffirmativeButton {
        id: finalize
        text: if(rollResults[5][0] > scoreFields[1] && rolls == 1)
              {return "Confirm"}
              else
              {return "Hit"}
        //enabled:{
            //if()
              //  return true;
            //else
              //  return false;
        anchors{
            top: breakdown.bottom
        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
        onClicked: {
            if(rollResults[5][0] > scoreFields[1] && rolls == 1)
            {
                var temp = myDice;
                Script.incd20(temp);
                myDice = temp;
                temp = scoreFields
                temp[5] = "true";
                scoreFields = temp;
                returnFile="modes/rpgattack/HitMissScreen.qml"
                screenBase.showScreen("engine/engine.qml")
            }
            else
            {
                screenBase.showScreen("modes/rpgattack/DamageDice.qml")
            }
        }
    }

    Button_NegativeButton {
        id: returnButton
        text: "Missed"
        anchors.top: finalize.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        onClicked: {
            screenBase.showScreen("modes/rpgattack/RPGStartScreen.qml");

        }
    }
}
