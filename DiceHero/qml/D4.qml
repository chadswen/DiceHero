import QtQuick 1.0
import Box2D 1.0

Die {
    id: d4
    currentSource: "d4_1.png"
    sides: 4

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
    states: [
        State {
            name: "1"
            PropertyChanges { target: d4; currentSource: "d4_1.png"}
        },
        State {
            name: "2"
            PropertyChanges { target: d4; currentSource: "d4_2.png"}
        },
        State {
            name: "3"
            PropertyChanges { target: d4; currentSource: "d4_3.png"}
        },
        State {
            name: "4"
            PropertyChanges { target: d4; currentSource: "d4_4.png"}
        },
        State {
            name: "5"
            PropertyChanges { target: d4; currentSource: "d4_5.png"}
        }
    ]
}
