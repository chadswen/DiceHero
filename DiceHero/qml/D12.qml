import QtQuick 1.0
import Box2D 1.0

Die {
    id: d12
    currentSource: "d12_1.png"
    sides: 12

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(23, 9),
            Qt.point(6, 55),
            Qt.point(45, 87),
            Qt.point(86, 59),
            Qt.point(73, 11)
        ]
    }
    xPos:40; yPos:31; yAngle:0
    states: [
        State {
            name: "1"
            PropertyChanges { target: d12; currentSource: "d12_1.png"; xPos:40; yPos:31; yAngle:0}
        },
        State {
            name: "2"
            PropertyChanges { target: d12; currentSource: "d12_2.png"; xPos:18; yPos:24; yAngle:-10; textRot:25}
        },
        State {
            name: "3"
            PropertyChanges { target: d12; currentSource: "d12_3.png";}
        },
        State {
            name: "4"
            PropertyChanges { target: d12; currentSource: "d12_4.png"; xPos:42; yPos:32; yAngle:-25; textRot:30}
        },
        State {
            name: "5"
            PropertyChanges { target: d12; currentSource: "d12_5.png"; xPos:34; yPos:46; yAngle:10; textRot:10}
        }
    ]
}
