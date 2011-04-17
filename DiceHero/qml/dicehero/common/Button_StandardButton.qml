import QtQuick 1.0
//import "../main.qml" as Main

 Rectangle {
     id: container

     property string text: "StandardButton"

     signal clicked

     width: buttonLabel.width + 30; height: buttonLabel.height + 20
     border {
         width: 1;
         color: Qt.darker(activePalette.button)
     }
     smooth: true
     radius: 6

     gradient: Gradient {
         GradientStop {
             position: 0.0
             color: {
                 if (mouseArea.pressed)
                     return main.color_LIGHTGRAY
                 else
                     return main.color_GRAY
             }
         }
         GradientStop {
             position: 1.0;
             color: main.color_DARKGRAY
         }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: container.clicked();
     }

     Text {
         id: buttonLabel
         font.pixelSize: 24
         font.bold: false
         anchors.centerIn: container
         color: main.color_OFFBLACK
         text: container.text
     }
 }
