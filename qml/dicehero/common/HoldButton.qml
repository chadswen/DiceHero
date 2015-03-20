import QtQuick 1.0

 Rectangle {
     id: container

     property string text: "HoldButton"

     signal pressed
     signal released

     width: parent.width; height: buttonLabel.height+30
     border {
         width: 1;
         color: Qt.darker(activePalette.button)
     }
     smooth: true
     radius: 8

     // color the button with a gradient
     gradient: Gradient {
         GradientStop {
             position: 0.0
             color: {
                 if (mouseArea.pressed)
                     return activePalette.dark
                 else
                     return activePalette.light
             }
         }
         GradientStop { position: 1.0; color: activePalette.button }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onPressed: container.pressed();
         onReleased: container.released();
     }

     Text {
         id: buttonLabel
         anchors.centerIn: container
         color: activePalette.buttonText
         text: container.text
     }
 }
