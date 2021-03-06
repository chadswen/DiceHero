import Qt 4.7
import QtQuick 1.0
import Box2D 1.0
import QtMultimediaKit 1.1
import "../common"
import "../common/createDice.js" as Script


Image {
    signal showScreen(string msg)
    id: engine
    width: screenWidth;
    height: screenHeight;

    property string bgString: "../images/backgrounds/"
    property string bgStringComplete: bgString+myBackground

    property int timeout: 1500 //in ms
    property int timein: 0
    property bool countdownDone: false

    anchors.fill: parent
    source: bgStringComplete
    smooth: true

    //top bar
    Item {
        id: topToolbar
        width: parent.width; height: parent.height
        anchors{
            top: engine.top
            topMargin: 20
            horizontalCenter: engine.horizontalCenter
        }
        
        Rectangle {
            id: status
            height: 40; width: 180
            border.color:  "#CCCCCC"
            color: "black"
            border.width:  4
            opacity: .7
            radius: 10
            anchors {
                left: topToolbar.left
                leftMargin:20
            }
        }
        Text {
            id: statusText
            smooth: true
            font.bold: false
            font.pixelSize: 20
            color: "#CCCCCC"
            wrapMode: Text.WordWrap
            text: "Dice on Table: "
            anchors.left: status.left
            anchors.leftMargin: 7
            anchors.top: status.top
            anchors.topMargin: 5
            anchors.bottom:  status.bottom
            anchors.bottomMargin: 5
        }
        Text {
            id: statusDynamicText
            font.bold: false
            smooth: true
            font.pixelSize: 20
            color: "#CCCCCC"
            wrapMode: Text.WordWrap
            style: Text.Raised
            anchors.top: status.top
            anchors.topMargin: 5
            anchors.right: status.right
            anchors.rightMargin: 7
            anchors.bottom:  status.bottom
            anchors.bottomMargin: 5
        }
    }
    
    
    // box2d elements start here
    World {
        id: world;
        anchors.fill: parent
        gravity: Qt.point(-accX*150*currentlyRolling, -accY*250*currentlyRolling); // accelerations are scaled up (y is less sensitive so it's scaled higher)
        Component.onCompleted: {
            Script.finalizeBoard(myDice);
            statusDynamicText.text = Script.getNumberDice(myDice);
            startText.visible = true;
            calibrate();
            
            
            //Clear roll results
            var temp = rollResults;
            Script.clearResults(temp);
            rollResults = temp;
        }
        
        Wall {
            id: ground
            height: 70
            anchors { left: parent.left; right: parent.right; bottom: parent.bottom;}
        }
        Wall {
            height: 50
            id: ceiling
            anchors { left: parent.left; right: parent.right; top: parent.top;}
        }
        Wall {
            width: 1
            id: leftWall
            anchors { right: parent.left; bottom: ground.top; top: ceiling.bottom }
        }
        Wall {
            width: 1
            id: rightWall
            anchors { left: parent.right; bottom: ground.top; top: ceiling.bottom }
        }
        
        Connections {
            target: main
            onAccXChanged: {
                if(!currentlyRolling &countdownDone){
                    currentlyRolling = true;
                    countdownDone= false;
                }
                calibrate();
            }
            onAccYChanged: {
                calibrate();
            }
        }
        
        // physics debug
        /*DebugDraw {
            id: debugDraw
            world: world
            anchors.fill: world
            opacity: 0.75
            visible: false
        }
        MouseArea {
            id: debugMouseArea
            anchors.fill: world
            onPressed: debugDraw.visible = !debugDraw.visible
        }*/
    }


    // fill bar for timed no move
    Rectangle {
        id: timeBar
        height: 50
        width: (((parent.width - 70) * (timeout-timein)) / (timeout))
        Behavior on width { SmoothedAnimation { velocity: 1000 } }
        border.color:  "#CCCCCC"
        color: "black"
        opacity: .7
        border.width: 8
        radius: 10
        anchors {
            verticalCenter: stopButton.verticalCenter
            left: stopButton.right
            leftMargin: 5
        }
    }

    // stop button to the left of time bar.
    Button_NegativeButton{
        id: stopButton
        width: 60
        height: 60
        anchors.left:engine.left
        anchors.leftMargin: 5
        anchors.bottom:engine.bottom
        anchors.bottomMargin: 4
        text: "STOP"

        onClicked: {
            if(!currentlyRolling){
                currentlyRolling = true; timein = timeout;
            }
            else{
                timein = timeout;
            }
        }
    }

    //grey out box before and after rolling starts
    Rectangle {
        id: greyOutBox
        anchors.fill: parent
        color: "black"
        opacity: .7

    }

    
    //countdown
    Rectangle {
        id: startRect
        height: startText.height+20; width: startText.width+20
        border.color: color_JADE
        color: "black"
        border.width:  5
        opacity: .7
        radius: 10
        anchors.centerIn: parent
    }

    Text {
        id: startText
        text: "Ready"
        font.pixelSize: 60
        anchors.centerIn: parent
        color:  color_JADE
        styleColor: "black"
        style: Text.Outline
        font.bold: true
        visible: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        
        onVisibleChanged:
            SequentialAnimation {
            NumberAnimation { target: startText; property: "opacity"; easing.type: Easing.InExpo; to: 0; duration: 700 }
            PropertyAction{ target: startText; property: "font.pixelSize"; value: 70}
            PropertyAction{ target: startText; property: "text"; value: "Set"}
            NumberAnimation { target: startText; property: "opacity"; to: 1; }
            NumberAnimation { target: startText; property: "opacity"; easing.type: Easing.InExpo; to: 0; duration: 700 }
            PropertyAction{ target: startText; property: "font.pixelSize"; value: 100}
            PropertyAction{ target: startText; property: "text"; value: "Shake\nand\nROLL!"}
            NumberAnimation { target: startText; property: "opacity"; to: 1; }
            PropertyAction{ target: engine; property: "countdownDone"; value: true}
            ParallelAnimation {
                NumberAnimation{ target: greyOutBox; property: "opacity"; easing.type: Easing.OutExpo; to: 0; duration: 1200; }
                NumberAnimation{ target: startText; property: "opacity"; easing.type: Easing.InCirc; to: 0; duration: 1200; }
                NumberAnimation{target: startRect; property: "opacity"; easing.type: Easing.InCirc; to: 0; duration: 1200; }
            }
            PropertyAction{ target: greyOutBox; property: "visible"; value: false}
            PropertyAction{ target: startText; property: "visible"; value: false}
            PropertyAction{ target: startRect; property: "visible"; value: false}

        }
    }

    //random sound effect played every second when rolling
    /*Audio {
        id: playSound
        source: "../sound/clack1.wav"
    }
    Timer{
        interval: timeout ; running: currentlyRolling; repeat: true;
        onTriggered:{
        var soundNum = Math.floor(Math.random()*6) +1;
        var sound = "../sound/clack"+ soundNum +".wav";
        playSound.source= sound;
        playSound.play();
            console.log("Played sound: "+sound);
        }
    }*/

    //timer to stop rolling, timeout = milliseconds of no movement.
    Timer{
        interval: 50; running: currentlyRolling; repeat: true;
        onTriggered:{
            if(accX==0 && accY ==0)
                timein+=50;
            else
                timein=0;

            if(timein>=timeout){
                currentlyRolling = false;
                resultsHolder.visible= true;
                resultsText.visible= true;
                returnButton.visible= true;
                rerollButton.visible= true;
                greyOutBox.opacity = .7;
                greyOutBox.visible = true;
                stopButton.visible = false;

                for(var i = 0; i<6; i++)
                    console.log("Rolls of diceNumType "+i+": "+rollResults[i]);
            }
        }
    }

    // after, rolling display results and click to return

    Rectangle {
        id: resultsHolder

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 20


        color: "black"
        width: 320
        height: 550
        border.color: "#CCCCCC"
        border.width: 4
        smooth: true
        radius: 50
        visible: false
        opacity: .7

        onVisibleChanged: {
            var output = "";
            var sum = Number(0);

            for(var i = 0; i<6; i++){
                if(i == 0 & rollResults[i][0] != null)
                    output+= "D4 Rolls:\n";
                if(i == 1 & rollResults[i][0] != null)
                    output+= "D6 Rolls:\n";
                if(i == 2 & rollResults[i][0] != null)
                    output+= "D8 Rolls:\n";
                if(i == 3 & rollResults[i][0] != null)
                    output+= "D10 Rolls:\n";
                if(i == 4 & rollResults[i][0] != null)
                    output+= "D12 Rolls:\n";
                if(i == 5 & rollResults[i][0] != null)
                    output+= "D20 Rolls:\n";

                for(var k in rollResults[i]){
                    if(k == rollResults[i].length -1)
                        output+= rollResults[i][k];
                    else
                        output+= rollResults[i][k]+ ', ';

                    sum+=Number(rollResults[i][k]);
                }


                if(rollResults[i][0]!=null)
                    output+= '\n';
            }

            if (returnFile == "modes/selectdice.qml")
                    output+= "\tTOTAL: " +Number(sum)

            resultsText.text= output;
        }
    }
    Text {
        id: resultsText
        font.bold: true
        smooth: true
        font.pixelSize: 25
        width:  parent.width-60
        wrapMode: Text.WordWrap
        color: "#CCCCCC"
        style: Text.Raised
        anchors.horizontalCenter: resultsHolder.horizontalCenter
        anchors.top: resultsHolder.top
        anchors.topMargin: 30
        visible: false

    }



    Button_AffirmativeButton {
        id: returnButton
        text: {if (returnFile == "modes/selectdice.qml")
                return "Reselect"
            else
                return "Return"}
        onClicked: {
            //Clear select dice
            if(returnFile != "modes/rpgattack/DamageTotal.qml")
            {
                var temp = myDice;
                Script.clearData(temp);
                myDice = temp;
            }
            showScreen(returnFile)
        }
        anchors.bottom: resultsHolder.bottom
        anchors.left: {
            if (returnFile == "modes/selectdice.qml")
                return resultsHolder.left
        }
        anchors.bottomMargin: 25
        anchors.leftMargin: {
            if (returnFile == "modes/selectdice.qml")
                return 15
            else
                return 0
        }
        anchors.horizontalCenter:{
            if (returnFile != "modes/selectdice.qml")
                return resultsHolder.horizontalCenter
        }
        visible: false
    }

    Button_AffirmativeButton {
        id: rerollButton
        text: "Again?"
        onClicked: {showScreen(""); showScreen("engine/engine.qml");}
        anchors.bottom: resultsHolder.bottom
        anchors.right: resultsHolder.right
        anchors.bottomMargin: 25
        anchors.rightMargin: 15
        visible: false
        enabled: {
            if (returnFile == "modes/selectdice.qml")
                return true
            else
                return false
        }
        opacity: {
            if (returnFile == "modes/selectdice.qml")
                return 1
            else
                return 0
        }
    }


    //for debug purposes
    /*
    Text {
        id:xLabel
        x: 395
        y: 137
        color: "#CCCCCC"
        text: "X Acceleration: " + accX
        anchors.verticalCenterOffset: -92
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "black"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }
    
    
    Text {
        id:yLabel
        x: 395
        y: 212
        color: "#CCCCCC"
        text: "Y Acceleration: " + accY
        anchors.verticalCenterOffset: -17
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "black"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }
    
    Text {
        id:timeinLabel
        x: 395
        y: 282
        color: "#CCCCCC"
        text: "timein clock: " + timein
        anchors.verticalCenterOffset: 53
        anchors.horizontalCenterOffset: 1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignLeft
        styleColor: "black"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }*/

    /*HoldButton {
                id: rollBtn
                anchors {
                    bottom: engine.bottom
                    horizontalCenter: engine.horizontalCenter
                }
                text: "Hold to Roll!"
                onPressed: {
                    calibrate();
                    currentlyRolling = true;
                }
                onReleased: {
                    currentlyRolling =  false;
                }
    }*/
}
