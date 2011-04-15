import Qt 4.7
import QtQuick 1.0
import Box2D 1.0
import QtMultimediaKit 1.1
import "../common"
import "../common/createDice.js" as Script


Image {
    signal showScreen(string msg)
    id: engine
    width: 360;
    height: 640;
    
    property int timeout: 0
    property int timein: 0
    property bool countdownDone: false
    
    
    SystemPalette {
        id: activePalette
    }
    anchors.fill: parent
    source: "../images/board.png"
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
    
    // fill bar for no move timeout
    Rectangle {
        id: timeBar
        height: 20
        width: ((parent.width * (2000-timeout)) / (2000))
        Behavior on width { SmoothedAnimation { velocity: 1200 } }
        border.color:  "#CCCCCC"
        color: "black"
        border.width:  4
        opacity: .7
        radius: 10
        anchors {
            bottom: parent.bottom
            bottomMargin: 4
        }
        gradient: Gradient {
            GradientStop { id: gradient1; position: 0.0 }
            GradientStop { id: gradient2; position: 1.0 }
        }

        // hidden debugging click zone to end rolling without accelerometer
        MouseArea{
            width: 10
            height: parent.height
            anchors.left:parent.left
            onClicked: {
                if(!currentlyRolling){
                    currentlyRolling = true; timeout = 2000;
                }
            }
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
            height: 40
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
    
    //countdown
    Text {
        id: startText
        text: "Ready"
        font.pixelSize: 60
        anchors.centerIn: parent
        color:  "white"
        styleColor: "black"
        style: Text.Outline
        font.bold: true
        font.italic: true
        font.family: "Impact"
        visible: false
        
        onVisibleChanged:
            SequentialAnimation {
            NumberAnimation { target: startText; property: "opacity"; easing.type: Easing.InExpo; to: 0; duration: 700 }
            PropertyAction{ target: startText; property: "font.pixelSize"; value: 70}
            PropertyAction{ target: startText; property: "text"; value: "Set"}
            NumberAnimation { target: startText; property: "opacity"; to: 1; }
            NumberAnimation { target: startText; property: "opacity"; easing.type: Easing.InExpo; to: 0; duration: 700 }
            PropertyAction{ target: startText; property: "font.pixelSize"; value: 110}
            PropertyAction{ target: startText; property: "text"; value: "ROLL!"}
            NumberAnimation { target: startText; property: "opacity"; to: 1; }
            PropertyAction{ target: engine; property: "countdownDone"; value: true}
            NumberAnimation { target: startText; property: "opacity"; easing.type: Easing.InCirc; to: 0; duration: 1500 }
            PropertyAction{ target: startText; property: "visible"; value: false}
        }
    }

    //random sound effect played every second when rolling
    /*Audio {
        id: playSound
        source: "../sound/clack1.wav"
    }
    Timer{
        interval: 2000 ; running: currentlyRolling; repeat: true;
        onTriggered:{
        var soundNum = Math.floor(Math.random()*6) +1;
        var sound = "../sound/clack"+ soundNum +".wav";
        playSound.source= sound;
        playSound.play();
            console.log("Played sound: "+sound);
        }
    }*/
    
    //timer to stop rolling, currently 2 seconds of no movement.
    Timer{
        interval: 50; running: currentlyRolling; repeat: true;
        onTriggered:{
            if(accX==0 && accY ==0)
                timeout+=50;
            else
                timeout=0;
            
            if(timeout>=2000){
                currentlyRolling = false;
                resultsHolder.visible= true;
                resultsText.visible= true;
                returnButton.visible= true;
                rerollButton.visible= true;
                
                for(var i = 0; i<6; i++)
                    console.log("Rolls of diceNumType "+i+": "+rollResults[i]);
            }
        }
    }
    
    // after, rolling display results and click to return
    
    Rectangle {
        id: resultsHolder
        
        anchors.centerIn: parent
        
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
                
                for(var k in rollResults[i])
                    if(k == rollResults[i].length -1)
                        output+= rollResults[i][k];
                    else
                        output+= rollResults[i][k]+ ', ';
                
                
                if(rollResults[i][0]!=null)
                    output+= '\n';
            }
            
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
        text: {if (returnFile == "selectdice.qml")
                return "Reselect"
            else
                return "Return"}
        onClicked: {
            //Clear select dice
            var temp = myDice;
            Script.clearData(temp);
            myDice = temp;
            showScreen(returnFile)
        }
        anchors.bottom: resultsHolder.bottom
        anchors.left: {
            if (returnFile == "selectdice.qml")
                return resultsHolder.left
        }
        anchors.bottomMargin: 25
        anchors.leftMargin: {
            if (returnFile == "selectdice.qml")
                return 15
            else
                return 0
        }
        anchors.horizontalCenter:{
            if (returnFile != "selectdice.qml")
                return resultsHolder.horizontalCenter
        }
        visible: false
    }

    Button_AffirmativeButton {
        id: rerollButton
        text: "Again?"
        onClicked: {showScreen(""); showScreen("engine.qml");}
        anchors.bottom: resultsHolder.bottom
        anchors.right: resultsHolder.right
        anchors.bottomMargin: 25
        anchors.rightMargin: 15
        visible: false
        enabled: {
            if (returnFile == "selectdice.qml")
                return true
            else
                return false
        }
        opacity: {
            if (returnFile == "selectdice.qml")
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
        id:timeoutLabel
        x: 395
        y: 282
        color: "#CCCCCC"
        text: "Timeout clock: " + timeout
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
