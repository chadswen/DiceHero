import QtQuick 1.0
import Box2D 1.0

Die {
    id: d20
    currentSource: "../images/d20_1.png"
    sides: 20
    cornerFrame: 6
    lastFrame: 10

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
            PropertyChanges { target: d20; currentSource: "../images/d20_1.png"; xPos:35; yPos:30; yAngle:0; textRot:23}
        },
        State {
            name: "2"
            PropertyChanges { target: d20; currentSource: "../images/d20_2.png"; xPos:41; yPos:33; yAngle:-10; textRot:25}
        },
        State {
            name: "3"
            PropertyChanges { target: d20; currentSource: "../images/d20_3.png"; xPos:49; yPos:35; yAngle:-30; textRot:22}
        },
        State {
            name: "4"
            PropertyChanges { target: d20; currentSource: "../images/d20_4.png";  xPos:46; yPos:35; yAngle:-50; textRot:22}
        },
        State {
            name: "5"
            PropertyChanges { target: d20; currentSource: "../images/d20_5.png"; xPos:40; yPos:47; yAngle:-80; textRot:25}
        },
        State {
            name: "6"
            PropertyChanges { target: d20; currentSource: "../images/d20_6.png"; xPos:35; yPos:35; yAngle:0}
        },
        State {
            name: "7"
            PropertyChanges { target: d20; currentSource: "../images/d20_7.png"; xPos:10; yPos:10; yAngle:-80; textRot:40}
        },
        State {
            name: "8"
            PropertyChanges { target: d20; currentSource: "../images/d20_8.png"; xPos:15; yPos:15; yAngle:-50; textRot:40}
        },
        State {
            name: "9"
            PropertyChanges { target: d20; currentSource: "../images/d20_9.png"; xPos:25; yPos:20; yAngle:-30; textRot:25}
        },
        State {
            name: "10"
            PropertyChanges { target: d20; currentSource: "../images/d20_10.png";xPos:33; yPos:25; yAngle:-20; textRot:25}
        }
    ]
}
