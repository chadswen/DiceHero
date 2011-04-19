import QtQuick 1.0
import "../common"
import "../common/createDice.js" as Creator
import Qt.labs.particles 1.0
Rectangle {
    signal showScreen(string msg)
    property variant resArray
	
	// Text Instructions
    property string instructions: "1. For three or more players.\n2. Take turns passing the phone and rolling the dice. Follow the instructions on screen!\n"
    property string snakeeyes: "SNAKE EYES\n\nStaring contest with another player."
    property string threeisforme: "THREE IS FOR ME\n\nYou must take a drink!"
    property string firedrill: "FIRE DRILL\n\nEveryone must jog around the table once. Last one to sit back in their spot must take a drink. Ready? Go!"
    property string fiveforthefellas: "FIVE FOR THE FELLAS\n\nAll the men must take a drink!"
    property string sixforthechicks : "SIX FOR THE CHICKS\n\nAll the ladies must take a drink!"
    property string heaven :"HEAVEN\n\nLast person to put their hands in the sky takes a drink. Ready? Go!"
    property string drinkingmate: "DRINKING MATE\n\nPick someone to be your \"mate.\" Any time YOU take a drink, your mate has to drink, too!"
    property string rhymetime: "RHYME TIME\n\nTake turns rhyming words. The first person who repeats a word or fails to rhyme must take a drink!"
    property string again:"AGAIN\n\nChoose someone who has to take a drink - then roll again!"
    property string neverhaveiever	:"NEVER HAVE I EVER\n\nSay \"Never have I ever _______.\" Anyone who HAS done it, however, must take a drink!"
    property string thequeen	:"THE QUEEN\n\nChoose someone to take YOUR drink!"
    property string theking	: "THE KING\n\nEveryone EXCEPT you must take a drink!"
    property string hitthefloor	: "HIT THE FLOOR\n\nLast person to touch the floor takes a drink. Ready? Go!"
    property string jackpot	: "JACKPOT\n\nStart drinking! Everyone must drink with you, until you stop!"
    property string fight	: "FIGHT\n\nRock-Paper-Scissors with another player. Loser must take a drink!"
    property string crazyeights	: "CRAZY EIGHTS\n\nMake your own rule that must be followed for the remainder of the game!"
	
// Notices (Because we're responsible like that)
    property string drinkwater	: "Take a break and drink some water - you can thank us in the morning!"
    property string playresponsibly	: "Please play responsibly. Designate a sober driver, know your limits, and for God's sake don't drop the phone in the toilet!"
    property string nominors	: "Remember, providing alcohol to minors isn't just against the law - it's wrong."
    property string alcoholpoisoning: "Be a Hero - learn to recognize the symptoms of alcohol poisoning:\n1. Extreme confusion\n2. Seizure activity\n3. Weak and slow breathing\n4. Decreased body temperature\n 5. Loss of consciousness.\n\nContact emergency personnel immediately upon suspecting a victim of alcohol poisoning. Help turn the victim on their side in the "recovery position" in the event of vomiting."
    property string nodrunktexts	: "Yes, you've been playing for a while. No, it's a terrible idea to text anyone. For real."
    property string nouploadingpics	: "Yes, you've been playing for a while. No, it's a terrible idea to upload pictures of this on the internet. Your grandma might see."
    property string proptip	: "Grab a snack, buddy. And have you ever thought about maybe playing Loaded Dice with an assortment of craft beers? It's an easy, interesting, and tasty twist!"
	
    id: screenBase

    width: 360; height: 640


    Component.onCompleted: {
        //create one of each die
        var temp = myDice;
        var y;
        var z;
        Creator.oneOfEach(temp);
        myDice = temp;
        temp = new Array(2);
        Creator.clearData(temp);
        resArray = temp;	
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
            id: topRect

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
            id: topRectBorder
            height: 70; width: 150
            border.color:  "#CCCCCC"
            color: "black"
            border.width:  4
            opacity: .7
            radius: 10
            anchors {
                top: parent.top
                topMargin:20
                horizontalCenter:topRect.horizontalCenter
            }
        }

        Text {
            id: p1Text
            font.bold: false
            smooth: true
            text:{""}
            font.pixelSize: 20
            color: "#CCCCCC"
            style: Text.Raised
            anchors.centerIn: topRectBorder
        }


        Item {
            id: bottomBar
            width: parent.width; height: parent.height
            anchors{
                bottom: parent.bottom
                bottomMargin: 20
                horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: finalize
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.horizontalCenter
                anchors.rightMargin:10
                anchors.leftMargin:30
                text: {"Start Over"}
                        onClicked: returnFile="modes/LoadedDice.qml", screenBase.showScreen("engine/engine.qml")
                }
                Button {
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
