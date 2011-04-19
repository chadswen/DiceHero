import QtQuick 1.0

 Rectangle {
     id: container

     property string text: "NegativeButton"

     signal clicked

     width: buttonLabel.width + 30; height: buttonLabel.height + 20
     border {
         width: 1;
         color: Qt.darker(activePalette.button)
     }
     smooth: true
     radius: 8

     gradient: Gradient {
         GradientStop {
             position: 0.0
             color: {
                 if (mouseArea.pressed)
                     return main.color_DARKORANGE
                 else
                     return main.color_RED
             }
         }
         GradientStop { position: 1.0; color: main.color_DARKRED }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: container.clicked();
     }

     Text {
         id: buttonLabel
         font.pixelSize: 26
         font.bold: false
         anchors.centerIn: container
         color: main.color_WHITE
         text: container.text
     }
 }
