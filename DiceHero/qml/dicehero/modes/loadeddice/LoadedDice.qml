import QtQuick 1.0
import "../../common"
import "../../common/createDice.js" as Creator
import "../motherload/holdingDice.js" as VarHold
import "loadedDice.js" as SRules
import Qt.labs.particles 1.0
Rectangle {
    id: screenBase
    signal showScreen(string msg)
    property variant resArray
    property variant colors: [color_RED, color_BLUE, color_ORANGE, "#CCCCCC", color_GREEN]
    property string topcolor: colors[2] // We will be randomly picking a color for the top rectangle

    width: 360; height: 640


    Component.onCompleted: {
        //create one of each die
        var y;
        var z;
        turnCount = turnCount + 1;

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
            property string bgString: "../../images/backgrounds/"
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
                id: loadedMessage
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
                    if(temp_string!=null)
                        return temp_string;
                    else
                        return "";
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
            id: loadedTitle
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
                if(temp_string!=null)
                    return temp_string;
                else
                    return "";
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
                enabled: !notice.visible
                onClicked: {
                    var temp = myDice
                    Creator.clearData(temp);
                    VarHold.loadeddice(temp);
                    myDice = temp;
                    returnFile="modes/loadeddice/LoadedDice.qml", screenBase.showScreen("engine/engine.qml");
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
                enabled: !notice.visible
                onClicked: {
                    main.clearAll();
                    screenBase.showScreen("modes/gameSelection.qml");
                }
            }
        }

        Rectangle {
            id: notice
            visible: (instruct || SRules.checkForNotice(turnCount))
            anchors.centerIn: parent
            color: "black"
            opacity: .95
            width: 350
            height: 630
            border.color: color_BLUE
            border.width: 4
            smooth: true
            radius: 20

            Text {
                id: noticeText
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

                text: {
                    if(instruct)
                        return SRules.showNotice("instructions");
                    else
                        if(SRules.checkForNotice(turnCount))
                            return SRules.showNotice("notice");
                         else return ""

                }
                font.pixelSize: 22
                color: color_BLUE
                style: Text.Raised
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
                wrapMode: Text.WordWrap
            }

            Button_StandardButton {
                id: okButton
                anchors {
                    bottom: parent.bottom
                    bottomMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }
                text: {"OK"}
                onClicked: {
                    instruct = false;
                    turnCount = 1;
                }
            }
        }

    }
}
