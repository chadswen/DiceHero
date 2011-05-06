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
        damagebonustext.text = RPG.loadDamageBonus(tempScores);
        if(tempScores[6] == "false")    //if the saved status of the weapon is non-lethal then the opacity should reflect this.
            nonlethal.opacity = .8
        tempScores[5] = "false";         //sets critical value to false.
        scoreFields = tempScores;
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
        }
    }

    Rectangle{
        id: toptextholder
        anchors.horizontalCenter: parent.horizontalCenter
        y:20
        width: 240
        height: 60
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Text {
        id: text1
        x: 80
        y: 20
        anchors.centerIn: toptextholder
        text: "Please enter the \nAttacker's information."
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 24
    }

    Rectangle{
        id: textholder1
        x:240
        y:100
        width: 100
        height: 60
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Rectangle{
        id: textholder2
        x:240
        anchors.top: textholder1.bottom
        anchors.topMargin: 26
        width: 100
        height: 60
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Rectangle{
        id: textholder3
        x:240
        anchors.top: textholder2.bottom
        anchors.topMargin: 26
        width: 100
        height: 60
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Rectangle{
        id: textholder4
        x:240
        anchors.top: textholder3.bottom
        anchors.topMargin: 26
        width: 100
        height: 60
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Rectangle{
        id: textholder5
        anchors.left: nonlethal.right
        anchors.top: textholder4.bottom
        anchors.topMargin: 26
        anchors.leftMargin: 26
        width: 100
        height: 35
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  3
    }

    Button {
        id: attbonus
        width: 200
        height: 60
        x: 20
        y: 100
        text: "Set Attack Bonus"
        onClicked: {
            screenBase.showScreen("modes/rpgattack/AttackBonus.qml")
        }
    }

    Text{
        id: attbonustext
        text: "--"
        y: 120
        anchors{
            left: attbonus.right
            centerIn: textholder1
        }
        color: "white"
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
            centerIn: textholder2
        }
        color: "white"
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
            centerIn: textholder3
        }
        color: "white"
        anchors.leftMargin: 26
        anchors.topMargin: 60
    }

    Button {
        id: damagebonus
        x: 20
        width: 200
        height: 60
        anchors {
            top: critmult.bottom
        }
        text: "Set Damage Bonus"
        onClicked: {
            screenBase.showScreen("modes/rpgattack/DamageBonus.qml")
        }
        anchors.topMargin: 26
    }

    Text{
        id: damagebonustext
        text: "--"
        anchors{
            left: damagebonus.right
            top: critmulttext.bottom
            centerIn: textholder4
        }
        color: "white"
        anchors.leftMargin: 26
        anchors.topMargin: 56
    }

    TwoStateButton {
        id: nonlethal
        text: "Lethal?"
        x:20
        anchors.top:  damagebonus.bottom
        anchors.topMargin: 26
        color: "black"
        textColor: "white"
        onClicked: {
            var tempScores = scoreFields
            RPG.toggleLethal(tempScores)
            scoreFields = tempScores
        }
    }

    Text{
        id: nonlethaltext
        text:
        {
            if(nonlethal.opacity == 1)
                return "Yes"
            else
                return "No"
        }
        color: "white"
        anchors{
            left: nonlethal.right
            top: damagebonus.bottom
            centerIn: textholder5
        }
        anchors.leftMargin: 26
        anchors.topMargin: 26
    }

    TwoStateButton  {
        id: damageaddition
        text:
        {
            if(damageaddition.opacity == 1)
                return "Add Dam. Bon. BEFORE Multiplying"
            else
                return "Add Dam. Bon. AFTER Multiplying"
        }
        x:20
        color: "black"
        textColor: "white"
        anchors.top:  nonlethal.bottom
        anchors.topMargin: 26
        onClicked: {
            var tempScores = scoreFields
            RPG.toggleDamageAdd(tempScores)
            scoreFields = tempScores
        }
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
        anchors.bottomMargin: 30
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
        anchors.bottomMargin: 30
        onClicked: {
            main.clearAll();
            screenBase.showScreen("modes/gameSelection.qml");

        }
    }
}
