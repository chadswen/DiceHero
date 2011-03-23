import QtQuick 1.0
import Box2D 1.0

Die {
    id: d20
    currentSource: "d6.png"
    currentNumber: Math.random(1, 20)
}
