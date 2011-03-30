var counter = 0;
function clearData(dieClicks) {
        dieClicks[0] = 0;
        dieClicks[1] = 0;
        dieClicks[2] = 0;
        dieClicks[3] = 0;
        dieClicks[4] = 0;
}

function finalize(myDice, dieClicks, rollResults, saved)
{
    var tempcount = 0;
    var savecount = 0;
    for(tempcount=0; tempcount<5; tempcount++)
    {
        if(dieClicks[tempcount] % 2 == 1)
        {
            myDice[1] = myDice[1]+1;
        }
        else
        {
            saved[savecount] = rollResults[1][tempcount];
            savecount++;
        }
    }
}

function die1Click(dieClicks){
    dieClicks[0]++;
}
function die2Click(dieClicks){
    dieClicks[1]++;
}
function die3Click(dieClicks){
    dieClicks[2]++;
}
function die4Click(dieClicks){
    dieClicks[3]++;
}
function die5Click(dieClicks){
    dieClicks[4]++;
}
function motherloadDice(myDice)
{
        myDice[1] = 5;
}
function gettext(rollResults, saved, num)
{
    var temp = rollResults;
    if(temp[1][num] == null)
    {
        var temp = saved[4-num];
        return temp;
    }
    else
    {
        var temp = rollResults[1][num];
        return temp;
    }
}
