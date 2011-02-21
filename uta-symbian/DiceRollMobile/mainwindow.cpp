#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QtCore/QCoreApplication>
#include <math.h>

#if defined(Q_OS_SYMBIAN) && defined(ORIENTATIONLOCK)
#include <eikenv.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>
#endif // Q_OS_SYMBIAN && ORIENTATIONLOCK

#define NOISE_THRESHOLD .160000

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent), ui(new Ui::MainWindow)
{
    //initialize all data to 0.0f

    filtX = 0.0f;
    filtY = 0.0f;
    filtZ = 0.0f;

    rawX = 0.0f;
    rawY = 0.0f;
    rawZ = 0.0f;

    calX = 0.0f;
    calY = 0.0f;
    calZ = 0.0f;

    printX = 0.0f;
    printY = 0.0f;
    printZ = 0.0f;

    ui->setupUi(this);
    accelerometerSensor = new QAccelerometer(this);

    if (!Timer.isActive())
        Timer.start(20, this); //refresh rate, in ms

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
        rawX = reading->x();
        rawY = reading->y();
        rawZ = reading->z();

        // for debug purposes
        qDebug()  << "rawxacceleration x" << endl;
        qDebug()  << rawX << endl;

        qDebug()  << "rawyacceleration y" << endl;
        qDebug()  << rawY << endl;

        qDebug()  << "rawzacceleration z" << endl;
        qDebug()  << rawZ << endl;

     }
}

void MainWindow::calibrateXYZ() //sets current orientation = 0
{
    reading = accelerometerSensor->reading();
    calX = reading->x();
    calY = reading->y();
    calZ = reading->z();
}

void MainWindow::processXYZ() //filters raw data and applies calibration
{


    // filter noise
    if(qAbs(rawX - filtX) < NOISE_THRESHOLD)
        rawX=filtX;
    if(qAbs(rawY - filtY) < NOISE_THRESHOLD)
        rawY=filtY;
    if(qAbs(rawZ - filtZ) < NOISE_THRESHOLD)
        rawZ=filtZ;

    // current value
    filtX = rawX;
    filtY = rawY;
    filtZ = rawZ;

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
    QLocale c(QLocale::C);

    ui->xLabel->setText("x: " + c.toString(printX));
    ui->yLabel->setText("y: " + c.toString(printY));
    ui->zLabel->setText("z: " + c.toString(printZ));
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
