import QtQuick 1.0
import Qt.labs.particles 1.0
import "../common"


Rectangle {

signal showScreen(string msg)

        id: screen

        width: screenWidth; height: screenHeight

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
            border.color: color_JADE
            border.width: 4
            smooth: true
            radius: 50

    Text {
        id: welcomeText
        width:280
        height: 60
        anchors {
            top: versionNumber.bottom;
            topMargin: 80
            horizontalCenter: parent.horizontalCenter
        }
        font.bold: false
        smooth: true
        font.family: "Helvetica [Cronyx]"
        font.pixelSize: 28
        color: color_LIGHTTEXT
        wrapMode: Text.Wrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        style: Text.Raised
        text: "Game Mode"
    }
}

		Button_NegativeButton {
            id: returnButton
            anchors {
                bottom: screen.bottom;
                bottomMargin: 75
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "Return"
           onClicked: screen.showScreen("gameSelection.qml");
        }


        Button_PlayButton {
            id: playButton
            anchors {
                bottom: screen.bottom;
                bottomMargin: 155
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "PLAY"
            Particles {
                 id: particles            
                 width: 1; height: 1
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.verticalCenter: parent.verticalCenter
                 emissionRate: 0
                 lifeSpan: 900; lifeSpanDeviation: 600
                 angle: 0; angleDeviation: 360
                 velocity: 350; velocityDeviation: 60
                 source: "../images/logo_small.png"
           }
           onClicked: particles.burst(14), timer.start();
        }

        Item {
            Timer {
                id: timer
                interval: 900; running: false; repeat: false;
                onTriggered: screen.showScreen("MODE_FOLDER/MODE_START_SCREEN.qml");
            }
        }
}
