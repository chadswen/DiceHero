import QtQuick 1.0

 Rectangle {
     id: container

     property string text: "InfoButton"

     signal clicked

     width: buttonLabel.width + 30; height: buttonLabel.height + 10
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
                     return main.color_LIGHTGRAY
                 else
                     return main.color_BLUE
             }
         }
         GradientStop { position: 1.0; color: main.color_DARKBLUE }
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
