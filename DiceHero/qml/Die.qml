//Base class for dice
import Qt 4.7
import QtQuick 1.0
import Box2D 1.0

Body {
    sleepingAllowed: false
    width: 70
    height: 70

    property string currentSource
    property int sides: 0
    property real myDensity: 25
    property real myFriction: .3
    property real myRestitution: .65
    property int rollRate: 50


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
        horizontalAlignment: Text.AlignHCenter
        styleColor: "black"
        style: Text.Outline
        font.bold: false
        font.pixelSize: 25
    }

    //Change random number at a rate congruent to velocity
    Timer{ interval: rollRate; running: currentlyRolling; repeat: true;
        onTriggered:{
            number.text= Math.floor(Math.random()*sides) +1;
            rollRate = 20000/Math.floor(Math.sqrt(linearVelocity.x*linearVelocity.x+linearVelocity.y*linearVelocity.y));
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
                linearDamping= 1.0;

            }
        }
    }
}
