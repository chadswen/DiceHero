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
        font.bold: true
        font.pixelSize: 18
    }

    //Change random number at a rate congruent to velocity
    Timer{ interval: 20000/Math.round(Math.sqrt(Math.pow(linearVelocity.x,2)+Math.pow(linearVelocity.y,2))); running: currentlyRolling; repeat: true;
        onTriggered:{ number.text= number.text= Math.floor(Math.random()*sides) +1;
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

            }
        }
    }
}
