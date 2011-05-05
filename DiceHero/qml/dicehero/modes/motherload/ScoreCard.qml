import QtQuick 1.0
import "../../common"
import "holdingDice.js" as VarHold
import "scoringRules.js" as Scoring

Rectangle {
    signal showScreen(string msg)

        id: screenBase

        width: screenWidth; height: screenHeight

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
            Scoring.disableButtons();
            Scoring.enableButtons(tempScores);
            scoreFields = tempScores;
            rolls--;
            if(rolls == 0)
            {
                finalize.enabled = false;
                finalize.visible = false;
                finishGame.enabled = true;
                finishGame.visible = true;
            }
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
                    property string bgString: "../../images/backgrounds/"
                    property string bgStringComplete: bgString+myBackground
                    source: bgStringComplete

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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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

                    Rectangle{
                        id: threeholder
                        x:140
                        y:257
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: threeofkindscore
                        color: "white"
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.centerIn: threeholder
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
                            var temp = saved;
                            var temp2 = Scoring.FourofKind(temp);
                            fourofkindscore.text = temp2;
                            totalscore.text = (Number(totalscore.text) + temp2);
                            saved = temp;
                        }
                    }

                    Rectangle{
                        id: fourholder
                        x:140
                        y:320
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: fourofkindscore
                        color: "white"
                        text: "--"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.centerIn: fourholder
                        font.bold: false
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: fullHouseholder
                        x:275
                        y:257
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: fullhousescore
                        text: "--"
                        font.pixelSize: 20
                        color: "white"
                        anchors.centerIn: fullHouseholder
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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
                            finalize.enabled = true;
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

                    Rectangle{
                        id: smallholder
                        x:275
                        y:320
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: smallstraightscore
                        text: "--"
                        color: "white"
                        anchors.centerIn: smallholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: chanceholder
                        x:140
                        y:394
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: chancescore
                        text: "--"
                        color: "white"
                        anchors.centerIn: chanceholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                        font.bold: false
                    }

                    Rectangle{
                        id: largeholder
                        x:275
                        y:394
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: largestraightscore
                        text: "--"
                        color: "white"
                        anchors.centerIn: largeholder
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

                                if(motherload1.text == "0")
                                {
                                    Scoring.disableButtons();
                                    motherload.opacity = .6;
                                    finalize.enabled = true;
                                }
                                else
                                {
                                    rolls++    //user gets extra roll to make another motherload.
                                    Scoring.disableButtons();
                                    motherload.opacity = .6;
                                    finalize.enabled = true;
                                }
                            }
                            else if(motherload2.text == "--" && motherload1.text != "0")
                            {
                                var temp = saved;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload2.text = temp2;
                                totalscore.text = (Number(totalscore.text) + temp2);
                                saved = temp;
                                if(motherload2.text == "0")
                                {
                                    Scoring.disableButtons();
                                    motherload.opacity = .6;
                                    finalize.enabled = true;
                                }
                                else
                                {
                                    rolls++ //user gets extra roll to make another motherload.
                                    Scoring.disableButtons();
                                    motherload.opacity = .6;
                                    finalize.enabled = true;
                                }
                            }
                            else if(motherload3.text == "--" && motherload1.text != "0" && motherload2.text != "0")
                            {
                                var temp = saved;
                                var temp2 = Scoring.FiveofKind(temp);
                                motherload3.text = temp2;
                                totalscore.text = (Number(totalscore.text) + temp2);
                                saved = temp;
                                Scoring.disableButtons();
                                motherload.opacity = .6;
                                finalize.enabled = true;
                            }
                        }
                    }

                    Rectangle{
                        id: motherloadholder1
                        x:142
                        y:463
                        width: 50
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: motherload1
                        text: "--"
                        color: "white"
                        anchors.centerIn: motherloadholder1
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: motherloadholder2
                        x:204
                        y:463
                        width: 50
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: motherload2
                        text: "--"
                        color: "white"
                        anchors.centerIn: motherloadholder2
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: motherloadholder3
                        x:268
                        y:463
                        width: 50
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: motherload3
                        text: "--"
                        color: "white"
                        anchors.centerIn: motherloadholder3
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: totaltextholder
                        x:70
                        y:520
                        width: 60
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: text27
                        text: "Total:"
                        color: "white"
                        anchors.centerIn: totaltextholder
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: bonusholder
                        x:295
                        y:207
                        width: 50
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: bonusscore
                        text: "0"
                        color: "white"
                        horizontalAlignment: Text.AlignHCenter
                        anchors.centerIn: bonusholder
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: totalholder
                        x:142
                        y:520
                        width: 65
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: totalscore
                        text: "0"
                        color: "white"
                        anchors.centerIn: totalholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: topholder
                        x:20
                        y:207
                        width: 110
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: text30
                        text: "Top Section:"
                        color: "white"
                        anchors.centerIn: topholder
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: toptextholder
                        x:140
                        y:207
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: topscore
                        text: "0"
                        color: "white"
                        anchors.centerIn: toptextholder
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

                    Rectangle{
                        id: dicetextholder
                        x:10
                        y:590
                        width: 40
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: text34
                        text: "Dice:"
                        color: "white"
                        anchors.centerIn: dicetextholder
                        font.bold: true
                        font.pixelSize: 16
                    }

                    Rectangle{
                        id: scoretextholder
                        anchors.horizontalCenter: parent.horizontalCenter
                        y:7
                        width: 80
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: text1
                        text: "Scores"
                        color: "white"
                        anchors.centerIn: scoretextholder
                        font.bold: true
                        font.pixelSize: 22
                    }

                    Rectangle{
                        id: threesholder
                        x:268
                        y:90
                        width: 80
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: threescore
                        text: "--"
                        color: "white"
                        anchors.centerIn: threesholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: fiveholder
                        x:142
                        y:173
                        width: 80
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: fivescore
                        text: "--"
                        color: "white"
                        anchors.centerIn: fiveholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: twoholder
                        x:140
                        y:90
                        width: 80
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: twoscore
                        text: "--"
                        color: "white"
                        anchors.centerIn: twoholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: oneholder
                        x:4
                        y:90
                        width: 80
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: onescore
                        text: "--"
                        color: "white"
                        anchors.centerIn: oneholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: sixholder
                        x:268
                        y:173
                        width: 80
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: sixscore
                        text: "--"
                        color: "white"
                        anchors.centerIn: sixholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: foursholder
                        x:5
                        y:173
                        width: 80
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        id: fourscore
                        text: "--"
                        color: "white"
                        anchors.centerIn: foursholder
                        horizontalAlignment: Text.AlignHCenter
                        font.pixelSize: 20
                    }

                    Rectangle{
                        id: bonustextholder
                        x:215
                        y:207
                        width: 70
                        height: 25
                        border.color:  "#CCCCCC"
                        color: "black"
                        border.width:  3
                    }

                    Text {
                        text: "Bonus:"
                        color: "white"
                        anchors.centerIn: bonustextholder
                        font.pixelSize: 20
                    }

                    Rectangle {
                        id: die1
                        x: 57
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"
                    }
                        Text {
                            id: text35
                            x: 76
                            y: 587
                            width: 80
                            height: 20
                            text: saved[0]
                            font.pixelSize: 20
                        }


                    Rectangle {
                        id: die2
                        x: 117
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"
                    }
                        Text {
                            id: text36
                            x: 137
                            y: 587
                            width: 80
                            height: 20
                            text: saved[1]
                            font.pixelSize: 20
                        }


                    Rectangle {
                        id: die3
                        x: 176
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"
                    }
                        Text {
                            id: text37
                            x: 196
                            y: 587
                            width: 80
                            height: 20
                            text: saved[2]
                            font.pixelSize: 20
                        }


                    Rectangle {
                        id: die4
                        x: 237
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"
                    }
                        Text {
                            id: text38
                            x: 257
                            y: 587
                            width: 80
                            height: 20
                            text: saved[3]
                            font.pixelSize: 20
                        }


                    Rectangle {
                        id: die5
                        x: 301
                        y: 573
                        width: 50
                        height: 50
                        color: "#ffffff"
                    }
                        Text {
                            id: text39
                            x: 322
                            y: 587
                            width: 80
                            height: 20
                            text: saved[4]
                            font.pixelSize: 20
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

            Button_AffirmativeButton {
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
                    var tempSaved = saved;
                    var temp = myDice;
                    var tempScores = scoreFields;
                    VarHold.motherloadDice(temp);
                    Scoring.saveText(tempScores);
                    Scoring.clearSaved(tempSaved);
                    myDice = temp;
                    scoreFields = tempScores;
                    saved = tempSaved;
                    returnFile="modes/motherload/RerollSelection.qml", showScreen("engine/engine.qml");
                }
        }
        Button {
                id: finishGame
                x: 214
                y: 515
                width: 103
                height: 35
                anchors {
                    bottom: screen.bottom
                    horizontalCenter: screen.horizontalCenter
                }
                text: "Finish"
                enabled: false
                visible: false
                anchors.horizontalCenterOffset: 86
                anchors.bottomMargin: 90
                onClicked: {
                    var tempSaved = saved;
                    var temp = myDice;
                    var tempScores = scoreFields;
                    VarHold.motherloadDice(temp);
                    Scoring.saveText(tempScores);
                    Scoring.clearSaved(tempSaved);
                    myDice = temp;
                    scoreFields = tempScores;
                    saved = tempSaved;
                    showScreen("modes/motherload/TotalScreen.qml");
                }
        }
}
