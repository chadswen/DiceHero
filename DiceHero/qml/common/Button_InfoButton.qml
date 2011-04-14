import QtQuick 1.0
import "main.qml" as Main

 Rectangle {
     id: container

     property string text: "Button_InfoButton"
	 
	 property string BLUE = Main.color_BLUE
	 property string DARKBLUE = Main.color_DARKBLUE
	 property string LIGHTGRAY = Main.color_LIGHTGRAY
	 property string WHITE = Main.color_WHITE

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
                     return LIGHTGRAY
                 else
                     return BLUE
             }
         }
         GradientStop { position: 1.0; color: DARKBLUE }
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
         color: WHITE
         text: container.text
     }
 }