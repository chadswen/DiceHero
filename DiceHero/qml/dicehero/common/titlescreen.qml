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
            source: "../images/diceheroheader.png"
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
            font.pixelSize: 20
            color: "#AAAAAA"
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            style: Text.Raised
            text: "This is the dice bag of the 21st Century! All the common dice types are included - just pick your favorite, give them a shake, and watch them roll!"
        }

        Button_AffirmativeButton {
            id: selectGameButton
            anchors {
                bottom: textHolder.bottom;
                bottomMargin: 20
                horizontalCenter: textHolder.horizontalCenter
            }
            text: "Play!"
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
    }

    Button_StandardButton {
        id: instructionsButton
        anchors {
            horizontalCenter: screen.horizontalCenter
            top: standardButton.bottom
            topMargin: 5

        }
        text: "Instructions"
        onClicked: screen.showScreen("browser/webbrowser.qml");
    }

    Button_StandardButton {
        id: standardButton
        anchors {
            horizontalCenter: screen.horizontalCenter
            bottom: screen.bottom
            bottomMargin: 130
        }
        text: "Settings"
        onClicked: screen.showScreen("common/Settings.qml");
    }

    Button_InfoButton {
        id: infoButton
        width: 60
        height: 60
        anchors {
            top: instructionsButton.bottom;
            topMargin: 5
            horizontalCenter: screen.horizontalCenter
        }
        text: "?"
        onClicked: infoPopup.visible = true
    }

    Item {
        Timer {
            id: timer
            interval: 900; running: false; repeat: false;
            onTriggered: screen.showScreen("modes/gameSelection.qml");
        }
    }


    Component {
        id: infoDelegate
        Item {
            width: infoPopup.width-20
            height: instructionsText.height + creditsText.height +20
            anchors.horizontalCenter: parent.horizontalCenter

            Column {
                id: column

                spacing: 20

                Text {
                    id: instructionsText
                    width: 280
                    anchors {
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
                    text: "Instructions:\nFirst, choose your game mode. Some game modes will restrict the number and types of dice you can roll. The dice are identified by the number of sides (for instance, a d6 is a six-sided die). In Hero Mode, you can roll any type of die you want! At the die selection screen, just press the button corresponding to the type of die you want, and it will be added to the table. Hit the button multiple times for multiple dice! Hit the \"Roll Dice\" button to begin. Shake and tilt your phone and watch the dice roll - they will come to rest if you let them settle.\n"
                }

                Text {
                    id: creditsText
                    width: 280
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                    font.bold: true
                    smooth: true
                    font.family: "Helvetica [Cronyx]"
                    font.pixelSize: 18
                    color: "#AAAAAA"
                    wrapMode: Text.Wrap
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    style: Text.Raised
                    text: "\nThe Dice Heroes:\nIvan Fan - Lead Testing Engineer Technician\nAaron Gann - Meritorious Game Mode Imperator\nDavid King - User Interface Specialist\nSkylar Seamans - Commander of Artistic Design\nBrian Shef - Executive Producer of Productions\nChad Swenson - Chief Primary Architect\n\nSpecial Thanks - David Levine\n\n\nPowered by Qt, QML, and Box2D"
                }
            }
        }
        }

        Rectangle {
            id: infoPopup

            anchors {
                top: parent.top;
                topMargin: 30
                horizontalCenter: screen.horizontalCenter
            }
            color: "black"
            width: 300
            height: 600
            border.color: "#FF9100"
            border.width: 4
            smooth: true
            radius: 50
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#000000";
                }
                GradientStop {
                    position: 1.00;
                    color: "#000000";
                }
            }
            visible: false
            //clip: true

            // list markup
            ListView {
                id: infoList
                anchors {
                    top: parent.top
                    topMargin: 30
                    horizontalCenter: infoPopup.horizontalCenter
                }

                width: parent.width -10
                height: parent.height - 100
                model: ListModel {ListElement {} }
                delegate: infoDelegate
                clip: true
            }
            Button_NegativeButton {
                id: closeButton
                anchors {
                    bottom: infoPopup.bottom;
                    bottomMargin: 10
                    horizontalCenter: infoList.horizontalCenter
                }
                text: "Close Info"

                onClicked: infoPopup.visible = false;
            }

            //mode Scroll Bar
            ScrollBar {
                id: listScrollBar
                scrollArea: infoList
                height: infoList.height
                width: 10
                anchors.right: infoPopup.right
                anchors.rightMargin: 2
                anchors.top: infoList.top
            }

        }
    }
