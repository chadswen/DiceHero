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
             position: 0.0
             color: {
                 if (activePalette.dark == true && mouseArea.clicked)
                     return activePalette.light
                 if(activePalette.light == true && mouseArea.clicked)
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
         onClicked: container.clicked();
     }

     Text {
         id: buttonLabel
         font.pixelSize: 20
         anchors.centerIn: container
         color: activePalette.buttonText
         text: container.text
     }
 }
