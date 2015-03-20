import QtQuick 1.0
import Box2D 1.0

Die {
    id: d8
    currentSource: "../images/d8_1.png"
    sides: 8
    cornerFrame: 3
    lastFrame: 5

    fixtures: Polygon {
        density: myDensity
        friction: myFriction
        restitution: myRestitution
        vertices: [
            Qt.point(45, 4),
            Qt.point(14, 51),
            Qt.point(46, 85),
            Qt.point(74, 51)
        ]
    }
    xPos:38; yPos:20; yAngle:0
    states: [
        State {
            name: "1"
            PropertyChanges { target: d8; currentSource: "../images/d8_1.png"; xPos:38; yPos:20; yAngle:0}
        },
        State {
            name: "2"
            PropertyChanges { target: d8; currentSource: "../images/d8_2.png"; xPos:20; yPos:21; yAngle:-50; textRot:25}
        },
        State {
            name: "3"
            PropertyChanges { target: d8; currentSource: "../images/d8_3.png";}
        },
        State {
            name: "4"
            PropertyChanges { target: d8; currentSource: "../images/d8_4.png"; xPos:45; yPos:24; yAngle:-25; textRot:25}
        },
        State {
            name: "5"
            PropertyChanges { target: d8; currentSource: "../images/d8_5.png"; xPos:33; yPos:20; yAngle:-20; textRot:25}
        }
    ]
}
