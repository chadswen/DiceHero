import QtQuick 1.0
import Box2D 1.0

Die {
    id: d6
    currentSource: "d6_1.png"
    sides: 6

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(19, 19),
            Qt.point(19, 69),
            Qt.point(69, 69),
            Qt.point(69, 19)
        ]
    }
    xPos:38; yPos:30; yAngle:0
    states: [
        State {
            name: "1"
            PropertyChanges { target: d6; currentSource: "d6_1.png"; xPos:38; yPos:30; yAngle:0}
        },
        State {
            name: "2"
            PropertyChanges { target: d6; currentSource: "d6_2.png"; xPos:15; yPos:30; yAngle:-25; textRot:10}
        },
        State {
            name: "3"
            PropertyChanges { target: d6; currentSource: "d6_3.png";}
        },
        State {
            name: "4"
            PropertyChanges { target: d6; currentSource: "d6_4.png"; xPos:28; yPos:42; yAngle:-25; textRot:40}
        },
        State {
            name: "5"
            PropertyChanges { target: d6; currentSource: "d6_5.png"; xPos:20; yPos:25; yAngle:-15; textRot:50}
        }
    ]
}
