import QtQuick 1.0
import "globalDice.js" as GlobalDice
import "createDice.js" as Script

Rectangle {

    id: main
    width: 360; height: 640

    property real accX
    property real accY
    property real accZ



    property string returnFile

    property variant myDice: GlobalDice.numDice
    property variant rollResults: GlobalDice.rollResults
    property variant dieClicks: GlobalDice.dieClicks
    property variant saved: GlobalDice.saved
    property variant p1Array: GlobalDice.p1Array
    property variant p2Array: GlobalDice.p2Array
    property variant scoreFields: GlobalDice.scoreFields


    property int reRolls: 0
    property int rolls: 0

    property bool currentlyRolling: false
    property bool p1Turn: true

    // signaled just as the player initiates movement input (start rolling)
    signal calibrate()

    // functions are used as Qt slots when acceleromter changes
    function updateX(outVX) {
        accX = outVX
    }
    function updateY(outVY) {
        accY = outVY
    }
    function updateZ(outVZ) {
        accZ = outVZ
    }

    Loader {
        id: loader
        source: "titlescreen.qml"
    }

    Connections {
        target: loader.item
        onShowScreen: loader.source = msg;
    }
}
