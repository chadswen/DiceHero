import QtQuick 1.0
import "common"
import "dice"
import "engine"
import "images"
import "modes"
//import "sound"

import "common/globalDice.js" as GlobalDice
import "common/createDice.js" as Script
import "common/backgroundHolder.js" as BG

Rectangle {

    id: main
    width: screenWidth; height: screenHeight

    property real accX
    property real accY
    property real accZ

    // Global colors, in pairs for gradients
    property string color_OFFBLACK: "#0D0D0D"
    property string color_BLACK: "#000000"
    property string color_GRAY: "#BFBFBF"
    property string color_DARKGRAY: "#7F7F7F"
    property string color_LIGHTGRAY: "#D9D9D9"
    property string color_WHITE: "#FFFFFF"
    property string color_ORANGE: "#E36C0A"
    property string color_DARKORANGE: "#984806"
    property string color_JADE: "#9BBB59"
    property string color_DARKJADE: "#4F6228"
    property string color_LIGHTGREEN: "#00B050"
    property string color_GREEN: "#008000"
    property string color_BLUE: "#0070C0"
    property string color_DARKBLUE: "#1F497D"
    property string color_RED: "#C00000"
    property string color_DARKRED: "#632423"
    property string color_DARKTEXT: color_OFFBLACK
    property string color_LIGHTTEXT: color_WHITE


    property string returnFile

    property variant myBackground: BG.backgroundString
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

    SystemPalette {
        id: activePalette
    }

    Loader {
        id: loader
        source: "common/titlescreen.qml"
    }

    Connections {
        target: loader.item
        onShowScreen: loader.source = msg;
    }
}
