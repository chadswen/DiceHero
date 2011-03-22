var numDice = new Array(6);
var component;

//[d4, d6, d8, d10, d12, d20]

function clearData() {
        numDice[0] = 0;
        numDice[1] = 0;
        numDice[2] = 0;
        numDice[3] = 0;
        numDice[4] = 0;
        numDice[5] = 0;
}

function incd4() {
        numDice[0]++;
}

function incd6() {
        numDice[1]++;
}

function incd8() {
        numDice[2]++;
}

function incd10() {
        numDice[3]++;
}

function incd12() {
        numDice[4]++;
}

function incd20() {
        numDice[5]++;
}

function finalizeBoard() {
    for (var dieIndex = 0; dieIndex < 6; dieIndex++) {
        for (var specIndex = 0; specIndex < numDice[dieIndex]; specIndex++) {
            if (component == null)
                     component = Qt.createComponent("D6.qml");
             // Note that if Block.qml was not a local file, component.status would be
             // Loading and we should wait for the component's statusChanged() signal to
             // know when the file is downloaded and ready before calling createObject().
             if (component.status == Component.Ready) {
                 var dynamicObject = component.createObject(world);
                 if (dynamicObject == null) {
                     console.log("error creating die");
                     console.log(component.errorString());
                 }
                 dynamicObject.type = Math.floor(Math.random() * 3);
                 dynamicObject.x = Math.random() * (screen.width - 70)+35;
                 dynamicObject.y = Math.random() * (screen.height / 3);
                 dynamicObject.rotation = Math.random() * 90;
                 dynamicObject.width = dieBody.width;
                 dynamicObject.height = dieBody.height;
             } else {
                 console.log("error loading die component");
                 console.log(component.errorString());
             }
        }
    }
}
