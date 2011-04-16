import QtQuick 1.0

 Rectangle {
     id: container
     property string text: "Button"

     signal clicked

     width: buttonLabel.width + 20; height: buttonLabel.height + 10
     border {
         width: 1;
         color: Qt.darker(activePalette.button)
     }
     smooth: true
     radius: 8


    color: "white"

     MouseArea {
         id: mouseArea
         anchors.fill: parent
         onClicked: {
             container.clicked();

             if (container.opacity == 1)
                 container.opacity = .5;
             else if(container.opacity == .5)
                 container.opacity = 1;


         }
     }

     Text {
         id: buttonLabel
         font.pixelSize: 20
         anchors.centerIn: container
         color: "black"
         text: container.text
     }
 }
