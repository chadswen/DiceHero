import QtQuick 1.0
import "../common"
import "../common/createDice.js" as Creator
import "motherload/holdingDice.js" as VarHold
import "motherload/scoringRules.js" as SRules
import Qt.labs.particles 1.0
Rectangle {
    signal showScreen(string msg)
    property variant resArray

        // Text Instructions

// Notices (Because we're responsible like that)
    property string drinkwater	: "Take a break and drink some water - you can thank us in the morning!"
    property string playresponsibly	: "Please play responsibly. Designate a sober driver, know your limits, and for God's sake don't drop the phone in the toilet!"
    property string nominors	: "Remember, providing alcohol to minors isn't just against the law - it's wrong."
    property string alcoholpoisoning: "Be a Hero - learn to recognize the symptoms of alcohol poisoning:\n1. Extreme confusion\n2. Seizure activity\n3. Weak and slow breathing\n4. Decreased body temperature\n 5. Loss of consciousness.\n\nContact emergency personnel immediately upon suspecting a victim of alcohol poisoning. Help turn the victim on their side in the \"recovery position\" in the event of vomiting."
    property string nodrunktexts	: "Yes, you've been playing for a while. No, it's a terrible idea to text anyone. For real."
    property string nouploadingpics	: "Yes, you've been playing for a while. No, it's a terrible idea to upload pictures of this on the internet. Your grandma might see."
    property string proptip	: "Grab a snack, buddy. And have you ever thought about maybe playing Loaded Dice with an assortment of craft beers? It's an easy, interesting, and tasty twist!"

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
                topMargin: 149
                bottomMargin: 150
                left: parent.left
                leftMargin: 25
            }
            color: "black"
            width: 150
            height: 250
            border.color: "#CCCCCC"
            border.width: 4
            smooth: true
            radius: 50
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: p2Text
            font.bold: false
            smooth: true

            text:{
                var temp = rollResults;
                var sum = VarHold.loadedSum(temp);
                rollResults = temp;
                var     temp_string = SRules.loadedDiceText(sum);
                return temp_string;
            }
            font.pixelSize: 20
            color: "#CCCCCC"
            style: Text.Raised
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.WordWrap
            anchors.centerIn: topRect.horizontalCenter
         }
        }


        Rectangle {
            id: topRectBorder
            height: 70; width: 150
            border.color:  "#CCCCCC"
            color: "black"
            border.width:  4
            opacity: .7
            radius: 10
            anchors {
                top: parent.top
                topMargin:20
                horizontalCenter:topRect.horizontalCenter
            }
        }

        Text {
            id: p1Text
            font.bold: false
            smooth: true

            text:{
                var temp = rollResults;
                var sum = VarHold.loadedSum(temp);
                rollResults = temp;
                var     temp_string = SRules.loadedDice(sum);
                return temp_string;
            }
            font.pixelSize: 20
            color: "#CCCCCC"
            style: Text.Raised
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

            Button {
                id: finalize
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.rightMargin:10
                anchors.leftMargin:30
                text: {"Start Over"}
                onClicked: {
                    var temp = myDice;
                    Creator.clearData(temp);
                    VarHold.loadeddice(temp);
                    myDice = temp;
                    returnFile="modes/LoadedDice.qml", screenBase.showScreen("engine/engine.qml")
                }
                }
                Button {
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
