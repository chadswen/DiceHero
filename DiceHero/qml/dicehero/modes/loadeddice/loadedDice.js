var i;

    function sum(dice)                  //used for chance
    {
        return Number(Number(dice[0])+Number(dice[1])+Number(dice[2])+Number(dice[3])+Number(dice[4]));
    }

    function BubbleSort(tempSaved)
    {
            do                                         //bubble sort
            {
                var swapped = false;
                for(i=0; i<tempSaved.length-1; i++)
                {
                    if(tempSaved[i]>tempSaved[i+1])
                    {
                        swapped = true;
                        var temp = tempSaved[i];
                        tempSaved[i] = tempSaved[i+1];
                        tempSaved[i+1] = temp;
                    }
                }
            }while(swapped);
     }
	 
function checkForNotice(turnCount)
{
	var n = 8; // Number of turns between each notice
	
	if(turnCount == 0)
		return -1;
	else if(turnCount%n == 0)
		return 1;
	else return 0;
}

function showNotice(mode) // mode is either "instructions" or "notice"
{
	var instructions = "Take turns passing the phone around.\nOn your turn, roll the dice, and follow the instructions!";
	var notices = new Array("Take a break and drink some water - you can thank us in the morning!",
	"Please play responsibly. Designate a sober driver, know your limits, and for God's sake don't drop the phone in the toilet!",
	"Remember, providing alcohol to minors isn't just against the law - it's wrong.",
    "Be a Hero - learn to recognize the symptoms of alcohol poisoning:\n1. Extreme confusion\n2. Seizure activity\n3. Weak and slow breathing\n4. Decreased body temperature\n 5. Loss of consciousness.\n\nContact emergency personnel immediately upon suspecting a victim of alcohol poisoning. Help turn the victim on their side in the \"recovery position\" in the event of vomiting.",
	"Yes, you've been playing for a while. No, it's a terrible idea to text anyone. For real.",
    "Yes, you've been playing for a while. No, it's a terrible idea to upload pictures of this on the internet. Your grandma might see.",
    "Grab a snack, buddy. And have you ever thought about maybe playing Loaded Dice with an assortment of craft beers? It's an easy, interesting, and tasty twist!");
	
   if(mode == "notice")
	{
		var r = Math.random(0, notices.length);
		return notices[r];
	}
   else if(mode == "instructions")
	{
		return instructions;
	}
	else return "INVALID";
}


function loadedDice(sum)
{
    var names = new Array("", "", "SNAKE EYES", "THREE IS FOR ME",
                          "FIRE DRILL", "FIVE FOR THE FELLAS",
                          "SIX FOR THE CHICKS", "HEAVEN",
                          "DRINKING MATE", "RHYME TIME",
                          "AGAIN", "NEVER HAVE I EVER", "THE QUEEN",
                          "THE KING", "HIT THE FLOOR", "JACKPOT",
                          "CRAZY EIGHTS");

    return names[sum];
}


function loadedDiceText(sum) 
{
   var instructions = "1. For three or more players. 2. Take turns passing the phone and rolling the dice. Follow the instructions on screen!\n"
   var snakeeyes = "Staring contest with another player."
   var threeisforme = "You must take a drink!"
   var firedrill= "Everyone must jog around the table once. Last one to sit back in their spot must take a drink. Ready? Go!"
   var fiveforthefellas= "All the men must take a drink!"
   var sixforthechicks = "All the ladies must take a drink!"
   var heaven ="Last person to put their hands in the sky takes a drink. Ready? Go!"
   var drinkingmate= "Pick someone to be your \"mate.\" Any time YOU take a drink, your mate has to drink, too!"
   var rhymetime= "Take turns rhyming words. The first person who repeats a word or fails to rhyme must take a drink!"
   var again="Choose someone who has to take a drink - then roll again!"
   var neverhaveiever = "Say \"Never have I ever _______.\" Anyone who HAS done it, however, must take a drink!"
   var thequeen	="Choose someone to take YOUR drink!"
   var theking	= "Everyone EXCEPT you must take a drink!"
   var hitthefloor	= "Last person to touch the floor takes a drink. Ready? Go!"
   var jackpot	= "Start drinking! Everyone must drink with you, until you stop!"
   var fight	= "Rock-Paper-Scissors with another player. Loser must take a drink!"
   var crazyeights	= "Make your own rule that must be followed for the remainder of the game!"
   var orders = new Array("", "", snakeeyes, threeisforme, firedrill,
                          fiveforthefellas, sixforthechicks, heaven,
                          drinkingmate, rhymetime, again, neverhaveiever,
                          thequeen, theking, hitthefloor, jackpot, fight,
                          crazyeights);

    return orders[sum];
}
