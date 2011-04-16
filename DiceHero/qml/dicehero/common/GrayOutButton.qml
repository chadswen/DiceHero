import QtQuick 1.0

 Rectangle {
     id: container
     property string text: "Button"

     signal clicked

     width: buttonLabel.width + 20; height: buttonLabel.height + 10
     border {
         width: 1;
         color: Qt.darker(activePalette.button)
     }
     smooth: true
     radius: 8


     // color the button with a gradient
     gradient: Gradient {
         GradientStop {
             id: gStop
             position: 0.0
             color: activePalette.light
         }
         GradientStop { position: 1.0; color: activePalette.button }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: {
            if (gStop.color == activePalette.light)
            {
                container.clicked();
                gStop.color = activePalette.dark;
            }
                //else nothing happens the scoring option has already been used.

         }
     }

     Text {
         id: buttonLabel
         font.pixelSize: 12
         anchors.centerIn: container
         color: activePalette.buttonText
         text: container.text
     }
 }
