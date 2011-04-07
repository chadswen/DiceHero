import QtQuick 1.0
import "../../common"
import "../../common/createDice.js" as Script
import "holdingDice.js" as VarHold

Rectangle {
    signal showScreen(string msg)

    id: screenBase

    width: 360; height: 640

    Component.onCompleted: {
        var temp = myDice;
        var temp2 = dieClicks;
        Script.clearData(temp);
        VarHold.clearData(temp2);
        myDice = temp;
        dieClicks = temp2;



        // get results
        var tempSaved = saved;
        var tempResults = rollResults;
        var i;
        var j=0;
        for(i = 0; i<5; i++)
        {
            if(tempResults[1][i]!= null){
                while(j<5){
                    if(tempSaved[j] == null){
                        tempSaved[j] = tempResults[1][i];
                        console.log("tempSaved["+j+"] = " + tempSaved[j]);
                        break;
                    }
                    j++;
                }
            }
        }
        saved = tempSaved;


        reRolls++;

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
            source: "../../images/board.png"

            Text {
                id: text1
                x: 59
                y: 255
                width: 80
                height: 20
                text: "Select Dice You Want to Reroll."
                font.pixelSize: 18
            }
        }
    }
    Rectangle {
        id: rerollBox
        height: 30; width: 100
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  4
        opacity: .7
        radius: 10
        anchors {
            bottom: finalize.top
            bottomMargin:40
            horizontalCenter:finalize.horizontalCenter
        }
    }

    Text {
        id: reRollText
        font.bold: false
        smooth: true
        text:{"Rerolls: " + (3-reRolls)}
        font.pixelSize: 20
        color: "#CCCCCC"
        style: Text.Raised
        anchors.centerIn: rerollBox
    }

    Button {
        id: skipButton
        text: "Skip to Scoring"
        width: 150
        anchors.bottom: returnButton.top
        anchors.horizontalCenter:returnButton.horizontalCenter
        anchors.rightMargin:30
        anchors.leftMargin:10
        anchors.bottomMargin: 40
        onClicked: screenBase.showScreen("modes/motherload/ScoreCard.qml")
    }

    TwoStateButton {
        id: selectDie1
        x: 1
        y: 17
        width: 100
        height: 100
        anchors {
            top: parent.top
        }
        text: {

            var temp = saved[0];
            console.log("printing saved[4]: "+saved[0]);
            return temp;

        }
        anchors.topMargin: 17
        onClicked: {
            var temp = dieClicks;
            VarHold.die1Click(temp);
            dieClicks = temp;
        }
    }

    TwoStateButton {
        id: selectDie2
        x: 130
        y: 17
        width: 100
        height: 100
        anchors {
            left: selectDie1.right
        }
        text: {

            var temp = saved[1];
            console.log("printing saved[3]: "+saved[1]);
            return temp;

        }
        anchors.leftMargin: 26
        onClicked: {
            var temp = dieClicks;
            VarHold.die2Click(temp);
            dieClicks = temp;
        }
    }

    TwoStateButton {
        id: selectDie3
        x: 257
        y: 17
        width: 102
        height: 100
        anchors {
            left: selectDie2.right
        }
        text: {

            var temp = saved[2];
            console.log("printing saved[2]: "+saved[2]);
            return temp;

        }
        anchors.leftMargin: 26
        onClicked: {
            var temp = dieClicks;
            VarHold.die3Click(temp);
            dieClicks = temp;
        }
    }

    TwoStateButton {
        id: selectDie4
        x: 61
        y: 134
        width: 100
        height: 100
        anchors {
            left: parent.left
            top: selectDie1.bottom
        }
        text: {

            var temp = saved[3];
            console.log("printing saved[3]: "+saved[3]);
            return temp;

        }
        anchors.leftMargin: 61
        anchors.topMargin: 17
        onClicked: {
            var temp = dieClicks;
            VarHold.die4Click(temp);
            dieClicks = temp;
        }
    }

    TwoStateButton {
        id: selectDie5
        x: 187
        y: 134
        width: 100
        height: 100
        anchors {
            left: selectDie4.right
            top: selectDie2.bottom
        }
        text: {

            var temp = saved[4];
            console.log("printing saved[4]: "+saved[4]);
            return temp;


        }
        anchors.leftMargin: 34
        anchors.topMargin: 17
        onClicked: {
            var temp = dieClicks;
            VarHold.die5Click(temp);
            dieClicks = temp;
        }
    }

    Button {
        id: finalize
        enabled:{
            if(dieClicks[0] || dieClicks[1] ||
                    dieClicks[2] || dieClicks[3] ||
                    dieClicks[4])
                return true;
            else
                return false;
        }
        opacity:{
            if(dieClicks[0] || dieClicks[1] ||
                    dieClicks[2] || dieClicks[3] ||
                    dieClicks[4])
                return 1;
            else
                return .6;
        }
        anchors.bottom: screen.bottom
        anchors.right: parent.horizontalCenter
        anchors.left: parent.left
        anchors.rightMargin:10
        anchors.leftMargin:30

        text: "Reroll Dice"
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 40
        onClicked: {
            var temp = myDice;
            var temp2 = dieClicks;
            var temp3 = saved;
            VarHold.finalize(temp, temp2,temp3);
            myDice = temp;
            dieClicks = temp2;
            saved = temp3;
            if (reRolls==2)
            {
                reRolls =0;
                returnFile="modes/motherload/ScoreCard.qml";
            }
            else
            {
                returnFile="modes/motherload/RerollSelection.qml"
            }
            screenBase.showScreen("engine/engine.qml")
        }
    }

    Button {
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
