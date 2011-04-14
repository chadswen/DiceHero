import QtQuick 1.0
import "main.qml" as Main

 Rectangle {
     id: container

     property string text: "Button_StandardButton"
	 
	 property string GRAY = Main.color_GRAY
	 property string DARKGRAY = Main.color_DARKGRAY
	 property string LIGHTGRAY = Main.color_LIGHTGRAY
	 property string OFFBLACK = Main.color_OFFBLACK

     signal clicked

     width: buttonLabel.width + 10; height: buttonLabel.height + 5
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
                     return LIGHTGRAY
                 else
                     return GRAY
             }
         }
         GradientStop { position: 1.0; color: DARKGRAY }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: container.clicked();
     }

     Text {
         id: buttonLabel
         font.pixelSize: 18
         font.bold: false
         anchors.centerIn: container
         color: OFFBLACK
         text: container.text
     }
 }