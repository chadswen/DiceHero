import QtQuick 1.0
import Box2D 1.0

Die {
    id: d4
    currentSource: "../images/d4_1.png"
    sides: 4
    cornerFrame: 3
    lastFrame: 5

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(8, 12),
            Qt.point(27, 84),
            Qt.point(87, 37)
        ]
    }
    xPos:35; yPos:30; yAngle:0
    states: [
        State {
            name: "1"
            PropertyChanges { target: d4; currentSource: "../images/d4_1.png"; xPos:35; yPos:30; yAngle:0; textRot:10}
        },
        State {
            name: "2"
            PropertyChanges { target: d4; currentSource: "../images/d4_2.png"; xPos:35; yPos:35; yAngle:-25; textRot:10}
        },
        State {
            name: "3"
            PropertyChanges { target: d4; currentSource: "../images/d4_3.png";}
        },
        State {
            name: "4"
            PropertyChanges { target: d4; currentSource: "../images/d4_4.png"; xPos:30; yPos:30; yAngle:-25; textRot:10}
        },
        State {
            name: "5"
            PropertyChanges { target: d4; currentSource: "../images/d4_5.png"; xPos:30; yPos:25; yAngle:-15; textRot:10}
        }
    ]
}
