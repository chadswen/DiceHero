var counter = 0;
function clearData(dieClicks) {
        dieClicks[0] = false;
        dieClicks[1] = false;
        dieClicks[2] = false;
        dieClicks[3] = false;
        dieClicks[4] = false;
}

function finalize(myDice, dieClicks, rollResults, saved)
{
    var tempcount = 0;
    var savecount = 0;
    for(tempcount=0; tempcount<5; tempcount++)
    {
        if(dieClicks[tempcount])
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
    dieClicks[0]= !dieClicks[0];
}
function die2Click(dieClicks){
    dieClicks[1]= !dieClicks[1];
}
function die3Click(dieClicks){
    dieClicks[2]= !dieClicks[2];
}
function die4Click(dieClicks){
    dieClicks[3]= !dieClicks[3];
}
function die5Click(dieClicks){
    dieClicks[4]= !dieClicks[4];
}
function motherloadDice(myDice)
{
        myDice[1] = 5;
}
