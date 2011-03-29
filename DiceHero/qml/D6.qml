import QtQuick 1.0
import Box2D 1.0

Die {
    id: d6
    currentSource: "d6.png"
    sides: 6

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(0, 0),
            Qt.point(0, 90),
            Qt.point(90, 90),
            Qt.point(90, 0)
        ]
    }
}
