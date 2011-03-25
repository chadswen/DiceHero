//Base class for dice
import Qt 4.7
import QtQuick 1.0
import Box2D 1.0

Body {
    sleepingAllowed: false
    width: 70
    height: 70

    property string currentSource
    property real myDensity: 5
    property real myFriction: .3
    property real myRestitution: .65


    Image {
        id:die

        anchors.fill: parent
        smooth: false // once animations stop, we can turn on smooth, otherwise it's a performance hit
        source: currentSource
    }
}
