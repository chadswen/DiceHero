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
        total.text = "Damage Total: \n" + RPG.sum(temp, temp2, temp3)
        breakdown.text = RPG.breakdowndamage(temp3)
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

    Rectangle{
        id: textholder1
        anchors.horizontalCenter: parent.horizontalCenter
        y:30
        width: 350
        height: 100
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Rectangle{
        id: textholder2
        width: 350
        height: 100
        anchors{
            top: textholder1.bottom
            topMargin: 50
        }
        anchors.horizontalCenter: screenBase.horizontalCenter
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

      Text {
            id: total
            y: 30
            color: "white"
            anchors.centerIn:  textholder1
            text: "--"
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 40
        }

      Text {
          id: breakdown
          anchors.centerIn: textholder2
          y: 30
          text: "--"
          color: "white"
          horizontalAlignment: Text.AlignHCenter
          font.pixelSize: 30
      }

    Button{
        id: damagemultiplier
        text: "Apply Damage Multiplier"
        width: Number(text.length*10) + 30
        anchors.top: breakdown.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
        onClicked:{
            screenBase.showScreen("modes/rpgattack/DamageMultiplier.qml")
        }
    }

    Button_AffirmativeButton {
        id: finalize
        text: "Attack Again"
        //enabled:{
            //if()
              //  return true;
            //else
              //  return false;
        anchors{
            top: damagemultiplier.bottom
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
