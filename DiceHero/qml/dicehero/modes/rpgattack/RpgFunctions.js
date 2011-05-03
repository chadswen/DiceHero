function defaultBonuses(tempScores)
{
    tempScores[0] = "0" //att. bon.
    tempScores[1] = "20" //crit. range
    tempScores[2] = "2" //crit. multi. 3 is damage sum
    tempScores[4] = "0" //damage bonus
    //tempScores[3] is the damage sum
    tempScores[5] = "false" //critical hit?
    tempScores[6] = "true" //weapon is lethal? (can score critical hits)
    tempScores[7] = "true"  //add damage bonus before multiplying?
    tempScores[8] = "1"     //damage multiplier
}

function loadAttBonus(tempScores)
{
    if(tempScores[0]>=0)
        return "+" + tempScores[0]       //attack bonus
    else
        return tempScores[0]
}

function loadCritMult(tempScores)
{
    return "x" + tempScores[2]       //critical multiplier
}

function loadDamageMult(tempScores)
{
    return "x" + tempScores[8]       //damage multiplier
}

function loadCritRange(tempScores)
{
    return tempScores[1] + " to 20"       //critical multiplier
}

function incAttBonus(tempScores)
{
    if(Number(tempScores[0]) < 100)
    {
        tempScores[0] = Number(tempScores[0]) + 1;       //attack bonus
        return tempScores[0];
    }
    else
        return tempScores[0];
}

function inc5AttBonus(tempScores)
{
    if(Number(tempScores[0]) < 100)
    {
        tempScores[0] = Number(tempScores[0]) + 5;       //attack bonus
        return tempScores[0];
    }
    else
        return tempScores[0];
}

function decAttBonus(tempScores)
{
    if(Number(tempScores[0]) > -100)
    {
        tempScores[0] = Number(tempScores[0]) - 1;       //attack bonus
        return tempScores[0];
    }
    else
        return tempScores[0];
}

function dec5AttBonus(tempScores)
{
    if(Number(tempScores[0]) > -100)
    {
        tempScores[0] = Number(tempScores[0]) - 5;       //attack bonus
        return tempScores[0];
    }
    else
        return tempScores[0];
}

function incCritMult(tempScores)
{
    if(Number(tempScores[2]) < 6)
    {
        tempScores[2] = Number(Number(tempScores[2]) + 1);
        return "x" + tempScores[2];
    }
    else
        return "x" + tempScores[2];
}

function decCritMult(tempScores)
{
    if(Number(tempScores[2]) > 2)
    {
        tempScores[2] = Number(Number(tempScores[2]) - 1);
        return "x" + tempScores[2];
    }
    else
        return "x" + tempScores[2];
}

function incCritRange(tempScores)
{
    if(Number(tempScores[1]) < 20)
    {
        tempScores[1] = Number(tempScores[1]) + 1;
        return tempScores[1] + " to 20";
    }
    else
        return tempScores[1] + " to 20";
}

function decCritRange(tempScores)
{
    if(Number(tempScores[1]) > 1)
    {
        tempScores[1] = Number(tempScores[1]) - 1;
        return tempScores[1] + " to 20";
    }
    else
        return tempScores[1] + " to 20";
}

function loadDamageBonus(tempScores)
{
    if(tempScores[4]>=0)
        return "+" + tempScores[4];
    else
        return tempScores[4];
}

function incDamageBonus(tempScores)
{
    if(Number(tempScores[4]) < 100)
    {
        tempScores[4] = Number(tempScores[4]) + 1;       //attack bonus
        return tempScores[4];
    }
    else
        return tempScores[4];
}

function inc5DamageBonus(tempScores)
{
    if(Number(tempScores[4]) < 100)
    {
        tempScores[4] = Number(tempScores[4]) + 5;       //attack bonus
        return tempScores[4];
    }
    else
        return tempScores[4];
}

function decDamageBonus(tempScores)
{
    if(Number(tempScores[4]) > -100)
    {
        tempScores[4] = Number(tempScores[4]) - 1;       //attack bonus
        return tempScores[4];
    }
    else
        return tempScores[4];
}

function dec5DamageBonus(tempScores)
{
    if(Number(tempScores[4]) > -100)
    {
        tempScores[4] = Number(tempScores[4]) - 5;       //attack bonus
        return tempScores[4];
    }
    else
        return tempScores[4];
}

function sum(myDice, rollResults, tempScores)
{
    var sum = 0;
    var i, j;
    console.log("myDice = " + myDice + "\n")
    for(i=0; i < 6; i++)
    {
        for(j=0; j < myDice[i]; j++)
        {
            console.log("Adding dice. sum is currently: " + sum + "\n")
            sum = Number(Number(sum) + Number(rollResults[i][j]))
            console.log("Added dice. sum is: " + sum + "\n")
        }
    }
    if(tempScores[7] == "true")                                  //damage bonus is added before multiplying
    {
        console.log("adding damage bonus current: " + sum + "\n")
        sum = Number((Number(sum) + Number(tempScores[4]))*Number(tempScores[8]));
        console.log("after adding damage bonus: " + sum + "\n")
    }
    if(tempScores[5] == "true" && tempScores[6] == "true")        //if this is a confirmed critical hit & lethal
    {
        //Debugging:console.log("multiplying hit. sum is: " + sum + "\n")
        sum = Number(sum) * tempScores[2]   //multiplies damage sum by crit. multiplier
        //Debugging: console.log("sum is now: " + sum + "\n")
    }
    if(tempScores[7] == "false")                                //damage bonus is added after multiplying
    {
        console.log("adding damage bonus current: " + sum + "\n")
        sum = Number(Number(sum)* Number(tempScores[8]) + Number(tempScores[4]));
        console.log("after adding damage bonus: " + sum + "\n")
    }

    tempScores[3] = sum;
    return sum;
}

function toggleLethal(tempScores)
{
    if(tempScores[6] == "true")
        tempScores[6] = "false";
    else if(tempScores[6] == "false")
        tempScores[6] = "true";
}

function getSum(tempScores)
{
    return tempScores[3];
}

function toggleDamageAdd(tempScores)
{
    if(tempScores[7] == "true")
        tempScores[7] = "false";
    else if(tempScores[7] == "false")
        tempScores[7] = "true";
}

function breakdowndamage(scoreFields)
{
        if((scoreFields[5] == "false") || (scoreFields[6] == "false"))        //If not a critical hit or the weapon is not lethal
        {
            if(scoreFields[8] == "1")   //no damage multiplier has been chosen
                return "Breakdown: \n" + Number(Number(scoreFields[3]) - Number(scoreFields[4])) + " + " + Number(scoreFields[4])
            else if(scoreFields[7] == "true")   //damage multiplier has been chosen and the damage is added before multiplying
                return "Breakdown: \n(" + Number(Number(Number(scoreFields[3]) / Number(scoreFields[8]) - Number(scoreFields[4]))) + " + " + Number(scoreFields[4]) + ")*" + Number(scoreFields[8])
            else if(scoreFields[7] == "false")  //damage multiplier has been chosen and the damage is added after multiplying
                return "Breakdown: \n(" + Number((Number(scoreFields[3]) - Number(scoreFields[4]))/ Number(scoreFields[8])) + ")*" + Number(scoreFields[8]) + " + " + Number(scoreFields[4])
        }
        else if(scoreFields[7] == "true")                                 //If damage is added before multiplying
            return "Breakdown: \n(" + Number(Number(Number(scoreFields[3]) / (Number(scoreFields[2]*Number(scoreFields[8]))) - Number(scoreFields[4]))) + " + " + Number(scoreFields[4]) + ")*" + Number(scoreFields[2])*Number(scoreFields[8])
        else if(scoreFields[7] == "false")                                //If damage is added after multiplying
            return "Breakdown: \n(" + Number((Number(scoreFields[3]) - Number(scoreFields[4]))/ (Number(scoreFields[2])*Number(scoreFields[8]))) + ")*" + Number(scoreFields[2])*Number(scoreFields[8]) + " + " + Number(scoreFields[4])
}

function decDamageMult(tempScores)
{
    if(Number(tempScores[8]) > 1)
    {
        tempScores[8] = Number(tempScores[8]) - 1;       //damage multiplier
        return "x" + tempScores[8];
    }
    else
        return "x" + tempScores[8];
}

function incDamageMult(tempScores)
{
    if(Number(tempScores[8]) < 50)
    {
        tempScores[8] = Number(tempScores[8]) + 1;       //damage multiplier
        return "x" + tempScores[8];
    }
    else
        return "x" + tempScores[8];
}

function decSmallDamageMult(tempScores)
{
    if(Number(tempScores[8]) > .25)
    {
        tempScores[8] = Number(tempScores[8]) - .25;       //damage multiplier
        return "x" + tempScores[8];
    }
    else
        return "x" + tempScores[8];
}

function decBigDamageMult(tempScores)
{
    if(Number(tempScores[8]) >= 10.25)
    {
        tempScores[8] = Number(tempScores[8]) - 10;       //damage multiplier
        return "x" + tempScores[8];
    }
    else
        return "x" + tempScores[8];
}

function incSmallDamageMult(tempScores)
{
    if(Number(tempScores[8]) < 50)
    {
        tempScores[8] = Number(tempScores[8]) + .25;       //damage multiplier
        return "x" + tempScores[8];
    }
    else
        return "x" + tempScores[8];
}


function incBigDamageMult(tempScores)
{
    if(Number(tempScores[8]) <= 40)
    {
        tempScores[8] = Number(tempScores[8]) + 10;       //damage multiplier
        return "x" + tempScores[8];
    }
    else
        return "x" + tempScores[8];
}
