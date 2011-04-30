import QtQuick 1.0
import "../common"
import "../common/createDice.js" as Creator
import "motherload/holdingDice.js" as VarHold
import "motherload/scoringRules.js" as SRules
import Qt.labs.particles 1.0
Rectangle {
    signal showScreen(string msg)
    property variant resArray
    property variant colors: [color_RED, color_BLUE, color_ORANGE, "#CCCCCC", color_GREEN]
    property string topcolor: colors[2] // We will be randomly picking a color for the top rectangle

        // Text Instructions

// Notices (Because we're responsible like that)
    property string drinkwater	: "Take a break and drink some water - you can thank us in the morning!"
    property string playresponsibly	: "Please play responsibly. Designate a sober driver, know your limits, and for God's sake don't drop the phone in the toilet!"
    property string nominors	: "Remember, providing alcohol to minors isn't just against the law - it's wrong."
    property string alcoholpoisoning: "Be a Hero - learn to recognize the symptoms of alcohol poisoning:\n1. Extreme confusion\n2. Seizure activity\n3. Weak and slow breathing\n4. Decreased body temperature\n 5. Loss of consciousness.\n\nContact emergency personnel immediately upon suspecting a victim of alcohol poisoning. Help turn the victim on their side in the \"recovery position\" in the event of vomiting."
    property string nodrunktexts	: "Yes, you've been playing for a while. No, it's a terrible idea to text anyone. For real."
    property string nouploadingpics	: "Yes, you've been playing for a while. No, it's a terrible idea to upload pictures of this on the internet. Your grandma might see."
    property string protip	: "Grab a snack, buddy. And have you ever thought about maybe playing Loaded Dice with an assortment of craft beers? It's an easy, interesting, and tasty twist!"
    property variant notices: [drinkwater, playresponsibly, nominors, alcoholpoisoning, nodrunktexts, nouploadingpics, protip];
    id: screenBase

    width: 360; height: 640


    Component.onCompleted: {
        //create one of each die
        var y;
        var z;


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
            property string bgString: "../images/backgrounds/"
            property string bgStringComplete: bgString+myBackground
            source: bgStringComplete
        }




        Rectangle {
            id: topRect
            x: 25
            y: 149

            anchors {
                top: screen.top;
                topMargin: 130
                bottomMargin: 150
                left: parent.left
                leftMargin: 25
            }
            color: "black"
            opacity: 0.9
            width: 150
            height: 400
            border.color: color_GREEN
            border.width: 4
            smooth: true
            radius: 20
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: p2Text
            font.bold: false
            smooth: true
            width: parent.width - 40

            anchors {
                top: parent.top;
                topMargin: 30
                bottomMargin: 20
                left: parent.left
                leftMargin: 20
            }

            text:{
                var temp = rollResults;
                var sum = VarHold.loadedSum(temp);
                rollResults = temp;
                var temp_string = SRules.loadedDiceText(sum);
                return temp_string;
            }
            font.pixelSize: 36
            color: color_JADE
            style: Text.Raised
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
         }
        }


        Rectangle {
            id: topRectBorder
            height: 70; width: 300
            border.color: color_ORANGE
            color: "black"
            border.width:  5
            opacity: .9
            radius: 10
            anchors {
                top: parent.top
                topMargin:20
                horizontalCenter:topRect.horizontalCenter
            }
        }

        Text {
            id: p1Text
            font.bold: true
            smooth: true
            text:{
                var temp = rollResults;
                var sum = VarHold.loadedSum(temp);
                rollResults = temp;
                var temp_string = SRules.loadedDice(sum);
                // TODO: Randomly assign a color to this rectangle's
                //       border and text.
                //topcolor = colors[Math.random(0, colors.length)];
                return temp_string;
            }
            font.pixelSize: 26
            color: topcolor
            style: Text.Outline
            anchors.centerIn: topRectBorder
        }


        Item {
            id: bottomBar
            x: 1
            y: -22
            width: parent.width; height: parent.height
            anchors.horizontalCenterOffset: 1
            anchors{
                bottom: parent.bottom
                bottomMargin: 22
                horizontalCenter: parent.horizontalCenter
            }

            Button_AffirmativeButton {
                id: finalize
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.rightMargin:10
                anchors.leftMargin:30
                text: {"Next Turn"}
                onClicked: {
                    Creator.clearData(myDice);
                    VarHold.loadeddice(myDice);
                    returnFile="modes/LoadedDice.qml", screenBase.showScreen("engine/engine.qml")
                }
                }
                Button_NegativeButton {
                    id: returnButton
                    text: "Back to Modes"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.horizontalCenter
                    anchors.right: parent.right
                    anchors.rightMargin:30
                    anchors.leftMargin:10
                    onClicked: {
                        main.clearAll();
                        screenBase.showScreen("modes/gameSelection.qml");
                    }
                }
            }
        }
    }
