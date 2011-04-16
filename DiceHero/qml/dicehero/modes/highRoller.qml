import QtQuick 1.0
import "../common"
import "../common/createDice.js" as Script
import Qt.labs.particles 1.0
Rectangle {
    signal showScreen(string msg)
    property variant resArray

    id: screenBase

    width: screenWidth; height: screenHeight


    Component.onCompleted: {
        //create one of each die
        var temp = myDice;
        var y;
        var z;
        Script.oneOfEach(temp);
        myDice = temp;




        temp = new Array(6);
        Script.clearData(temp);
        resArray = temp;
        if(rollResults[0][0]==null){
            p1Array = temp;
            p2Array = temp;
            {console.log(rolls);winner.text = "Roll #" +Number(1+ rolls);}
        }
        else
            if(p1Turn){
                temp = p1Array;
                for(y = 0; y<6; y++){
                    if(Number(rollResults[y][0])>Number(temp[y]))
                        temp[y]= rollResults[y][0];

                }
                p1Array = temp;
                p1Turn = false;

            }
            else{
                temp = p2Array;
                for(z = 0; z<6; z++){
                    if(Number(rollResults[z][0])>Number(temp[z]))
                        temp[z] = rollResults[z][0];
                }
                p2Array = temp;
                p1Turn = true;
                rolls++;

                //decide winner
                if(rolls == Number(3)){
                    finalize.visible = false;
                    if(sum(p1Array)>sum(p2Array))
                        winner.text = "P1 WINS!!";
                    else if(sum(p2Array)>sum(p1Array))
                        winner.text = "P2 WINS!!";
                    else
                        winner.text = "IT'S A TIE!";
                    winner.color="orange";
                    particles.burst(20);

                }
            }
    }

    SystemPalette {
        id: activePalette
    }

    function sum(resArray)
    {
        var x;
        var sum = 0;
        for(x in resArray)
            sum+=Number(resArray[x]);

        return sum;
    }

    Item {
        id: screen
        width: parent.width; height: parent.height
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        Image {
            anchors.fill: parent
            source: "../images/board.png"
        }




        Rectangle {
            id: buttonHolder1

            anchors {
                top: screen.top;
                topMargin: 150
                bottomMargin: 150
                left: parent.left
                leftMargin: 25

            }
            color: "black"
            width: 150
            height: 250
            border.color: "#CCCCCC"
            border.width: 4
            smooth: true
            radius: 50
        }

        Rectangle {
            id: status1
            height: 70; width: 150
            border.color:  "#CCCCCC"
            color: "black"
            border.width:  4
            opacity: .7
            radius: 10
            anchors {
                top: parent.top
                topMargin:20
                horizontalCenter:buttonHolder1.horizontalCenter
            }
        }

        Text {
            id: p1Text
            font.bold: false
            smooth: true
            text:{"P1 Total: " + sum(p1Array)}
            font.pixelSize: 25
            color: "#CCCCCC"
            style: Text.Raised
            anchors.centerIn: status1


        }

        Image {
            height: 70
            width: 70
            id: p1selectD4
            source: "../images/d4_1.png"
            smooth: true
            anchors {
                top: buttonHolder1.top
                left: buttonHolder1.left
                leftMargin: 5
                topMargin: 20
            }
            Text {
                text: p1Array[0]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p1selectD6
            source: "../images/d6_1.png"
            smooth: true
            anchors {
                left: p1selectD4.right
                top: p1selectD4.top
            }
            Text {
                text: p1Array[1]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p1selectD8
            source: "../images/d8_1.png"
            smooth: true
            anchors {
                left: p1selectD4.left
                top: p1selectD4.bottom
            }
            Text {
                text: p1Array[2]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p1selectD10
            source: "../images/d10_1.png"
            smooth: true
            anchors {
                left: p1selectD6.left
                top: p1selectD4.bottom
            }
            Text {
                text: p1Array[3]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p1selectD12
            source: "../images/d12_1.png"
            smooth: true
            anchors {
                left: p1selectD8.left
                top: p1selectD8.bottom
            }
            Text {
                text: p1Array[4]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p1selectD20
            source: "../images/d20_1.png"
            smooth: true
            anchors {
                left: p1selectD10.left
                top: p1selectD10.bottom
            }
            Text {
                text: p1Array[5]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
        }


        Rectangle {
            id: buttonHolder2

            anchors {
                top: screen.top;
                topMargin: 150
                bottomMargin: 150
                right: parent.right
                rightMargin: 25

            }
            color: "black"
            width: 150
            height: 250
            border.color: "#CCCCCC"
            border.width: 4
            smooth: true
            radius: 50
        }

        Rectangle {
            id: status2
            height: 70; width: 150
            border.color:  "#CCCCCC"
            color: "black"
            border.width:  4
            opacity: .7
            radius: 10
            anchors {
                top: parent.top
                topMargin:20
                horizontalCenter:buttonHolder2.horizontalCenter
            }
        }

        Text {
            id: p2Text
            font.bold: false
            smooth: true
            text:{"P2 Total: " + sum(p2Array)}
            font.pixelSize: 25
            color: "#CCCCCC"
            style: Text.Raised
            anchors.centerIn: status2


        }

        Image {
            height: 70
            width: 70
            id: p2selectD4
            source: "../images/d4_1.png"
            smooth: true
            anchors {
                top: buttonHolder2.top
                left: buttonHolder2.left
                leftMargin: 5
                topMargin: 20
            }
            Text {
                text: p2Array[0]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p2selectD6
            source: "../images/d6_1.png"
            smooth: true
            anchors {
                left: p2selectD4.right
                top: p2selectD4.top
            }
            Text {
                text: p2Array[1]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p2selectD8
            source: "../images/d8_1.png"
            smooth: true
            anchors {
                left: p2selectD4.left
                top: p2selectD4.bottom
            }
            Text {
                text: p2Array[2]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p2selectD10
            source: "../images/d10_1.png"
            smooth: true
            anchors {
                left: p2selectD6.left
                top: p2selectD4.bottom
            }
            Text {
                text: p2Array[3]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p2selectD12
            source: "../images/d12_1.png"
            smooth: true
            anchors {
                left: p2selectD8.left
                top: p2selectD8.bottom
            }
            Text {
                text: p2Array[4]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }

        }

        Image {
            height: 70
            width: 70
            id: p2selectD20
            source: "../images/d20_1.png"
            smooth: true
            anchors {
                left: p2selectD10.left
                top: p2selectD10.bottom
            }
            Text {
                text: p2Array[5]
                anchors.centerIn: parent
                color: "#CCCCCC"
                styleColor: "black"
                style: Text.Outline
                font.bold: false
                font.pixelSize: 20
            }
        }

        Text {
            id: winner
            font.bold: true
            smooth: true
            font.pixelSize: 70
            color: "white"
            style: Text.Outline
            styleColor: "#CCCCCC"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: buttonHolder1.bottom
            anchors.topMargin: 10
            text: "Roll #" +Number(1+ rolls);




            Particles {
                id: particles
                width: 1; height: 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                emissionRate: 0
                lifeSpan: 900; lifeSpanDeviation: 600
                angle: 0; angleDeviation: 360;
                velocity: 350; velocityDeviation: 60
                source: "../images/logo_small.png"
            }
        }


        Item {
            id: bottomBar
            width: parent.width; height: parent.height
            anchors{
                bottom: parent.bottom
                bottomMargin: 20
                horizontalCenter: parent.horizontalCenter
            }

            Button_AffirmativeButton {
                id: finalize
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.rightMargin:10
                anchors.leftMargin:30
                text: {if(p1Turn)
                        "P1's' Roll"
                        else
                        "P2's' Roll"}
                        onClicked: returnFile="modes/highRoller.qml", screenBase.showScreen("engine/engine.qml")
                }
                Button_NegativeButton {
                    id: returnButton
                    text: "Back to Modes"
                    anchors.bottom: parent.bottom
                    anchors.left: parent.horizontalCenter
                    anchors.right: parent.right
                    anchors.rightMargin:30
                    anchors.leftMargin:10
                    onClicked: {
                        main.clearAll();
                        screenBase.showScreen("modes/gameSelection.qml");
                    }
                }
            }
        }
    }
