import QtQuick 1.0
import "../../common"
import "RpgFunctions.js" as RPG

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: screenWidth; height: screenHeight

    Component.onCompleted: {
        var tempScores = scoreFields;
        damagemult.text = RPG.loadDamageMult(tempScores);
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
        width: 280
        height: 60
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Rectangle{
        id: textholder1
        x:20
        y:250
        width: 180
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
        text: "Use Buttons to\nChange Damage Multiplier."
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
    }

    Text{
        id: damagemult
        text: "--"
        x: 50
        y: 250
        anchors.centerIn: textholder1
        color: "white"
        font.pixelSize: 60
    }

    Button{
        id: incbig
        text: "+10"
        width: 120
        x: 210
        y: 115
        onClicked:{
            var tempScores = scoreFields;
            damagemult.text = RPG.incBigDamageMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: inc1
        text: "+1"
        width: 120
        x: 210
        anchors{
            top: incbig.bottom
        }
        anchors.topMargin: 15
        onClicked:{
            var tempScores = scoreFields;
            damagemult.text = RPG.incDamageMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: incsmall
        text: "+.25"
        width: 120
        x: 210
        anchors{
            top: inc1.bottom
        }
        anchors.topMargin: 15
        onClicked:{
            var tempScores = scoreFields;
            damagemult.text = RPG.incSmallDamageMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: decsmall
        text: "-.25"
        width: 120
        x: 210
        anchors{
            top: incsmall.bottom
        }
        anchors.topMargin: 15
        onClicked:{
            var tempScores = scoreFields;
            damagemult.text = RPG.decSmallDamageMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: dec1
        text: "-1"
        width: 120
        x: 210
        anchors{
            top: decsmall.bottom
        }
        anchors.topMargin: 15
        onClicked:{
            var tempScores = scoreFields;
            damagemult.text = RPG.decDamageMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button{
        id: decbig
        text: "-10"
        width: 120
        x: 210
        anchors{
            top: dec1.bottom
        }
        anchors.topMargin: 15
        onClicked:{
            var tempScores = scoreFields;
            damagemult.text = RPG.decBigDamageMult(tempScores);
            scoreFields = tempScores;
        }
    }

    Button_AffirmativeButton {
        id: finished
        text: "Apply Multiplier"
        x: 70
        anchors{
            top: damagemult.bottom
        }
        anchors.topMargin: 200
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked:
        {
            screenBase.showScreen("modes/rpgattack/DamageTotal.qml");
        }
    }
}
