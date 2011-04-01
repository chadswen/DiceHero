import QtQuick 1.0
import "holdingDice.js" as VarHold
import "scoringRules.js" as Scoring

Rectangle {
    signal showScreen(string msg)

        id: screenBase

        width: 360; height: 640

        Component.onCompleted: {
            var tempSaved = saved;
            var tempResults = rollResults;
            var i;
            var j=0;
            for(i = 0; i<5; i++)
            {
                if(tempResults[1][i]!= null){
                    while(j<5){
                        if(tempSaved[j] == null){
                            tempSaved[j] = tempResults[1][i];
                            console.log("tempSaved["+j+"] = " + tempSaved[j]);
                            break;
                        }
                        j++;
                    }
                }
            }
            Scoring.BubbleSort(tempSaved);
            saved = tempSaved;
            var tempScores = scoreFields;
            Scoring.initializeText(tempScores);
            Scoring.enableButtons(tempScores);
            scoreFields = tempScores;
            rolls--;
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

                    TwoStateButton {
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
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp2 = saved;
                            var temp = Scoring.count(1, temp2);
                            onescore.text = temp;
                            topscore.text = (Number(topscore.text) + temp);
                            totalscore.text = (Number(totalscore.text) + temp);
                            if(bonusscore.text == "0")
                            {
                                Scoring.bonusCheck(temp2);
                            }
                            saved = temp2;
                        }
                    }

                    TwoStateButton {
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
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp2 = saved;
                            var temp = Scoring.count(2, temp2);
                            twoscore.text = temp;
                            topscore.text = (Number(topscore.text) + temp);
                            totalscore.text = (Number(totalscore.text) + temp);
                            if(bonusscore.text == "0")
                            {
                                Scoring.bonusCheck();
                            }
                            saved = temp2;
                        }
                    }

                    TwoStateButton {
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
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp2 = saved;
                            var temp = Scoring.count(3, temp2);
                            threescore.text = temp;
                            topscore.text = (Number(topscore.text) + temp);
                            totalscore.text = (Number(totalscore.text) + temp);
                            if(bonusscore.text == "0")
                            {
                                Scoring.bonusCheck(temp2);
                            }
                            saved = temp2;
                        }
                    }

                    TwoStateButton {
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
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp2 = saved;
                            var temp = Scoring.count(4, temp2);
                            fourscore.text = temp;
                            topscore.text = (Number(topscore.text) + temp);
                            totalscore.text = (Number(totalscore.text) + temp);
                            if(bonusscore.text == "0")
                            {
                                Scoring.bonusCheck(temp2);
                            }
                            saved = temp2;
                        }
                    }

                    TwoStateButton {
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
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp2 = saved;
                            var temp = Scoring.count(5, temp2);
                            fivescore.text = temp;
                            topscore.text = (Number(topscore.text) + temp);
                            totalscore.text = (Number(totalscore.text) + temp);
                            if(bonusscore.text == "0")
                            {
                                Scoring.bonusCheck(temp2);
                            }
                            saved = temp2;
                        }
                    }

                    TwoStateButton {
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
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp2 = saved;
                            var temp = Scoring.count(6, temp2);
                            sixscore.text = temp;
                            topscore.text = (Number(topscore.text) + temp);
                            totalscore.text = (Number(totalscore.text) + temp);
                            if(bonusscore.text == "0")
                            {
                                Scoring.bonusCheck(temp2);
                            }
                            saved = temp2;
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

                    TwoStateButton {
                        id: threeofkind
                        x: 80
                        y: 241
                        width: 55
                        height: 55
                        color: "#ffffff"
                        text: ""
                        onClicked: {
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp = saved;
                            var temp2 = Scoring.ThreeofKind(temp);
                            threeofkindscore.text = temp2;
                            totalscore.text = (Number(totalscore.text) + temp2);
                            saved = temp;
                        }
                    }

                    TwoStateButton {
                        id: fourofkind
                        x: 80
                        y: 310
                        width: 55
                        height: 55
                        color: "#ffffff"
                        text: ""
                        onClicked: {
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp = saved;
                            var temp2 = Scoring.FourofKind(temp);
                            fourofkindscore.text = temp2;
                            totalscore.text = (Number(totalscore.text) + temp2);
                            saved = temp;
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

                    TwoStateButton {
                        id: chance
                        x: 80
                        y: 379
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp = saved;
                            var temp2 = Scoring.sum(temp)
                            chancescore.text = temp2;
                            totalscore.text = (Number(totalscore.text) + temp2);
                            saved = temp;
                        }
                    }

                    TwoStateButton {
                        id: fullhouse
                        x: 216
                        y: 241
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp = saved;
                            var temp2 = Scoring.FullHouse(temp)
                            fullhousescore.text = temp2;
                            totalscore.text = (Number(totalscore.text) + temp2);
                            saved = temp;
                        }
                    }

                    TwoStateButton {
                        id: smallstraight
                        x: 216
                        y: 310
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp = saved;
                            var temp2 = Scoring.SmallStraight(temp);
                            smallstraightscore.text = temp2;
                            totalscore.text = (Number(totalscore.text) + temp2);
                            saved = temp;
                        }
                    }

                    TwoStateButton {
                        id: largestraight
                        x: 215
                        y: 378
                        width: 55
                        height: 55
                        text: ""
                        onClicked: {
                            Scoring.disableButtons();
                            opacity = .6;
                            var temp = saved;
                            var temp2 = Scoring.LargeStraight(temp);
                            largestraightscore.text = temp2;
                            totalscore.text = (Number(totalscore.text) + temp2);
                            saved = temp;
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
                        x: 204
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

                    TwoStateButton {
                        id: motherload
                        x: 75
                        y: 443
                        width: 65
                        height: 65
                        text: ""
                        onClicked: {
                            var temp = saved;
                            if(motherload1.text == "--")
                            {
                                var temp = saved;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload1.text = temp2;
                                totalscore.text = (Number(totalscore.text) + temp2);
                                saved = temp;
                                rolls++
                                if(motherload1.text == "0")
                                {
                                    motherload.Scoring.disableButtons();
                                    motherload.opacity = .6;
                                }
                            }
                            else if(motherload2.text == "--" && motherload1.text != "0")
                            {
                                var temp = saved;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload1.text = temp2;
                                totalscore.text = (Number(totalscore.text) + temp2);
                                saved = temp;
                                rolls++;
                                if(motherload2.text == "0")
                                {
                                    motherload.Scoring.disableButtons();
                                    motherload.opacity = .6;
                                }
                            }
                            else if(motherload3.text == "--" && motherload1.text != "0" && motherload2.text != "0")
                            {
                                var temp = saved;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload1.text = temp2;
                                totalscore.text = (Number(totalscore.text) + temp2);
                                saved = temp;
                                motherload.Scoring.disableButtons();
                                motherload.opacity = .6;
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
                        text: "0"
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
                        x: 80
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
                                saved[0];
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
                                saved[1];
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
                                saved[2];
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
                                saved[3];
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
                                saved[4];
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
                    var tempScores = scoreFields;
                    VarHold.motherloadDice(temp);
                    Scoring.saveText(tempScores);
                    myDice = temp;
                    scoreFields = tempScores;
                    returnFile="RerollSelection.qml", showScreen("engine.qml");
                }
        }
}
