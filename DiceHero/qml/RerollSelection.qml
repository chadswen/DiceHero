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
                x: 0
                y: 0
                anchors.rightMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                    anchors.fill: parent
                    source: "board.png"

                    Text {
                        id: text1
                        x: 59
                        y: 255
                        width: 80
                        height: 20
                        text: "Select Dice You Want to Reroll."
                        font.pixelSize: 18
                    }
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
                text: {
                         if(rollResults[1][0] < 1)
                         {
                             saved[4]
                         }
                         else
                         {
                             rollResults[1][0];
                         }
                }
                anchors.topMargin: 17
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die1Click(temp);
                    dieClicks = temp;
                    console.log("Clicks on die 1: "+dieClicks[0]);
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
                text: {
                    if(rollResults[1][1] < 1)
                    {
                        saved[3];
                    }
                    else
                    {
                        rollResults[1][1];
                    }
                }
                anchors.leftMargin: 26
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die2Click(temp);
                    dieClicks = temp;
                    console.log("Clicks on die 2: "+dieClicks[1]);
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
                text: {
                    if(rollResults[1][2] < 1)
                    {
                        saved[2];
                    }
                    else
                    {
                        rollResults[1][2];
                    }
                }
                anchors.leftMargin: 26
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die3Click(temp);
                    dieClicks = temp;
                    console.log("Clicks on die 3: "+dieClicks[2]);
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
                text: {
                    if(rollResults[1][3] < 1)
                    {
                        saved[1];
                    }
                    else
                    {
                        rollResults[1][3];
                    }
                }
                anchors.leftMargin: 61
                anchors.topMargin: 17
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die4Click(temp);
                    dieClicks = temp;
                    console.log("Clicks on die 4: "+dieClicks[3]);
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
                text: {
                    if(rollResults[1][4] < 1)
                    {
                        saved[0];
                    }
                    else
                    {
                        rollResults[1][4];
                    }
                }
                anchors.leftMargin: 34
                anchors.topMargin: 17
                onClicked: {
                    var temp = dieClicks;
                    VarHold.die5Click(temp);
                    dieClicks = temp;
                    console.log("Clicks on die 5: "+dieClicks[4]);
                }
            }

            Button {
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
                    var temp3 = rollResults;
                    var temp4 = saved;
                    VarHold.finalize(temp, temp2, temp3, temp4);
                    myDice = temp;
                    dieClicks = temp2;
                    rollResults = temp3;
                    saved = temp4;
                    returnFile="RerollSelection.qml"
                    screenBase.showScreen("engine.qml")
                }
        }
}
