#include "accelerometerFilter.h"
#include <QDebug>

#define SENSITIVITY .154500
#define FREQUENCY 40 //hz
#define cQSize 20 //size of circular queues
#define PRECISION 2 //number of decimal points

accelerometerFilter::accelerometerFilter()
    : outX(0),outY(0),outZ(0)
{

    rawX = 0.0f;
    rawY = 0.0f;
    rawZ = 0.0f;

    calX = 0.0f;
    calY = 0.0f;
    calZ = 0.0f;

    filtX = 0.0f;
    filtY = 0.0f;
    filtZ = 0.0f;

    vect = 0.0f;

    queuePos = 0;
    queueFull = 0;
    xQ.resize(cQSize);
    yQ.resize(cQSize);
    zQ.resize(cQSize);
}

bool accelerometerFilter::filter(QAccelerometerReading *externalReading)
{
    reading=externalReading;
    updateRawXYZ(); // update the xyz position
    processXYZ();  //apply filters
    emit xChanged(QString::number(outX, 'f', PRECISION )); //send xyz signals
    emit yChanged(QString::number(outY, 'f', PRECISION ));
    emit zChanged(QString::number(outZ, 'f', PRECISION ));
    return false;
}

void accelerometerFilter::updateRawXYZ()
{

    if (reading) {
        rawX = reading->x();// /.154488; //(smallest reading increment)
        rawY = reading->y();// /.154488;
        rawZ = reading->z();// /.154488;

        // for debug purposes
        /*qDebug()  << "rawxacceleration x" << endl;
        qDebug()  << rawX << endl;

        qDebug()  << "rawyacceleration y" << endl;
        qDebug()  << rawY << endl;

        qDebug()  << "rawzacceleration z" << endl;
        qDebug()  << rawZ << endl; */

     }
}

void accelerometerFilter::calibrateXYZ() //obtains current acceleration offset
{
    calX = filtX *-1;
    calY = filtY *-1;
    calZ = filtZ *-1;
}

void accelerometerFilter::processXYZ() //filters raw data and applies calibration (Eventually use Kalman Filtering, if possible)
{


    /* //adjust sensitivity scale
    if(qAbs(rawX - filtX) < SENSITIVITY)
        rawX=filtX;
    if(qAbs(rawY - filtY) < SENSITIVITY)
        rawY=filtY;
    if(qAbs(rawZ - filtZ) < SENSITIVITY)
        rawZ=filtZ;*/

    // circular queue filter
    if(queuePos == cQSize)
    {
        queuePos = 0;
        queueFull = 1;
    }



    //enqueue each axis
    xQ[queuePos] = rawX;
    yQ[queuePos] = rawY;
    zQ[queuePos] = rawZ;

    queuePos++;

    /*//for median of each queue
    qSort(xQ);
    qSort(yQ);
    qSort(zQ);

    filtX = xQ[(cQSize-1)/2];
    filtY = yQ[(cQSize-1)/2];
    filtZ = zQ[(cQSize-1)/2];*/

    /*//for geometric mean of each queue (still need to adjust for complex and 0, otherwise very fast and smooth)
    prodX = 1.0f;
    prodY = 1.0f;
    prodZ = 1.0f;*/

    //for arithemetic mean
    sumX = 0.0f;
    sumY = 0.0f;
    sumZ = 0.0f;

    for(int i = 0; i< cQSize; i++)
    {
        /* for geo mean
        prodX = prodX*xQ[i];
        prodY = prodY*yQ[i];
        prodZ = prodZ*zQ[i];*/

        sumX+= xQ[i];
        sumY+= yQ[i];
        sumZ+= zQ[i];
    }


    filtX = sumX/cQSize;
    filtY = sumY/cQSize;
    filtZ = sumZ/cQSize;


    //vect =(sqrt(filtX*filtX + filtY*filtY + filtZ*filtZ)); // calculate acceleration vector

    //fills initial queue
    if(!queueFull)
        processXYZ();


    /*filtX = pow(prodX, 1.0/cQSize);
    filtY = pow(prodY, 1.0/cQSize);
    filtZ = pow(prodZ, 1.0/cQSize);*/

    //final calibrated value
    outX = filtX + calX;
    outY = filtY + calY;
    outZ = filtZ + calZ;

    // for debug purposes
    qDebug()  << "processed x" << endl;
    qDebug()  << filtX << endl;

    qDebug()  << "processed y" << endl;
    qDebug()  << filtY << endl;

    qDebug()  << "processed z" << endl;
    qDebug()  << filtZ << endl;

    /*qDebug()  << "component vector" << endl;
    qDebug()  << vect << endl;*/

    reading->setX(outX);
    reading->setY(outY);
    reading->setZ(outZ);
}


QVector<QString> accelerometerFilter::getXYZ() //get processed vector with applied calibrations
{
    // create a string QVector of the current values
    QVector<QString> vectXYZ(3);
    vectXYZ[0] = QString::number(outX, 'f', PRECISION );
    vectXYZ[1] = QString::number(outY, 'f', PRECISION );
    vectXYZ[2] = QString::number(outZ, 'f', PRECISION );

    return vectXYZ;
}
