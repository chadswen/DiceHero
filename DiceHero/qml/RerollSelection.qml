import QtQuick 1.0
import "createDice.js" as Script
import "holdingDice.js" as VarHold

Rectangle {
    signal showScreen(string msg)

        id: screenBase

        width: 360; height: 640

        Component.onCompleted: {
            var temp = myDice;
            var temp2 = dieClicks;
            Script.clearData(temp);
            VarHold.clearData(temp2);
            myDice = temp;
            dieClicks = temp2;
        }

        SystemPalette {
            id: activePalette
        }

        Item {
            id: screen
            width: parent.width; height: parent.height
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: parent.left
                right: parent.right
            }

            Image {
                    anchors.fill: parent
                    source: "wood.jpg"
            }
        }

            TwoStateButton {
                id: selectDie1
                x: 1
                y: 17
                width: 100
                height: 100
                anchors {
                    top: parent.top
                }
                text: "Die1"
                anchors.topMargin: 17
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die1Click(temp);
                    dieClicks = temp;
                }
            }

            TwoStateButton {
                id: selectDie2
                x: 130
                y: 17
                width: 100
                height: 100
                anchors {
                    left: selectDie1.right
                }
                text: "Die2"
                anchors.leftMargin: 26
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die2Click(temp);
                    dieClicks = temp;
                }
            }

            TwoStateButton {
                id: selectDie3
                x: 257
                y: 17
                width: 102
                height: 100
                anchors {
                    left: selectDie2.right
                }
                text: "Die3"
                anchors.leftMargin: 26
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die3Click(temp);
                    dieClicks = temp;
               }
            }

            TwoStateButton {
                id: selectDie4
                x: 61
                y: 134
                width: 100
                height: 100
                anchors {
                    left: parent.left
                    top: selectDie1.bottom
                }
                text: "Die4"
                anchors.leftMargin: 61
                anchors.topMargin: 17
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die4Click(temp);
                    dieClicks = temp;
                }
            }

            TwoStateButton {
                id: selectDie5
                x: 187
                y: 134
                width: 100
                height: 100
                anchors {
                    left: selectDie4.right
                    top: selectDie2.bottom
                }
                text: "Die5"
                anchors.leftMargin: 34
                anchors.topMargin: 17
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die5Click(temp);
                    console.log("Clicks on dice "+5+": "+dieClicks[4]);
                    dieClicks = temp;
                }
            }

            TwoStateButton {
                id: finalize
                x: 105
                y: 567
                anchors {
                    bottom: screen.bottom
                    horizontalCenter: screen.horizontalCenter
                }
                text: "Reroll Dice"
                anchors.horizontalCenterOffset: 0
                anchors.bottomMargin: 40
                onClicked: {
                    var temp = myDice;
                    var temp2 = dieClicks;
                    VarHold.finalize(temp, temp2);
                    myDice = temp;
                    dieClicks = temp2;
                    returnFile="RerollSelection.qml"
                    screenBase.showScreen("engine.qml")
                }
        }
}
