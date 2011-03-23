import QtQuick 1.0

Rectangle {

    signal showScreen(string msg)

    id: screen

    width: 360; height: 640

    SystemPalette {
        id: activePalette
    }

    Item {
        id: background
        width: parent.width; height: parent.height
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Rectangle {
                anchors.fill: parent
                color: "purple"
        }
    }
}
