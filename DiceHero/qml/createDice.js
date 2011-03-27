var diceLabels = ["D4", "D6", "D8", "D10", "D12", "D20"];
var component;

function clearData(numDice) {
        numDice[0] = 0;
        numDice[1] = 0;
        numDice[2] = 0;
        numDice[3] = 0;
        numDice[4] = 0;
        numDice[5] = 0;
}


function clearResults(rollResults) {
    rollResults[0] = [];
    rollResults[1] = [];
    rollResults[2] = [];
    rollResults[3] = [];
    rollResults[4] = [];
    rollResults[5] = [];

}


function getNumberDice(numDice) {
    var sum = 0;
    for (var i =0; i < 6; i++) {
        sum += numDice[i];
    }
    return sum;
}

function incd4(numDice) {
        numDice[0]++;
}

function incd6(numDice) {
        numDice[1]++;
}

function incd8(numDice) {
        numDice[2]++;
}

function incd10(numDice) {
        numDice[3]++;
}

function incd12(numDice) {
        numDice[4]++;
}

function incd20(numDice) {
        numDice[5]++;
}


function finalizeBoard(numDice) {
    for (var dieIndex = 0; dieIndex < 6; dieIndex++) {
        component = Qt.createComponent(diceLabels[dieIndex]+".qml");
        for (var specIndex = 0; specIndex < numDice[dieIndex]; specIndex++) {
            var dieObject = component.createObject(world);
            if (dieObject == null) {
                console.log("error creating die");
                console.log(component.errorString());
            }
            dieObject.x = Math.random() * (engine.width - 70)+35;
            dieObject.y = Math.random() * (engine.height / 3);
            dieObject.rotation = Math.random() * 90;
        }
    }
}
