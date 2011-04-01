import QtQuick 1.0
import Qt.labs.particles 1.0
import "createDice.js" as Script
import "holdingDice.js" as VarHold
import "scoringRules.js" as Scoring

Rectangle {

    signal showScreen(string msg)

    id: screen

    width: 360; height: 640

    SystemPalette {
        id: activePalette
    }

    Component.onCompleted: {            //this code bit is needed or else nulls will be added to nulls upon use of the engine.qml file creating a NAN.
        var temp = myDice;
        Script.clearData(temp);
        myDice = temp;
    }

    Item {
        id: titleBackground
        width: parent.width; height: parent.height
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Rectangle {
            anchors.fill: parent
            color: "black"
        }
    }


    Rectangle {
        id: textHolder

        anchors {
            top: screen.top;
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
        color: "black"
        width: 300
        height: 500
        border.color: "#336633"
        border.width: 4
        smooth: true
        radius: 50

        Text {
            id: welcomeText
            width:280
            height: 60
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: textHolder.top
            anchors.topMargin: 5
            font.bold: false
            smooth: true
            font.family: "Helvetica [Cronyx]"
            font.pixelSize: 20
            color: "#AAAAAA"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            text: "Choose your mode wisely, Hero!"
        }

        Button {
            id: heroModeButton
            anchors {
                top: welcomeText.bottom
                topMargin: 5
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "Hero Mode"
            onClicked: screen.showScreen("selectdice.qml")
        }


        Text {
            id: heroModeText
            width:textHolder.width
            height: 60
            anchors {
                top: heroModeButton.bottom;
                topMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
            font.bold: false
            smooth: true
            font.family: "Helvetica [Cronyx]"
            font.pixelSize: 20
            color: "#AAAAAA"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            text: "Freestyle Rolling. Play YOUR game, with our dice!"
        }


        Button {
            id: highRollerButton

            text: "High Roller"
            anchors.horizontalCenter: textHolder.horizontalCenter
            anchors.top: heroModeText.bottom
            anchors.topMargin: 10
            onClicked: {
                screen.showScreen("highRoller.qml");
            }
        }

        Text {
            id: highRollerText
            width:textHolder.width
            height: 60
            anchors {
                top: highRollerButton.bottom;
                topMargin: 10
                horizontalCenter: parent.horizontalCenter
            }
            font.bold: false
            smooth: true
            font.family: "Helvetica [Cronyx]"
            font.pixelSize: 20
            color: "#AAAAAA"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            text: "6 dice, 3 rounds, 2 players, 1 Hero. A game pure of chance, and of heart."
        }

        Button {
            id: motherloadButton
            text: "Motherload"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: motherloadText.top
            opacity: .5
            enabled: true
            onClicked: {
                rolls = 13;
                var temp = myDice;
                VarHold.motherloadDice(temp);
                myDice = temp;
                var tempScores = scoreFields;
                Scoring.initializeScores(tempScores);
                scoreFields = tempScores;
                returnFile="RerollSelection.qml", screen.showScreen("engine.qml");
            }
        }

        Text {
            id: motherloadText
            width:textHolder.width
            height: 60
            opacity: .5
            anchors {
                bottom: textHolder.bottom
                bottomMargin: 5
                horizontalCenter: parent.horizontalCenter
            }
            font.bold: false
            smooth: true
            font.family: "Helvetica [Cronyx]"
            font.pixelSize: 20
            color: "#AAAAAA"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            text: "A \"Yahzt-ish\" family favorite! (Coming Soon)"
        }
    }

    Button {
        id: quitButton
        text: "Quit"
        opacity: .9
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: Qt.quit()
    }
}
