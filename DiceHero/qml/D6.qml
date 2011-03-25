import QtQuick 1.0
import Box2D 1.0

Die {
    id: d6
    currentSource: "d6.png"
    currentNumber: Math.floor(Math.random()*6) +1
    fixtures: Polygon {
        density: 5
        friction: 0.3
        restitution: 0.65
        vertices: [
            Qt.point(0, 0),
            Qt.point(0, 70),
            Qt.point(70, 70),
            Qt.point(70, 0)
        ]
    }
}
