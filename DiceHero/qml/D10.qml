import QtQuick 1.0
import Box2D 1.0

Die {
    id: d10
    currentSource: "d10_1.png"
    sides: 10

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(45, 4),
            Qt.point(12, 44),
            Qt.point(44, 84),
            Qt.point(76, 44)
        ]
    }
    xPos:38; yPos:20; yAngle:0
    states: [
        State {
            name: "1"
            PropertyChanges { target: d10; currentSource: "d10_1.png"; xPos:38; yPos:20; yAngle:0}
        },
        State {
            name: "2"
            PropertyChanges { target: d10; currentSource: "d10_2.png"; xPos:25; yPos:21; yAngle:-10; textRot:25}
        },
        State {
            name: "3"
            PropertyChanges { target: d10; currentSource: "d10_3.png";}
        },
        State {
            name: "4"
            PropertyChanges { target: d10; currentSource: "d10_4.png"; xPos:47; yPos:37; yAngle:-25; textRot:30}
        },
        State {
            name: "5"
            PropertyChanges { target: d10; currentSource: "d10_5.png"; xPos:35; yPos:19; yAngle:-10; textRot:25}
        }
    ]
}
