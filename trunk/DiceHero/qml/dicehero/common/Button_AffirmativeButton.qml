import QtQuick 1.0

 Rectangle {
     id: container

     property string text: "AffirmativeButton"

     signal clicked

     width: buttonLabel.width + 20; height: buttonLabel.height + 10
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
         font.pixelSize: 26
         font.bold: true
         anchors.centerIn: container
         color: main.color_WHITE
         text: container.text
     }
 }
