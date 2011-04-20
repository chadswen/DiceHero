function loadBonuses(tempScores)
{
    attbonustext.text = tempScores[0]       //attack bonus
    critrangetext.text = tempScores[1]       //critical range
    critmulttext.text = tempScores[2]       // critical multiplier
}

function defaultBonuses(tempScores)
{
    tempScores[0] = 0
    tempScores[1] = 20
    tempScores[2] = x2
}
