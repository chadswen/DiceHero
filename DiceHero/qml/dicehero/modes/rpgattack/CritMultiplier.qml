import QtQuick 1.0
import "../../common"
import "RpgFunctions.js" as RPG

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight

    Component.onCompleted: {
        var tempScores = scoreFields;
        critmult.text = RPG.loadCritMult(tempScores);
        scoreFields = tempScores;
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

    Rectangle{
        id: toptextholder
        anchors.horizontalCenter: parent.horizontalCenter
        y:30
        width: 260
        height: 60
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Rectangle{
        id: textholder1
        x:50
        y:250
        width: 140
        height: 70
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Text {
        id: text1
        x: 80
        y: 30
        anchors.rightMargin: 50
        anchors.bottomMargin: 50
        anchors.leftMargin: 100
        anchors.topMargin: 50
        anchors.centerIn: toptextholder
        color: "white"
        text: "Use Buttons to\nChange Critical Multiplier."
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
    }

    Text{
        id: critmult
        text: "--"
        x: 50
        y: 250
        anchors.centerIn: textholder1
        color: "white"
        font.pixelSize: 60
    }

    Button{
        id: inc1
        text: "+1"
        x: 200
        y: 220
        onClicked:{
            var tempScores = scoreFields;
            critmult.text = RPG.incCritMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: dec1
        text: "-1"
        x: 200
        anchors{
            top: inc1.bottom
        }
        anchors.topMargin: 50
        onClicked:{
            var tempScores = scoreFields;
            critmult.text = RPG.decCritMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button_AffirmativeButton {
        id: finished
        text: "Done"
        x: 70
        anchors{
            top: critmult.bottom
        }
        anchors.topMargin: 200
        onClicked:
        {
            screenBase.showScreen("modes/rpgattack/RPGStartScreen.qml");
        }
    }
}
