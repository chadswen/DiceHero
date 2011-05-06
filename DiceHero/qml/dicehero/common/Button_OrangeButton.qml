import QtQuick 1.0
//import "../main.qml" as Main

 Rectangle {
     id: container

     property string text: "OrangeButton"
     property int fontSize: 26

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
                     return main.color_RED
                 else
                     return main.color_ORANGE
             }
         }
         GradientStop {
             position: 1.0;
             color: main.color_DARKORANGE
         }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: container.clicked();
     }

     Text {
         id: buttonLabel
         font.pixelSize: fontSize
         font.bold: false
         anchors.centerIn: container
         color: main.color_LIGHTTEXT
         text: container.text
     }
 }
