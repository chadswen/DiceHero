#include <QtDeclarative>
#include <QtGui>
#include <QAccelerometer>

#include "accelerometerfilter.h"


QAccelerometer *acc;
accelerometerFilter *accF;

// Lock orientation in Symbian
#ifdef Q_OS_SYMBIAN
    #include <eikenv.h>
    #include <eikappui.h>
    #include <aknenv.h>
    #include <aknappui.h>
#endif

QTM_USE_NAMESPACE

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    //setup QML viewer
    #ifdef Q_OS_SYMBIAN
        // Lock orientation to portrait in Symbian
        CAknAppUi* appUi = dynamic_cast<CAknAppUi*> (CEikonEnv::Static()->AppUi());
        TRAP_IGNORE(
            if (appUi)
                appUi->SetOrientationL(CAknAppUi::EAppUiOrientationPortrait);
        )
    #endif

    //! [0]
    QDeclarativeView view;
    view.setSource(QUrl("qrc:/qml/main.qml"));
    view.setResizeMode(QDeclarativeView::SizeRootObjectToView);
    //! [0]

    //setup accelerometer
    acc= new QAccelerometer(0);
    accelerometerFilter accF;
    acc->addFilter(&accF);

    QObject *rootObject = dynamic_cast<QObject*>(view.rootObject());

    // Associate Qt / QML signals and slots

    QObject::connect(&accF, SIGNAL(xChanged(const QVariant&)),
                     rootObject, SLOT(updateX(const QVariant&)));
    QObject::connect(&accF, SIGNAL(yChanged(const QVariant&)),
                     rootObject, SLOT(updateY(const QVariant&)));
    QObject::connect(&accF, SIGNAL(zChanged(const QVariant&)),
                     rootObject, SLOT(updateZ(const QVariant&)));

    QObject::connect(rootObject, SIGNAL(calibrate()),
                     &accF, SLOT(calibrateXYZ()));

    QObject::connect((QObject*)view.engine(), SIGNAL(quit()),
                     &app, SLOT(quit()));

    //start the acceleromter
    acc->start();

    if (!acc->isActive())
        qDebug() << "accelerometer sensor didn't start!" << endl;

    //show the view

    #if defined(Q_WS_MAEMO_5) || defined(Q_OS_SYMBIAN) || defined(Q_WS_SIMULATOR)
        view.setGeometry(QApplication::desktop()->screenGeometry());
        view.showFullScreen();
    #else
        view.setGeometry((QRect(100, 100, 800, 480)));
        view.show();
    #endif


    return app.exec();
}
