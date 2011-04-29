function loadBonuses(tempScores)
{
    attbonustext.text = tempScores[0]       //attack bonus
    critrangetext.text = tempScores[1]       //critical range
    critmulttext.text = "x" + tempScores[2]       // critical multiplier
}

function loadAttBonus(tempScores)
{
    return tempScores[0]       //attack bonus
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
}

function inc5AttBonus(tempScores)
{
    if(Number(tempScores[0]) < 100)
    {
        tempScores[0] = Number(tempScores[0]) + 5;       //attack bonus
        return tempScores[0];
    }
}

function decAttBonus(tempScores)
{
    if(Number(tempScores[0]) > -100)
    {
        tempScores[0] = Number(tempScores[0]) - 1;       //attack bonus
        return tempScores[0];
    }
}

function dec5AttBonus(tempScores)
{
    if(Number(tempScores[0]) > -100)
    {
        tempScores[0] = Number(tempScores[0]) - 5;       //attack bonus
        return tempScores[0];
    }
}

function incCritMult(tempScores)
{
    if(Number(tempScores[2]) < 6)
    {
        tempScores[2] = Number(Number(tempScores[2]) + 1);
        return "x" + tempScores[2];
    }
}

function decCritMult(tempScores)
{
    if(Number(tempScores[2]) > 2)
    {
        tempScores[2] = Number(Number(tempScores[2]) - 1);
        return "x" + tempScores[2];
    }
}

function incCritRange(tempScores)
{
    if(Number(tempScores[1]) < 20)
    {
        tempScores[1] = Number(tempScores[1]) + 1;
        return tempScores[1] + " to 20";
    }
}

function decCritRange(tempScores)
{
    if(Number(tempScores[1]) > 1)
    {
        tempScores[1] = Number(tempScores[1]) - 1;
        return tempScores[1] + " to 20";
    }
}

function defaultBonuses(tempScores)
{
    tempScores[0] = "0"
    tempScores[1] = "20"
    tempScores[2] = "2"
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
    console.log("sum is " + sum);
    tempScores[3] = sum;
    return sum;
}
