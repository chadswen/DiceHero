import QtQuick 1.0
import Qt.labs.particles 1.0
import "../common"
import "../common/createDice.js" as Script
import "motherload/holdingDice.js" as VarHold
import "motherload/scoringRules.js" as Scoring

Rectangle {

    signal showScreen(string msg)

    id: screen

    width: screenWidth; height: screenHeight
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#ffffff";
        }
        GradientStop {
            position: 1.00;
            color: "#ffffff";
        }
    }

    SystemPalette {
        id: activePalette
    }

    Component.onCompleted: {            //this code bit is needed or else nulls will be added to nulls upon use of the engine.qml file creating a NAN.
        var temp = myDice;
        Script.clearData(temp);
        myDice = temp;
        main.clearAll();
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

    // delegate for the List
    Component {
        id: modeDelegate
        Column {
            id: column

            width: textHolder.width-40
            height: cB.height + cT.height
            spacing: 20
            anchors.horizontalCenter: parent.horizontalCenter

            Button_StandardButton {
                id: cB
                anchors.horizontalCenter: parent.horizontalCenter
                text: bText
                onClicked: {
                    if( bText == "Motherload"){
                        rolls = 13;
                        var temp = myDice;
                        VarHold.motherloadDice(temp);
                        myDice = temp;
                        var tempScores = scoreFields;
                        Scoring.initializeScores(tempScores);
                        scoreFields = tempScores;
                        returnFile="modes/motherload/RerollSelection.qml"
                    }
                    screen.showScreen(file)
                }
            }

            Text {
                id: cT
                width: parent.width
                font.bold: false
                smooth: true
                font.family: "Helvetica [Cronyx]"
                font.pixelSize: 20
                color: "#CCCCCC"
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                style: Text.Raised
                text: modeText
            }
        }
    }


    // list data, add as many as you like
    ListModel {
        id: modeListModel

        ListElement{
            bText: "Hero Mode"
            file: "modes/selectdice.qml"
            modeText: "Freestyle Rolling. Play YOUR game, with our dice!"
        }


        ListElement{
            bText: "High Roller"
            file: "modes/highRoller.qml"
            modeText: "6 dice, 3 rounds, 2 players, 1 Hero. A game pure of chance, and of heart."
        }


        ListElement{
            bText: "Motherload"
            file: "engine/engine.qml"
            modeText: "A \"Yahzt-ish\" family favorite!"
        }

        ListElement{
            bText: "Fake Button!!!"
            file: "nope"
            modeText: "I DON'T WORK! Replace me with the next new one please!!'"
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

        // list markup
        ListView {
            anchors.verticalCenter: parent.verticalCenter
            id: modeList
            width: parent.width
            height: parent.height - 50
            model: modeListModel
            delegate: modeDelegate
            clip: true
            spacing: 40
            keyNavigationWraps: true

            //mode Scroll Bar
            ScrollBar {
                id: listScrollBar
                scrollArea: modeList
                height: modeList.height
                width: 10
                anchors.right: modeList.right
                anchors.rightMargin: 10
            }
        }
    }


    Button_NegativeButton {
        id: quitButton
        text: "Quit"
        opacity: .9
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: Qt.quit()
    }
}
