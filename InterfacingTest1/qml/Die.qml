//Base class for dice
import QtQuick 1.0
import Box2D 1.0

Body {
    width: 70;
    height: 70;
    sleepingAllowed: false

    fixtures: Box {
        anchors.fill: parent
        density: 20;
        friction: 0.3;
        restitution: .8;
    }


    property string currentNumber: "NULL"
    property string currentSource: "d6.png"
    //property int edgeBounceDistance: 200 // make this greater than die width to avoid clipping


Image {
    id:die
    anchors.fill: parent
    smooth: false // once animations stop, we can turn on smooth, otherwise it's a performance hit
    source: currentSource


    Text {
        id: number
        color: "#45c3c3"
        text: currentNumber
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    MouseArea {
        anchors.fill: parent
        drag.target: die
        drag.axis: Drag.XandYAxis
        drag.filterChildren: true
    }

    /*onXChanged: collisionDetection(die)
    onYChanged: collisionDetection(die)

    Behavior on x { SmoothedAnimation {velocity: 100 } }
    Behavior on y { SmoothedAnimation {velocity: 100 } }


    function collisionDetection(die){
        //edge bounce
        if (die.y <= 0) {
            die.y = edgeBounceDistance;
        }
        else if (die.y >= screen.height - die.height) {
            die.y = 640 - edgeBounceDistance;
        }

        if (die.x <= 0) {
            die.x = edgeBounceDistance;
        }
        else if (die.x >= screen.width - die.width) {
            die.x = 360 - edgeBounceDistance;
        }

    }*/
}
}
