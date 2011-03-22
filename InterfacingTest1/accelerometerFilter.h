#ifndef ACCELEROMETERFILTER_H
#define ACCELEROMETERFILTER_H

//! [0]
#include <QtCore>
#include <QAccelerometer>
#include <QAccelerometerReading>
#include <QAccelerometerFilter>
#include <QVarLengthArray>
#include <QtCore/QCoreApplication>
#include <math.h>
#include <QVariant>
#include <QObject>


QTM_USE_NAMESPACE

class accelerometerFilter
        : public QObject, public QAccelerometerFilter
{
Q_OBJECT

private:
    qreal rawX;
    qreal rawY;
    qreal rawZ;

    int queuePos;
    bool queueFull;

    QVarLengthArray<qreal> xQ;
    QVarLengthArray<qreal> yQ;
    QVarLengthArray<qreal> zQ;

    qreal prodX;
    qreal prodY;
    qreal prodZ;

    qreal sumX;
    qreal sumY;
    qreal sumZ;

    qreal filtX;
    qreal filtY;
    qreal filtZ;
    qreal vect;

    qreal calX;
    qreal calY;
    qreal calZ;

protected:
    qreal outX;
    qreal outY;
    qreal outZ;


public:
    accelerometerFilter();
    bool filter(QAccelerometerReading *externalReading);
    QAccelerometerReading *reading;

public slots:
    void calibrateXYZ();
    QVector<QString> getXYZ();

private:

    void updateRawXYZ();
    void processXYZ();



signals:
    void xChanged(const QVariant &outVX);
    void yChanged(const QVariant &outVY);
    void zChanged(const QVariant &outVZ);

};
//! [0]
#endif // ACCELEROMETERFILTER_H
