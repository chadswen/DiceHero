import QtQuick 1.0
import Box2D 1.0

Die {
    id: d20
    currentSource: "D20_animated_1.png"
    sides: 20

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(6, 22),
            Qt.point(10, 64),
            Qt.point(46, 89),
            Qt.point(82, 64),
            Qt.point(84, 21),
            Qt.point(45, 1)
        ]
    }
    states: [
        State {
            name: "1"
            PropertyChanges { target: d20; currentSource: "D20_animated_1.png"}
        },
        State {
            name: "2"
            PropertyChanges { target: d20; currentSource: "D20_animated_2.png"}
        },
        State {
            name: "3"
            PropertyChanges { target: d20; currentSource: "D20_animated_3.png"}
        },
        State {
            name: "4"
            PropertyChanges { target: d20; currentSource: "D20_animated_4.png"}
        },
        State {
            name: "5"
            PropertyChanges { target: d20; currentSource: "D20_animated_5.png"}
        }
    ]
}
