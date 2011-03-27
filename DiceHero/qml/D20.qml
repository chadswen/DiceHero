import QtQuick 1.0
import Box2D 1.0

Die {
    id: d20
    currentSource: "d20_side_blue.png"
    sides: 20

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
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
