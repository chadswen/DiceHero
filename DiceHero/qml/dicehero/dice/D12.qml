import QtQuick 1.0
import Box2D 1.0

Die {
    id: d12
    currentSource: "../images/d12_1.png"
    sides: 12
    cornerFrame: 6
    lastFrame: 9

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
            PropertyChanges { target: d12; currentSource: "../images/d12_1.png"; xPos:37; yPos:30; yAngle:0; textRot:23}
        },
        State {
            name: "2"
            PropertyChanges { target: d12; currentSource: "../images/d12_2.png"; xPos:41; yPos:33; yAngle:-10; textRot:25}
        },
        State {
            name: "3"
            PropertyChanges { target: d12; currentSource: "../images/d12_3.png"; xPos:49; yPos:35; yAngle:-30; textRot:22}
        },
        State {
            name: "4"
            PropertyChanges { target: d12; currentSource: "../images/d12_4.png";  xPos:46; yPos:35; yAngle:-50; textRot:22}
        },
        State {
            name: "5"
            PropertyChanges { target: d12; currentSource: "../images/d12_5.png"; xPos:40; yPos:47; yAngle:-80; textRot:25}
        },
        State {
            name: "6"
            PropertyChanges { target: d12; currentSource: "../images/d12_6.png"; xPos:35; yPos:35; yAngle:0}
        },
        State {
            name: "7"
            PropertyChanges { target: d12; currentSource: "../images/d12_7.png"; xPos:25; yPos:25; yAngle:-25; textRot:30}
        },
        State {
            name: "8"
            PropertyChanges { target: d12; currentSource: "../images/d12_8.png"; xPos:27; yPos:25; yAngle:-20; textRot:30}
        },
        State {
            name: "9"
            PropertyChanges { target: d12; currentSource: "../images/d12_9.png"; xPos:33; yPos:30; yAngle:-10; textRot:25}
        }
    ]
}
