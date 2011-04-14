import QtQuick 1.0
import "main.qml" as Main

 Rectangle {
     id: container

     property string text: "Button_NegativeButton"
	 
	 property string RED = Main.color_RED
	 property string DARKRED = Main.color_DARKRED
	 property string DARKORANGE = Main.color_DARKORANGE
	 property string WHITE = Main.color_WHITE

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
                     return DARKORANGE
                 else
                     return RED
             }
         }
         GradientStop { position: 1.0; color: DARKRED }
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
         color: activePalette.buttonText
         text: WHITE
     }
 }