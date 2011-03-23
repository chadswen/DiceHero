import QtQuick 1.0

Rectangle {

    width: 360; height: 640

    Loader {
        id: loader
        source: "titlescreen.qml"
    }

    Connections {
        target: loader.item
        onShowScreen: loader.source = msg;
    }
}
