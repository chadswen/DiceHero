#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QtCore/QCoreApplication>
#include <math.h>
#include <QVarLengthArray>

#if defined(Q_OS_SYMBIAN) && defined(ORIENTATIONLOCK)
#include <eikenv.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>
#endif // Q_OS_SYMBIAN && ORIENTATIONLOCK

#define SENSITIVITY .154500
#define FREQUENCY 100 //hz
#define cQSize 20

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow)
{
    //initialize all data

    rawX = 0.0f;
    rawY = 0.0f;
    rawZ = 0.0f;

    calX = 0.0f;
    calY = 0.0f;
    calZ = 0.0f;

    filtX = 0.0f;
    filtY = 0.0f;
    filtZ = 0.0f;

    printX = 0.0f;
    printY = 0.0f;
    printZ = 0.0f;

    queuePos = 0;
    i = 0;
    xQ.resize(cQSize);
    yQ.resize(cQSize);
    zQ.resize(cQSize);

    queueFull = 0;

    ui->setupUi(this);
    accelerometerSensor = new QAccelerometer(this);

    if (!Timer.isActive())
        Timer.start(1000/FREQUENCY, this); //refresh rate, in ms

    // start the sensor
    if (!accelerometerSensor->isActive())
        accelerometerSensor->start();


    if (!accelerometerSensor->isActive())
    {
        qDebug() << "accelerometer sensor didn't start!" << endl;
    }

}

bool MainWindow::event(QEvent *event)
{
    switch (event->type()) {
    case QEvent::Timer:
        if (static_cast<QTimerEvent*>(event)->timerId() == Timer.timerId()){
            updateRawXYZ(); // update the xyz position
            processXYZ();
            if(queueFull)
                printXYZ();
        }
        break;
    default:
        break;
    }
    return QMainWindow::event(event);
}

void MainWindow::updateRawXYZ()
{
    reading = accelerometerSensor->reading();


    if (reading) {
        rawX = reading->x();// /.154488; (smallest reading increment)
        rawY = reading->y();// /.154488;
        rawZ = reading->z();// /.154488;

        // for debug purposes
        qDebug()  << "rawxacceleration x" << endl;
        qDebug()  << rawX << endl;

        qDebug()  << "rawyacceleration y" << endl;
        qDebug()  << rawY << endl;

        qDebug()  << "rawzacceleration z" << endl;
        qDebug()  << rawZ << endl;

     }
}

void MainWindow::calibrateXYZ() //obtains current acceleration offset, will eventually scale to real world gravity
{
    reading = accelerometerSensor->reading();
    calX = reading->x();
    calY = reading->y();
    calZ = reading->z();
}

void MainWindow::processXYZ() //filters raw data and applies calibration (Eventually use Kalman Filtering, if possible)
{


    /* adjust sensitivity scale
    if(qAbs(rawX - filtX) < SENSITIVITY)
        rawX=filtX;
    if(qAbs(rawY - filtY) < SENSITIVITY)
        rawY=filtY;
    if(qAbs(rawZ - filtZ) < SENSITIVITY)
        rawZ=filtZ;*/

    // circular queue filter
    if(queuePos == cQSize)
    {
        queueFull = 1;
        queuePos = 0;
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

    //for geometric mean of each queue (need to adjust for complex and 0, otherwise very fast and smooth)
    prodX = 1.0f;
    prodY = 1.0f;
    prodZ = 1.0f;

    //for arithemetic mean
    sumX = 0.0f;
    sumY = 0.0f;
    sumZ = 0.0f;

    for(i = 0; i< cQSize; i++)
    {
        /*prodX = prodX*xQ[i];
        prodY = prodY*yQ[i];
        prodZ = prodZ*zQ[i];*/

        sumX+= xQ[i];
        sumY+= yQ[i];
        sumZ+= zQ[i];
    }


    filtX = sumX/cQSize;
    filtY = sumY/cQSize;
    filtZ = sumZ/cQSize;

    /*filtX = pow(prodX, 1.0/cQSize);
    filtY = pow(prodY, 1.0/cQSize);
    filtZ = pow(prodZ, 1.0/cQSize);*/

    //final calibrated value
    printX = filtX - calX;
    printY = filtY - calY;
    printZ = filtZ - calZ;

    // for debug purposes
    qDebug()  << "processed x" << endl;
    qDebug()  << filtX << endl;

    qDebug()  << "processed y" << endl;
    qDebug()  << filtY << endl;

    qDebug()  << "processed z" << endl;
    qDebug()  << filtZ << endl;
}

void MainWindow::printXYZ() //print with applied calibration
{
    // set the text and display it on the screen
    ui->xLabel->setText("x: " + QString::number(printX, 'f', 2 ));
    ui->yLabel->setText("y: " + QString::number(printY, 'f', 2 ));
    ui->zLabel->setText("z: " + QString::number(printZ, 'f', 2 ));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::setOrientation(ScreenOrientation orientation)
{
#ifdef Q_OS_SYMBIAN
    if (orientation != ScreenOrientationAuto) {
#if defined(ORIENTATIONLOCK)
        const CAknAppUiBase::TAppUiOrientation uiOrientation =
                (orientation == ScreenOrientationLockPortrait) ? CAknAppUi::EAppUiOrientationPortrait
                    : CAknAppUi::EAppUiOrientationLandscape;
        CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
        TRAPD(error,
            if (appUi)
                appUi->SetOrientationL(uiOrientation);
        );
        Q_UNUSED(error)
#else // ORIENTATIONLOCK
        qWarning("'ORIENTATIONLOCK' needs to be defined on Symbian when locking the orientation.");
#endif // ORIENTATIONLOCK
    }
#elif defined(Q_WS_MAEMO_5)
    Qt::WidgetAttribute attribute;
    switch (orientation) {
    case ScreenOrientationLockPortrait:
        attribute = Qt::WA_Maemo5PortraitOrientation;
        break;
    case ScreenOrientationLockLandscape:
        attribute = Qt::WA_Maemo5LandscapeOrientation;
        break;
    case ScreenOrientationAuto:
    default:
        attribute = Qt::WA_Maemo5AutoOrientation;
        break;
    }
    setAttribute(attribute, true);
#else // Q_OS_SYMBIAN
    Q_UNUSED(orientation);
#endif // Q_OS_SYMBIAN
}

void MainWindow::showExpanded()
{
#ifdef Q_OS_SYMBIAN
    showFullScreen();
#elif defined(Q_WS_MAEMO_5) || defined(Q_WS_MAEMO_6)
    showMaximized();
#else
    show();
#endif
}
