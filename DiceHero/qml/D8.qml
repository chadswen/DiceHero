import QtQuick 1.0
import Box2D 1.0

Die {
    id: d8
    currentSource: "d6.png"

    Text {
        id: number
        color: "#45c3c3"
        text: Math.floor(Math.random()*8) +1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(0, 0),
            Qt.point(0, 70),
            Qt.point(70, 70),
            Qt.point(70, 0)
        ]
    }
}
