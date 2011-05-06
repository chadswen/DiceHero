import QtQuick 1.0
import "../common/backgroundHolder.js" as Script

Rectangle {

    signal showScreen(string msg)

    property string currentlySelected: myBackground

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
        id: radiusRect
        anchors {
            top: screen.top;
            topMargin: 50
            horizontalCenter: parent.horizontalCenter
        }
        color: "black"
        width: 350
        height: 520
        border.color: "#336633"
        border.width: 4
        smooth: true
        radius: 50

        Text {
            id: titleText
            anchors {
                top: parent.top
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
            font.bold: false
            smooth: true
            font.family: "Arial"
            font.pixelSize: 38
            color: "#FF9933"
            wrapMode: Text.WordWrap
            style: Text.Raised
            text: "Settings"
        }

        Text {
            id: instructionText
            anchors {
                top: titleText.bottom;
                topMargin: 12
                horizontalCenter: parent.horizontalCenter
            }
            font.bold: false
            smooth: true
            font.family: "Arial"
            font.pixelSize: 15
            color: "#AAAAAA"
            wrapMode: Text.WordWrap
            style: Text.Raised
            text: "Select a background and proceed."
        }
    }

    GridView {
        id:bgGrid
        anchors {
            top: radiusRect.top
            topMargin: 120
            left: radiusRect.left
            leftMargin: 25
            right: radiusRect.right
            rightMargin: 25
            bottom:radiusRect.bottom
            bottomMargin: 120
        }
        cellWidth: 100
        cellHeight: 130
        delegate: bgDelegate
        interactive: false
        model: bgModel
    }


    Component{
        id: bgDelegate
        MouseArea {
            id: bgMouse
            property string name : bgFileName
            height:100
            width:100

            onClicked: {
                screen.currentlySelected = bgFileName;
            }
            Image {
                id: bgImage
                anchors.fill: parent
                source: bgSource
                opacity: (screen.currentlySelected == bgFileName) ? .5 : 1
            }
            Text {
                anchors.top: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: bgText
                color: (screen.currentlySelected == bgFileName) ? "#008000" :"#AAAAAA"
            }
        }
    }

    ListModel {
        id: bgModel
        ListElement {
            bgFileName: "greenfelt.jpg"
            bgSource: "../images/backgrounds/greenfelt.jpg"
            bgText: "Green Felt"
        }
        ListElement {
            bgFileName: "brick.jpg"
            bgSource: "../images/backgrounds/brick.jpg"
            bgText: "Brick"
        }
        ListElement {
            bgFileName: "leather.jpg"
            bgSource: "../images/backgrounds/leather.jpg"
            bgText: "Leather"
        }
        ListElement {
            bgFileName: "chainmail.jpg"
            bgSource: "../images/backgrounds/chainmail.jpg"
            bgText: "Chainmail"
        }
        ListElement {
            bgFileName: "wood_dark.jpg"
            bgSource: "../images/backgrounds/wood_dark.jpg"
            bgText: "Dark Wood"
        }
        ListElement {
            bgFileName: "wood_light.jpg"
            bgSource: "../images/backgrounds/wood_light.jpg"
            bgText: "Light Wood"
        }
        ListElement {
            bgFileName: "concrete.jpg"
            bgSource: "../images/backgrounds/concrete.jpg"
            bgText: "Concrete"
        }
        ListElement {
            bgFileName: "metal.jpg"
            bgSource: "../images/backgrounds/metal.jpg"
            bgText: "Metal"
        }
    }

    Button_AffirmativeButton {
        id: affirmativeButton
        anchors {
            bottom: screen.bottom
            bottomMargin: 10
            left: screen.left
            leftMargin: 50
        }
        text: "Accept"
        onClicked: {screen.showScreen("common/titlescreen.qml"); myBackground = currentlySelected; console.log(myBackground)}
    }

    Button_NegativeButton {
        id: cancelButton
        anchors {
            bottom: screen.bottom
            bottomMargin: 10
            right: screen.right
            rightMargin: 50

        }
        text: "Cancel"
        onClicked: screen.showScreen("common/titlescreen.qml");
    }
}
