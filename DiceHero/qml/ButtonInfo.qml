import QtQuick 1.0

 Rectangle {
     id: container

     property string text: "ButtonInfo"

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
                     return "#5EFF5E"
                 else
                     return "#2FE02F"
             }
         }
         GradientStop { position: 1.0; color: "#217A21" }
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
