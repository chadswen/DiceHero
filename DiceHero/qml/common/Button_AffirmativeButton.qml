import QtQuick 1.0
import "main.qml" as Main

 Rectangle {
     id: container

     property string text: "Button_AffirmativeButton"
	 
	 property string JADE = Main.color_JADE
	 property string DARKJADE = Main.color_DARKJADE
	 property string LIGHTGREEN = Main.color_LIGHTGREEN
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
                     return LIGHTGREEN
                 else
                     return JADE
             }
         }
         GradientStop { position: 1.0; color: DARKJADE }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: container.clicked();
     }

     Text {
         id: buttonLabel
         font.pixelSize: 20
         font.bold: true
         anchors.centerIn: container
         color: WHITE
         text: container.text
     }
 }