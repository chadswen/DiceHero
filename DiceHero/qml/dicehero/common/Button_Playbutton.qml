import QtQuick 1.0

 Rectangle {
     id: container

     property string text: "Play"

     signal clicked

     width: buttonLabel.width + 10; height: buttonLabel.height + 20
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
                     return main.color_LIGHTGREEN
                 else
                     return main.color_JADE
             }
         }
         GradientStop { position: 1.0; color: main.color_DARKJADE }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: container.clicked();
     }

     Text {
         id: buttonLabel
         font.pixelSize: 24
         font.bold: true
         anchors.centerIn: container
         color: main.color_WHITE
         text: container.text
     }
 }
