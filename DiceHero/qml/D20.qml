import QtQuick 1.0
import Box2D 1.0

Die {
    id: d20
    currentSource: "d20_side_blue.png"

    Text {
        id: number
        color: "#45c3c3"
        text: Math.floor(Math.random()*20) +1
        anchors.centerIn: parent
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#000000"
        style: Text.Sunken
        font.bold: true
        font.pixelSize: 18
    }

    fixtures: Polygon {
        density: 5
        friction: 0.3
        restitution: 0.65
        vertices: [
            Qt.point(18, 5),
            Qt.point(3, 34),
            Qt.point(21, 61),
            Qt.point(56, 57),
            Qt.point(67, 28),
            Qt.point(49, 1)
        ]
    }
}
