import QtQuick 1.0
import "../common/backgroundHolder.js" as Script

Rectangle {

    signal showScreen(string msg)

    property string currentlySelected : ""

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


    Rectangle {
        id: selectionContainer
        property int isSelected : 0


        anchors {
            top: radiusRect.top
            topMargin: 120
            left: radiusRect.left
            leftMargin: 25
            right: radiusRect.right
            rightMargin: 25
        }

        MouseArea {
            id: greenfelt
            property string name : "greenfelt"
            property int selected : 0
            height:100
            width:100
            function show() { greenfeltImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { greenfeltImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "greenfelt.png"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: greenfeltImage
                width: 100
                height: 100
                source: "../images/backgrounds/greenfelt.png"
            }
            Text {
                anchors.top: greenfelt.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Green Felt"
                color: "#AAAAAA"
            }
        }

        MouseArea {
            id: brick
            property string name : "brick"
            property int selected : 0
            height:100
            width:100
            anchors.left: greenfelt.right
            function show() { brickImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { brickImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "brick.jpg"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: brickImage
                width: 100
                height: 100
                source: "../images/backgrounds/brick.jpg"
            }
            Text {
                anchors.top: brick.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Brick"
                color: "#AAAAAA"
            }
        }

        MouseArea {
            id: chain
            property string name : "chain"
            property int selected : 0
            height:100
            width:100
            anchors.top: brick.bottom
            anchors.topMargin: 30
            function show() { chainImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { chainImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "chainmail.jpg"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: chainImage
                width: 100
                height: 100
                source: "../images/backgrounds/chainmail.jpg"
            }
            Text {
                anchors.top: chain.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Chainmail"
                color: "#AAAAAA"
            }
        }

        MouseArea {
            id: concrete
            property string name : "concrete"
            property int selected : 0
            height:100
            width:100
            anchors.top: chain.bottom
            anchors.topMargin:  30
            function show() { concreteImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { concreteImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "concrete.jpg"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: concreteImage
                width: 100
                height: 100
                source: "../images/backgrounds/concrete.jpg"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: concrete.bottom
                text: "Concrete"
                color: "#AAAAAA"
            }
        }

        MouseArea {
            id: leather
            property string name : "leather"
            property int selected : 0
            height:100
            width:100
            anchors.left: brick.right
            function show() { leatherImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { leatherImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "leather.jpg"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: leatherImage
                width: 100
                height: 100
                source: "../images/backgrounds/leather.jpg"
            }
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: leather.bottom
                text: "Leather"
                color: "#AAAAAA"
            }
        }

        MouseArea {
            id: metal
            property string name : "metal"
            property int selected : 0
            height:100
            width:100
            anchors.left: greenfelt.right
            anchors.top: wood_dark.bottom
            anchors.topMargin: 30
            function show() { metalImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { metalImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "metal.jpg"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: metalImage
                width: 100
                height: 100
                source: "../images/backgrounds/metal.jpg"
            }
            Text {
                anchors.top: metal.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Metal"
                color: "#AAAAAA"
            }
        }

        MouseArea {
            id: wood_dark
            property string name : "wood_dark"
            property int selected : 0
            height:100
            width:100
            anchors.left: greenfelt.right
            anchors.top: leather.bottom
            anchors.topMargin: 30
            function show() { wooddarkImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { wooddarkImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "wood_dark.jpg"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: wooddarkImage
                width: 100
                height: 100
                source: "../images/backgrounds/wood_dark.jpg"
            }
            Text {
                anchors.top: wood_dark.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Dark Wood"
                color: "#AAAAAA"
            }
        }

        MouseArea {
            id: wood_light
            property string name : "wood_light"
            property int selected : 0
            height:100
            width:100
            anchors.left: wood_dark.right
            anchors.top: leather.bottom
            anchors.topMargin: 30
            function show() { wlText.color = "#AAAAAA"; woodlightImage.opacity = 1; selected = 0; selectionContainer.isSelected = 0; screen.currentlySelected = ""}
            function hide() { wlText.color = "#008000"; woodlightImage.opacity = 0.25; selected = 1; selectionContainer.isSelected = 1; screen.currentlySelected = "wood_light.jpg"}
            onClicked: {
                if (selected == 0 && selectionContainer.isSelected == 0) hide();
                else if (selected == 1) show();
            }
            Image {
                id: woodlightImage
                width: 100
                height: 100
                source: "../images/backgrounds/wood_light.jpg"
            }
            Text {
                id: wlText
                anchors.top: wood_light.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Light Wood"
                color: "#AAAAAA"
            }
        }
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
