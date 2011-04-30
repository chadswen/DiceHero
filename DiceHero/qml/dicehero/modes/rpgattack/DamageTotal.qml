import QtQuick 1.0
import "../../common"
import "../../common/createDice.js" as Script
import "RpgFunctions.js" as RPG

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight

    Component.onCompleted: {
        var temp = myDice
        var temp2 = rollResults
        var temp3 = scoreFields
        total.text = "Damage Total: " + RPG.sum(temp, temp2, temp3)
        myDice = temp
        rollResults = temp2
        scoreFields = temp3
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
            id: total
            y: 30
            anchors.topMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
            text: "--"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 40
        }

//      Text {
//          id: breakdown
//          anchors{
//              top: totalIdentifier.bottom
//          }
//          anchors.horizontalCenter: screenBase.horizontalCenter
//          y: 30
//          anchors.topMargin: 50
//          text: "Breakdown: " + rollResults[5][0] + " + " + scoreFields[0]
//          horizontalAlignment: Text.AlignHCenter
//          font.pixelSize: 30
//      }

    Button_AffirmativeButton {
        id: finalize
        text: "Attack Again"
        //enabled:{
            //if()
              //  return true;
            //else
              //  return false;
        anchors{
            top: total.bottom
        }
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
        onClicked: {
            screenBase.showScreen("modes/rpgattack/RPGStartScreen.qml")
        }
    }

    Button_NegativeButton {
        id: returnButton
        text: "Return to Modes"
        anchors.top: finalize.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        onClicked: {
            main.clearAll()
            screenBase.showScreen("modes/gameSelection.qml");

        }
    }
}
