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

    // signaled just as the player initiates movement to establish a zero point for rolling
    signal calibrate()

    // functions are used as Qt slots when accelerometer changes
    function updateX(outVX) {
        accX = outVX
    }
    function updateY(outVY) {
        accY = outVY
    }
    function updateZ(outVZ) {
        accZ = outVZ
    }


    // used to reset persistent vars upon exiting an app
    function clearAll() {
        var temp = new Array(6);
        Script.clearData(temp);
        p1Array = temp;
        p2Array = temp;

        temp = rollResults;
        Script.clearResults(temp);
        rollResults = temp;

        temp = new Array(5);
        dieClicks = temp;
        saved = temp;

        temp = new Array(18);
        scoreFields = temp;

        p1Turn = true;
        reRolls = 0;
        rolls = 0;

        temp = 0;
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
