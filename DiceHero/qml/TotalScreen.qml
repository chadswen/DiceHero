import QtQuick 1.0
import Qt.labs.particles 1.0




Rectangle {

signal showScreen(string msg)

        id: screen

        width: 360; height: 640

        SystemPalette {
                id: activePalette
        }


        Item {
            id: titleBackground
            width: parent.width; height: parent.height
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            Rectangle {
                    anchors.fill: parent
                    color: "black"
            }
        }


        Rectangle {
            id: textHolder

            anchors {
                top: screen.top;
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            color: "black"
            width: 300
            height: 400
            border.color: "#336633"
            border.width: 4
            smooth: true
            radius: 50

            Image {
                id: titleText
                width: 289; height: 64
                anchors {
                    top: textHolder.top;
                    topMargin: 50
                    horizontalCenter: parent.horizontalCenter
                }
                source: "diceheroheader.png"
            }

            Text {
                id: versionNumber
                anchors {
                    top: titleText.bottom;
                    topMargin: 12
                    horizontalCenter: parent.horizontalCenter
                }
                font.bold: false
                smooth: true
                font.family: "Arial"
                font.pixelSize: 12
                color: "#FF9933"
                wrapMode: Text.WordWrap
                style: Text.Raised
                text: "V1.0"
            }

    Text {
        id: welcomeText
        x: 10
        y: 170
        width:280
        height: 60
        anchors {
            top: versionNumber.bottom;
            topMargin: 29
            horizontalCenter: parent.horizontalCenter
        }
        font.bold: false
        smooth: true
        font.family: "Helvetica [Cronyx]"
        font.pixelSize: 20
        color: "#AAAAAA"
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        style: Text.Raised
        text: "Thanks for playing MotherLoad! Your score is:"
        anchors.horizontalCenterOffset: 0
    }

    Text {
        id: scoreBox
        x: 109
        y: 269
        width: 80
        height: 20
        color: "#aaaaaa"
        text: scoreFields[17];
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 50
    }
}

        Button {
            id: selectGameButton
            anchors {
                bottom: screen.bottom;
                bottomMargin: 75
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "Game Modes"
            Particles {
                 id: particles
                 width: 1; height: 1
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.verticalCenter: parent.verticalCenter
                 emissionRate: 0
                 lifeSpan: 900; lifeSpanDeviation: 600
                 angle: 0; angleDeviation: 360;
                 velocity: 350; velocityDeviation: 60
                 source: "logo_small.png"
           }
           onClicked: particles.burst(14), timer.start();
        }

        Item {
            Timer {
                id: timer
                interval: 900; running: false; repeat: false;
                onTriggered: screen.showScreen("gameSelection.qml");
            }
        }
}
