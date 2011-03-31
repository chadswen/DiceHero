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
        if(numbSection > 62)
        {
            total += 35
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
                matches += 1;
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

    function BubbleSort(dice)
    {
            do                                         //bubble sort
            {
               var swapped = false;
                for(i=0; i<dice.legnth-1; i++)
                {
                    if(dice[i]>dice[i+1])
                    {
                        swapped = true;
                        var temp = dice[i];
                        dice[i] = dice[i+1];
                        dice[i+1] = temp;
                    }
                }
            }while(swapped);
     }
