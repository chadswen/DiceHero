//Base class for dice
import Qt 4.7
import QtQuick 1.0
import Box2D 1.0

Body {
    sleepingAllowed: false
    width: 90
    height: 90

    property string currentSource
    property int sides: 0
    property real myDensity: 50
    property real myFriction: .3
    property real myRestitution: .65
    property int currentFrame: 1


    Image {
        id:die

        anchors.fill: parent
        smooth: false // once animations stop, we can turn on smooth, otherwise it's a performance hit
        source: currentSource
    }

    Text {
        id: number
        color: "#CCCCCC"
        text: Math.floor(Math.random()*sides) +1
        anchors.centerIn: parent
        styleColor: "black"
        style: Text.Outline
        font.bold: false
        font.pixelSize: 25
    }

    //Change frames and random number at a rate congruent to velocity
    Timer{
        interval: Math.floor(20000/Math.sqrt(linearVelocity.x*linearVelocity.x+linearVelocity.y*linearVelocity.y+1+5000*!currentlyRolling));
        running: (currentlyRolling || (!currentlyRolling & currentFrame>1)); repeat: true;
        onTriggered:{
            number.visible = true;
            if(currentFrame == 3){
                number.visible = false;
                if(currentlyRolling){
                    number.text= Math.floor(Math.random()*sides) +1;
                }
        }
        state = currentFrame;

        if(currentFrame == 5)
        currentFrame = 0;

        currentFrame++;


        if(number.text == "6" || number.text == "9")
        number.font.underline= true
        else
        number.font.underline= false
    }
    }

        Connections {
            target: main
            onCurrentlyRollingChanged: {
                if(!currentlyRolling){
                    var temp = rollResults;

                    var i;
                    if (sides== 4){
                        i = 0;}
                    else if (sides== 6){
                        i = 1;}
                    else if (sides== 8){
                        i = 2;}
                    else if (sides== 10){
                        i = 3;}
                    else if (sides== 12){
                        i = 4;}
                    else if (sides== 20){
                        i = 5;}

                    temp[i].push(number.text);
                    rollResults = temp;

                    linearVelocity= Qt.point(0,0);
                    angularDamping= .5;
                    linearDamping= .5;

                }
            }
        }
    }

