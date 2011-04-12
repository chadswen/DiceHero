var i;
function count(value, dice)         //used for ones, twos, threes, fours, fives, sixes
    {
        var counter = 0;

        for(i = 0; i<dice.length; i++)
        {
            if(value == dice[i])
            {
                counter += value;
            }
        }
        return counter;
    }

    function sum(dice)                  //used for chance
    {
        return Number(Number(dice[0])+Number(dice[1])+Number(dice[2])+Number(dice[3])+Number(dice[4]));
    }

    function FullHouse(dice)
    {
        if((dice[0]==dice[2]&&dice[3]==dice[4])||(dice[0]==dice[1]&&dice[2]==dice[4]))
        {
            return 25;
        }
        else
            return 0;
    }

    function SmallStraight(dice)
    {
        var matches = 0;
        for(i = 0; i < dice.length-1; i++)
        {
            if(dice[i]==dice[i+1])
            {
                matches += 1;
            }
            if(Number(dice[i])+1 < dice[i+1])
            {
                matches += 1;
            }
        }
        if(matches < 2)
            return 30;
        else
            return 0;
    }
    function LargeStraight(dice)
    {
        var large = true;
        for(i = 0; i < dice.length-1; i++)
        {
            if(dice[i]==dice[i+1])
                large = false;
        }
        if(large)
            return 40;
        else
            return 0;
    }
    function ThreeofKind(dice)
    {
        if(dice[0]==dice[2]||dice[1]==dice[3]||dice[2]==dice[4])
            return sum(dice);
        else
            return 0;
    }
    function FourofKind(dice)
    {
        if(dice[0]==dice[3]|| dice[1]== dice[4])
            return sum(dice);
        else
            return 0;
    }
    function FiveofKind(dice)
    {
        if(dice[0]== dice[4])
            return 100;
        else
            return 0;
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

    function bonusCheck()
    {
        if(Number(topscore.text)>62)
        {
            bonusscore.text = "35";
            totalscore.text = Number(totalscore.text) + 35;
        }
    }

    function initializeScores(tempScores)
    {
        tempScores[0] = "--"        //ones
        tempScores[1] = "--"        //twos
        tempScores[2] = "--"        //threes
        tempScores[3] = "--"        //fours
        tempScores[4] = "--"        //fives
        tempScores[5] = "--"        //sixes
        tempScores[6] = "--"        //threeofKind
        tempScores[7] = "--"        //fourofKind
        tempScores[8] = "--"        //fullHouse
        tempScores[9] = "--"        //smallStraight
        tempScores[10] = "--"       //largeStraight
        tempScores[11] = "--"       //chance
        tempScores[12] = "--"       //Motherload1
        tempScores[13] = "--"       //Motherload2
        tempScores[14] = "--"       //Motherload3
        tempScores[15] = "0"       //topSection score
        tempScores[16] = "0"       //bonus score
        tempScores[17] = "0"        //total score
    }

    function initializeText(tempScores)
    {
        onescore.text = tempScores[0]        //ones
        twoscore.text = tempScores[1]        //twos
        threescore.text = tempScores[2]        //threes
        fourscore.text = tempScores[3]        //fours
        fivescore.text = tempScores[4]        //fives
        sixscore.text = tempScores[5]        //sixes
        threeofkindscore.text = tempScores[6]        //threeofKind
        fourofkindscore.text = tempScores[7]        //fourofKind
        fullhousescore.text = tempScores[8]        //fullHouse
        smallstraightscore.text = tempScores[9]        //smallStraight
        largestraightscore.text = tempScores[10]       //largeStraight
        chancescore.text = tempScores[11]       //chance
        motherload1.text = tempScores[12]       //Motherload1
        motherload2.text = tempScores[13]       //Motherload2
        motherload3.text = tempScores[14]       //Motherload3
        topscore.text = tempScores[15]       //topSection score
        bonusscore.text = tempScores[16]       //bonus score
        totalscore.text = tempScores[17]        //total score
    }

    function saveText(tempScores)
    {
        tempScores[0] = onescore.text         //ones
        tempScores[1] = twoscore.text         //twos
        tempScores[2] = threescore.text        //threes
        tempScores[3] = fourscore.text        //fours
        tempScores[4] = fivescore.text        //fives
        tempScores[5] = sixscore.text        //sixes
        tempScores[6] = threeofkindscore.text        //threeofKind
        tempScores[7] = fourofkindscore.text        //fourofKind
        tempScores[8] = fullhousescore.text        //fullHouse
        tempScores[9] = smallstraightscore.text        //smallStraight
        tempScores[10] = largestraightscore.text       //largeStraight
        tempScores[11] = chancescore.text       //chance
        tempScores[12] = motherload1.text       //Motherload1
        tempScores[13] = motherload2.text       //Motherload2
        tempScores[14] = motherload3.text       //Motherload3
        tempScores[15] = topscore.text       //topSection score
        tempScores[16] = bonusscore.text       //bonus score
        tempScores[17] = totalscore.text        //total score
    }
    function disableButtons()
    {
        ones.enabled = false;
        twos.enabled = false;
        threes.enabled = false;
        fours.enabled = false;
        fives.enabled = false;
        sixes.enabled = false;
        threeofkind.enabled = false;
        fourofkind.enabled = false;
        motherload.enabled = false;
        smallstraight.enabled = false;
        largestraight.enabled = false;
        chance.enabled = false;
        fullhouse.enabled = false;
        finalize.enabled = false;
    }

    function enableButtons(tempScores)
    {
        if(tempScores[0] == "--")
        {
            ones.enabled = true;
        }
        else
            ones.opacity = .6;
        if(tempScores[1] == "--")
        {
            twos.enabled = true;
        }
        else
            twos.opacity = .6;
        if(tempScores[2] == "--")
        {
            threes.enabled = true;
        }
        else
            threes.opacity = .6;
        if(tempScores[3] == "--")
        {
            fours.enabled = true;
        }
        else
            fours.opacity = .6;
        if(tempScores[4] == "--")
        {
            fives.enabled = true;
        }
        else
            fives.opacity = .6;
        if(tempScores[5] == "--")
        {
            sixes.enabled = true;
        }
        else
            sixes.opacity = .6;
        if(tempScores[6] == "--")
        {
            threeofkind.enabled = true;
        }
        else
            threeofkind.opacity = .6;
        if(tempScores[7] == "--")
        {
            fourofkind.enabled = true;
        }
        else
            fourofkind.opacity = .6;
        if(tempScores[8] == "--")
        {
            fullhouse.enabled = true;
        }
        else
            fullhouse.opacity = .6;
        if(tempScores[9] == "--")
        {
            smallstraight.enabled = true;
        }
        else
            smallstraight.opacity = .6;
        if(tempScores[10] == "--")
        {
            largestraight.enabled = true;
        }
        else
            largestraight.opacity = .6;
        if(tempScores[11] == "--")
        {
            chance.enabled = true;
        }
        else
            chance.opacity = .6;
        if(tempScores[12] == "--" || (tempScores[13] == "--" && tempScores[12] != "0")|| (tempScores[14] == "--" && tempScores[13] != "0"))
        {
            motherload.enabled = true;
        }
        else
            motherload.opacity = .6;
    }
    function clearSaved(tempSaved)
    {
        tempSaved[0] = null
        tempSaved[1] = null
        tempSaved[2] = null
        tempSaved[3] = null
        tempSaved[4] = null
    }
