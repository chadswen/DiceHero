import QtQuick 1.0
import Box2D 1.0

Die {
    id: d20
    currentSource: "d20_1.png"
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
    xPos:35; yPos:35; yAngle:0
    states: [
        State {
            name: "1"
            PropertyChanges { target: d20; currentSource: "d20_1.png"; xPos:35; yPos:35; yAngle:0}
        },
        State {
            name: "2"
            PropertyChanges { target: d20; currentSource: "d20_2.png"; xPos:28; yPos:31; yAngle:-10; textRot:25}
        },
        State {
            name: "3"
            PropertyChanges { target: d20; currentSource: "d20_3.png";}
        },
        State {
            name: "4"
            PropertyChanges { target: d20; currentSource: "d20_4.png"; xPos:30; yPos:35; yAngle:-25; textRot:30}
        },
        State {
            name: "5"
            PropertyChanges { target: d20; currentSource: "d20_5.png"; xPos:37; yPos:32; yAngle:10; textRot:10}
        }
    ]
}
