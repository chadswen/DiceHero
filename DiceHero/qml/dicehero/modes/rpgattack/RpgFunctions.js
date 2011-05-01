function loadBonuses(tempScores)
{
    attbonustext.text = tempScores[0]       //attack bonus
    critrangetext.text = tempScores[1]       //critical range
    critmulttext.text = "x" + tempScores[2]       // critical multiplier
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

function defaultBonuses(tempScores)
{
    tempScores[0] = "0" //att. bon.
    tempScores[1] = "20" //crit. range
    tempScores[2] = "2" //crit. multi. 3 is damage sum
    tempScores[4] = "0" //damage bonus
    tempScores[5] = "false" //critical hit?
    tempScores[6] = "true" //weapon is lethal? (can score critical hits)
    tempScores[7] = "true"  //add damage bonus before multiplying?
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
            sum = sum + Number(rollResults[i][j])
        }
    }
    if(tempScores[7] == "true")
    {
        sum = sum + tempScores[4];
    }
    if(tempScores[5] == "true" && tempScores[6] == "true")        //if this is a confirmed critical hit & lethal
    {
        console.log("multiplying hit. sum is: " + sum + "\n")
        sum = sum * tempScores[2]    //multiplies damage sum by crit. multiplier
        console.log("sum is now: " + sum + "\n")
    }
    if(tempScores[7] == "false")
    {
        sum = sum + tempScores[4];
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

function toggleDamageAdd(tempScores)
{
    if(tempScores[7] == "true")
        tempScores[7] = "false";
    else if(tempScores[7] == "false")
        tempScores[7] = "true";
}
