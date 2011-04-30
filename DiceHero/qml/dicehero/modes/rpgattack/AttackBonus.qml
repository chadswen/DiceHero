import QtQuick 1.0
import "../../common"
import "RpgFunctions.js" as RPG

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight

    Component.onCompleted: {
        var tempScores = scoreFields;
        attbonus.text = RPG.loadAttBonus(tempScores);
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

        Text {
            id: text1
            x: 80
            y: 30
            anchors.rightMargin: 50
            anchors.bottomMargin: 50
            anchors.leftMargin: 100
            anchors.topMargin: 50
            text: "Use Buttons to\nChange Attack Bonus."
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 24
        }
    }

    Text{
        id: attbonus
        text: "--"
        x: 50
        y: 250
        font.pixelSize: 60
    }

    Button{
        id: inc5
        text: "+5"
        x: 200
        y: 135
        onClicked:{
            var tempScores = scoreFields;
            attbonus.text = RPG.inc5AttBonus(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: inc1
        text: "+1"
        x: 200
        y: 100
        anchors{
            top: inc5.bottom
        }
        anchors.topMargin: 45
        onClicked:{
            var tempScores = scoreFields;
            attbonus.text = RPG.incAttBonus(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: dec1
        text: "-1"
        x: 200
        y: 100
        anchors{
            top: inc1.bottom
        }
        anchors.topMargin: 25
        onClicked:{
            var tempScores = scoreFields;
            attbonus.text = RPG.decAttBonus(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: dec5
        text: "-5"
        x: 200
        y: 100
        anchors{
            top: dec1.bottom
        }
        anchors.topMargin: 45
        onClicked:{
            var tempScores = scoreFields;
            attbonus.text = RPG.dec5AttBonus(tempScores);
            scoreFields = tempScores;
        }
    }

    Button_AffirmativeButton {
        id: finished
        text: "Done"
        x: 70
        anchors{
            top: attbonus.bottom
        }
        anchors.topMargin: 200
        onClicked:
        {
            screenBase.showScreen("modes/rpgattack/RPGStartScreen.qml");
        }
    }
}
