import QtQuick 1.0

Button {
    id: selectDiceButton
    anchors {
        left: parent.left;
        verticalCenter: parent.verticalCenter
    }
    text: "Select Dice"
    onClicked: console.log("This doesn't do anything yet...")
}
