import QtQuick 1.0
import Box2D 1.0

Die {
    id: d10
    currentSource: "../images/d10_1.png"
    sides: 10
    cornerFrame: 6
    lastFrame: 10

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
    xPos:35; yPos:20; yAngle:0
    states: [
        State {
            name: "1"
            PropertyChanges { target: d10; currentSource: "../images/d10_1.png"; xPos:35; yPos:20; yAngle:0; textRot:0}
        },
        State {
            name: "2"
            PropertyChanges { target: d10; currentSource: "../images/d10_2.png"; xPos:41; yPos:20; yAngle:10; textRot:0}
        },
        State {
            name: "3"
            PropertyChanges { target: d10; currentSource: "../images/d10_3.png"; xPos:49; yPos:20; yAngle:30; textRot:-15}
        },
        State {
            name: "4"
            PropertyChanges { target: d10; currentSource: "../images/d10_4.png";  xPos:46; yPos:20; yAngle:50; textRot:-20}
        },
        State {
            name: "5"
            PropertyChanges { target: d10; currentSource: "../images/d10_5.png"; xPos:40; yPos:20; yAngle:80; textRot:-35}
        },
        State {
            name: "6"
            PropertyChanges { target: d10; currentSource: "../images/d10_6.png"; xPos:35; yPos:35; yAngle:0}
        },
        State {
            name: "7"
            PropertyChanges { target: d10; currentSource: "../images/d10_7.png"; xPos:15; yPos:20; yAngle:-80; textRot:35}
        },
        State {
            name: "8"
            PropertyChanges { target: d10; currentSource: "../images/d10_8.png"; xPos:20; yPos:20; yAngle:-30; textRot:25}
        },
        State {
            name: "9"
            PropertyChanges { target: d10; currentSource: "../images/d10_9.png"; xPos:25; yPos:20; yAngle:-20; textRot:20}
        },
        State {
            name: "10"
            PropertyChanges { target: d10; currentSource: "../images/d10_10.png";xPos:30; yPos:20; yAngle:-10; textRot:0}
        }
    ]
}
