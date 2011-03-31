import QtQuick 1.0
import "holdingDice.js" as VarHold
import "scoringRules.js" as Scoring

Rectangle {
    signal showScreen(string msg)

        id: screenBase

        width: 360; height: 640

        Component.onCompleted: {

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
                id: image1
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
                        x: 143
                        y: 7
                        width: 80
                        height: 20
                        text: "Scores"
                        font.bold: true
                        font.pixelSize: 22
                    }

                    Text {
                        id: threescore
                        x: 268
                        y: 86
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: fivescore
                        x: 142
                        y: 173
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: twoscore
                        x: 142
                        y: 86
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: onescore
                        x: 4
                        y: 86
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: sixscore
                        x: 268
                        y: 173
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: fourscore
                        x: 4
                        y: 173
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: text8
                        x: 215
                        y: 207
                        width: 80
                        height: 20
                        text: "Bonus:"
                        font.pixelSize: 20
                    }

                    GrayOutButton {
                        id: ones
                        x: 18
                        y: 36
                        width: 50
                        height: 50
                        color: "#ffffff"
                        text: ""
                        Text{
                            id: text9
                            x: 18
                            y: 11
                            width: 80
                            height: 20
                            text: "1"
                            font.bold: true
                            font.pixelSize: 24
                        }
                        onClicked: {
                            var temp2 = finalRoll;
                            var temp = Scoring.count(1, temp2);
                            topscore.text = topscore.text.valueOf() + temp;
                            totalscore.text = totalscore.text.valueOf() + temp;
                            finalRoll = temp2;
                        }
                    }

                    GrayOutButton {
                        id: twos
                        x: 156
                        y: 35
                        width: 50
                        height: 50
                        color: "#ffffff"
                        text: ""
                        Text{
                            id: text10
                            x: 18
                            y: 11
                            width: 80
                            height: 20
                            text: "2"
                            font.bold: true
                            font.pixelSize: 24
                        }
                        onClicked: {
                            var temp2 = finalRoll;
                            var temp = Scoring.count(2, temp2);
                            topscore.text = topscore.text.valueOf() + temp;
                            totalscore.text = totalscore.text.valueOf() + temp;
                            finalRoll = temp2;
                        }
                    }

                    GrayOutButton {
                        id: threes
                        x: 282
                        y: 36
                        width: 50
                        height: 50
                        color: "#ffffff"
                        text: ""
                        Text{
                            id: text11
                            x: 18
                            y: 11
                            width: 80
                            height: 20
                            text: "3"
                            font.bold: true
                            font.pixelSize: 24
                        }
                        onClicked: {
                            var temp2 = finalRoll;
                            var temp = Scoring.count(3, temp2);
                            topscore.text = topscore.text.valueOf() + temp;
                            totalscore.text = totalscore.text.valueOf() + temp;
                            finalRoll = temp2;
                        }
                    }

                    GrayOutButton {
                        id: fours
                        x: 18
                        y: 120
                        width: 50
                        height: 50
                        color: "#ffffff"
                        text: ""
                        Text{
                            id: text12
                            x: 18
                            y: 11
                            width: 80
                            height: 20
                            text: "4"
                            font.bold: true
                            font.pixelSize: 24
                        }
                        onClicked: {
                            var temp2 = finalRoll;
                            var temp = Scoring.count(4, temp2);
                            topscore.text = topscore.text.valueOf() + temp;
                            totalscore.text = totalscore.text.valueOf() + temp;
                            finalRoll = temp2;
                        }
                    }

                    GrayOutButton {
                        id: fives
                        x: 156
                        y: 120
                        width: 50
                        height: 50
                        color: "#ffffff"
                        text: ""
                        Text{
                            id: text13
                            x: 18
                            y: 11
                            width: 80
                            height: 20
                            text: "5"
                            font.bold: true
                            font.pixelSize: 24
                        }
                        onClicked: {
                            var temp2 = finalRoll;
                            var temp = Scoring.count(5, temp2);
                            topscore.text = topscore.text.valueOf() + temp;
                            totalscore.text = totalscore.text.valueOf() + temp;
                            finalRoll = temp2;
                        }
                    }

                    GrayOutButton {
                        id: sixes
                        x: 282
                        y: 120
                        width: 50
                        height: 50
                        color: "#ffffff"
                        text: ""
                        Text{
                            id: text14
                            x: 18
                            y: 11
                            width: 80
                            height: 20
                            text: "6"
                            font.bold: true
                            font.pixelSize: 24
                        }
                        onClicked: {
                            var temp2 = finalRoll;
                            var temp = Scoring.count(6, temp2);
                            topscore.text = topscore.text.valueOf() + temp;
                            totalscore.text = totalscore.text.valueOf() + temp;
                            finalRoll = temp2;
                        }
                    }

                    Text {
                        id: threeofkindscore
                        x: 142
                        y: 257
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    GrayOutButton {
                        id: threeofkind
                        x: 80
                        y: 241
                        width: 55
                        height: 55
                        color: "#ffffff"
                        text: ""
                        onClicked: {
                            var temp = finalRoll;
                            var temp2 = Scoring.ThreeofKind(temp);
                            threeofkindscore.text = temp2;
                            totalscore.text = totalscore.text.valueOf() + temp2;
                            finalRoll = temp;
                        }
                    }

                    GrayOutButton {
                        id: fourofkind
                        x: 80
                        y: 310
                        width: 55
                        height: 55
                        color: "#ffffff"
                        text: ""
                        onClicked: {
                            var temp = finalRoll;
                            var temp2 = Scoring.FourofKind(temp);
                            fourofkindscore.text = temp2;
                            totalscore.text = totalscore.text.valueOf() + temp2;
                            finalRoll = temp;
                        }
                    }

                    Text {
                        id: fourofkindscore
                        x: 142
                        y: 326
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.bold: false
                        font.pixelSize: 20
                    }

                    Text {
                        id: fullhousescore
                        x: 301
                        y: 257
                        width: 80
                        height: 20
                        text: "--"
                        font.pixelSize: 20
                    }

                    GrayOutButton {
                        id: chance
                        x: 80
                        y: 379
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            var temp = finalRoll;
                            var temp2 = Scoring.sum(temp)
                            chancescore.text = temp2;
                            totalscore.text = totalscore.text.valueOf() + temp2;
                            finalRoll = temp;
                        }
                    }

                    GrayOutButton {
                        id: fullhouse
                        x: 216
                        y: 241
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            var temp = finalRoll;
                            var temp2 = Scoring.FullHouse(temp)
                            fullhousescore.text = temp2;
                            totalscore.text = totalscore.text.valueOf() + temp2;
                            finalRoll = temp;
                        }
                    }

                    GrayOutButton {
                        id: smallstraight
                        x: 216
                        y: 310
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            var temp = finalRoll;
                            var temp2 = Scoring.SmallStraight(temp);
                            smallstraightscore.text = temp2;
                            totalscore.text = totalscore.text.valueOf() + temp2;
                            finalRoll = temp;
                        }
                    }

                    GrayOutButton {
                        id: largestraight
                        x: 215
                        y: 378
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            var temp = finalRoll;
                            var temp2 = Scoring.LargeStraight(temp);
                            largestraightscore.text = temp2;
                            totalscore.text = totalscore.text.valueOf() + temp2;
                            finalRoll = temp;
                        }
                    }

                    Text {
                        id: text17
                        x: 203
                        y: 252
                        width: 80
                        height: 20
                        text: "Full" + '\n' + "House"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 14
                    }

                    Text {
                        id: text20
                        x: 203
                        y: 390
                        width: 80
                        height: 20
                        text: "Large" + '\n' + "Straight"
                        font.pixelSize: 13
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Text {
                        id: text21
                        x: 204
                        y: 322
                        width: 80
                        height: 20
                        text: "Small" + '\n' + "Straight"
                        font.pixelSize: 13
                        horizontalAlignment: Text.AlignHCenter
                    }

                    Text {
                        id: smallstraightscore
                        x: 268
                        y: 326
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: chancescore
                        x: 142
                        y: 394
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                        font.bold: false
                    }

                    Text {
                        id: largestraightscore
                        x: 268
                        y: 394
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                        font.bold: false
                    }

                    GrayOutButton {
                        id: motherload
                        x: 75
                        y: 443
                        width: 65
                        height: 65
                        text: ""
                        onClicked: {
                            var temp = finalRoll;
                            if(motherload1.text == "--")
                            {
                                var temp = finalRoll;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload1.text = temp2;
                                totalscore.text = totalscore.text.valueOf() + temp2;
                                finalRoll = temp;
                            }
                            else if(motherload2.text == "--" && motherload1.text != "0")
                            {
                                var temp = finalRoll;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload1.text = temp2;
                                totalscore.text = totalscore.text.valueOf() + temp2;
                                finalRoll = temp;
                            }
                            else if(motherload3.text == "--" && motherload1.text != "0" && motherload2.text != "0")
                            {
                                var temp = finalRoll;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload1.text = temp2;
                                totalscore.text = totalscore.text.valueOf() + temp2;
                                finalRoll = temp;
                            }
                        }
                    }

                    Text {
                        id: motherload1
                        x: 142
                        y: 463
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: motherload2
                        x: 204
                        y: 463
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: motherload3
                        x: 268
                        y: 463
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: text27
                        x: 85
                        y: 522
                        width: 80
                        height: 20
                        text: "Total:"
                        font.pixelSize: 20
                    }

                    Text {
                        id: bonusscore
                        x: 268
                        y: 207
                        width: 80
                        height: 20
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: totalscore
                        x: 142
                        y: 522
                        width: 80
                        height: 20
                        text: "0"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: text30
                        x: 26
                        y: 207
                        width: 80
                        height: 20
                        text: "Top Section:"
                        font.pixelSize: 20
                    }

                    Text {
                        id: topscore
                        x: 142
                        y: 207
                        width: 80
                        height: 20
                        text: "0"
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Text {
                        id: text32
                        x: 79
                        y: 476
                        width: 80
                        height: 20
                        text: "(5 of kind)"
                        font.pixelSize: 12
                    }

                    Text {
                        id: text33
                        x: 77
                        y: 463
                        width: 80
                        height: 20
                        text: "MotherLoad!"
                        font.pixelSize: 11
                    }

                    Text {
                        id: text34
                        x: 10
                        y: 589
                        width: 80
                        height: 20
                        text: "Dice:"
                        font.bold: true
                        font.pixelSize: 16
                    }

                    Rectangle {
                        id: die1
                        x: 57
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"

                        Text {
                            id: text35
                            x: 14
                            y: 18
                            width: 80
                            height: 20
                            text: {
                                finalRoll[0];
                            }
                            font.pixelSize: 12
                        }
                    }

                    Rectangle {
                        id: die2
                        x: 117
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"

                        Text {
                            id: text36
                            x: 14
                            y: 18
                            width: 80
                            height: 20
                            text: {
                                finalRoll[1];
                            }
                            font.pixelSize: 12
                        }
                    }

                    Rectangle {
                        id: die3
                        x: 176
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"

                        Text {
                            id: text37
                            x: 14
                            y: 18
                            width: 80
                            height: 20
                            text: {
                                finalRoll[2];
                            }
                            font.pixelSize: 12
                        }
                    }

                    Rectangle {
                        id: die4
                        x: 237
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"

                        Text {
                            id: text38
                            x: 14
                            y: 18
                            width: 80
                            height: 20
                            text: {
                                finalRoll[3];
                            }
                            font.pixelSize: 12
                        }
                    }

                    Rectangle {
                        id: die5
                        x: 301
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"

                        Text {
                            id: text39
                            x: 14
                            y: 18
                            width: 80
                            height: 20
                            text: {
                                finalRoll[4];
                            }
                            font.pixelSize: 12
                        }
                    }

                    Text {
                        id: text15
                        x: 85
                        y: 397
                        width: 80
                        height: 20
                        text: "Chance"
                        font.pixelSize: 14
                    }

                    Text {
                        id: text16
                        x: 101
                        y: 316
                        width: 80
                        height: 20
                        text: "4"
                        font.bold: true
                        font.pixelSize: 20
                    }

                    Text {
                        id: text18
                        x: 89
                        y: 340
                        width: 80
                        height: 20
                        text: "of Kind"
                        font.pixelSize: 12
                    }

                    Text {
                        id: text19
                        x: 101
                        y: 247
                        width: 80
                        height: 20
                        text: "3"
                        font.bold: true
                        font.pixelSize: 20
                    }

                    Text {
                        id: text22
                        x: 89
                        y: 272
                        width: 80
                        height: 20
                        text: "of Kind"
                        font.pixelSize: 12
                    }
            }
        }

            Button {
                id: finalize
                x: 214
                y: 515
                width: 103
                height: 35
                anchors {
                    bottom: screen.bottom
                    horizontalCenter: screen.horizontalCenter
                }
                text: "Next Roll"
                visible: true
                anchors.horizontalCenterOffset: 86
                anchors.bottomMargin: 90
                onClicked: {
                    var temp = myDice;
                    VarHold.motherloadDice(temp);
                    myDice = temp;
                    returnFile="RerollSelection.qml", screen.showScreen("engine.qml");
                }
        }
}
