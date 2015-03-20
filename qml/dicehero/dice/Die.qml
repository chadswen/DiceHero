//Base class for dice
import Qt 4.7
import QtQuick 1.0
import Box2D 1.0

Body {
    sleepingAllowed: false
    width: 90
    height: 90
    angularDamping: .2

    property string currentSource
    property int sides: 0
    property int cornerFrame: 0
    property int lastFrame: 0
    property real myDensity: 50
    property real myFriction: .3
    property real myRestitution: .65
    property int currentFrame: 1
    property double xPos
    property double yPos
    property double yAngle: 0
    property int textRot : 0

    property int dieSpeed : 70

    // in case of accidental spawning outside the screen.
    Component.onCompleted: {
        while(x<0 || x>engine.width)
            x = Math.random() * (engine.width - 70)+35;
        while(y<0 || y>engine.height)
            y = Math.random() * (engine.height / 3);
    }

    Image {
        id:die

        anchors.fill: parent
        smooth: false // once animations stop, we can turn on smooth, otherwise it's a performance hit
        sourceSize.width: 90
        sourceSize.height: 90
        source: currentSource
        //asynchronous: true
    }

    Text {
        id: number
        color: "#CCCCCC"
        text: Math.floor(Math.random()*sides) +1
        x:xPos
        y:yPos
        rotation: textRot
        styleColor: "black"
        style: Text.Outline
        font.bold: false
        font.pixelSize: 20
        onTextChanged: {
            if(number.text == "6" || number.text == "9")
                number.font.underline= true;
            else
                number.font.underline= false;
        }
        transform: Rotation { origin.x: xPos; origin.y: yPos; axis {x:0; y:1; z:0} angle:yAngle }


    }

    //Change frames and random number at a rate congruent to velocity
    Timer {
        interval: dieSpeed;
        running: (currentlyRolling || (!currentlyRolling & currentFrame!=2));
        repeat: true;
        onTriggered:{
            if(linearVelocity.x != 0 || linearVelocity.y != 0
                    || (!currentlyRolling & currentFrame!=2)){

                if( Math.abs(linearVelocity.x)  <5 || Math.abs(linearVelocity.y)<10)
                    dieSpeed = 125
                else if( Math.abs(linearVelocity.x)  >5 || Math.abs(linearVelocity.y)>10)
                    dieSpeed = 100
                else if( Math.abs(linearVelocity.x)  >50 || Math.abs(linearVelocity.y)>50)
                    dieSpeed = 75;

                if(currentFrame == cornerFrame){
                    number.visible = false;
                    if(currentlyRolling)
                        number.text= Math.floor(Math.random()*sides) +1;
                }
                else{number.visible = true;}
                state = currentFrame;

                if(currentFrame == lastFrame)
                    currentFrame = 0;

                currentFrame++;
            }
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
