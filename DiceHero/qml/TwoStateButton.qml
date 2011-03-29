import QtQuick 1.0

 Rectangle {
     id: container
     Component.onCompleted:{
         var temp = activePalette.dark;
         myColor = temp;
     }
     property string text: "Button"

     signal clicked

     width: buttonLabel.width + 20; height: buttonLabel.height + 10
     border {
         width: 1;
         color: Qt.darker(activePalette.button)
     }
     smooth: true
     radius: 8


     // color the button with a gradient
     gradient: Gradient {
         GradientStop {
             id: gStop
             position: 0.0
             color: activePalette.light
         }
         GradientStop { position: 1.0; color: activePalette.button }
     }

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: {
             container.clicked();

             if (gStop.color == activePalette.dark)
                 gStop.color = activePalette.light;
             else if(gStop.color == activePalette.light)
                 gStop.color = activePalette.dark;


         }
     }

     Text {
         id: buttonLabel
         font.pixelSize: 20
         anchors.centerIn: container
         color: activePalette.buttonText
         text: container.text
     }
 }
