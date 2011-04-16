#include <QtDeclarative>
#include <QtGui>
#include <QAccelerometer>

#include "accelerometerfilter.h"
#include <box2dplugin.h>

QAccelerometer *acc;
accelerometerFilter *accF;

QTM_USE_NAMESPACE

int main(int argc, char *argv[])
{
    // create the application
    QApplication app(argc, argv);

    // create the QML view helper
    QDeclarativeView view;

    //associate and register box2d

    Box2DPlugin plugin;
    plugin.registerTypes("Box2D");


    //setup accelerometer
    acc= new QAccelerometer(0);
    accelerometerFilter accF;
    acc->addFilter(&accF);


    //setup QML viewer

        // For Symbian use screen resolution but for desktop use different size
    #if defined(Q_OS_SYMBIAN)
        // Get screen dimensions
        QDesktopWidget *desktop = QApplication::desktop();
        QRect screenRect = desktop->screenGeometry();
    #else
        // On desktop we use nHD
        QPoint topLeft(100,100);
        QSize size(360, 640);
        QRect screenRect(topLeft, size);
    #endif


    // Set the screen size to QML context
    QDeclarativeContext* context = view.rootContext();

    //correct for portrait
    if(screenRect.width()>screenRect.height())
    {
        //swap dimensions if landscape dimensions are detected
        context->setContextProperty("screenWidth", screenRect.height());
        context->setContextProperty("screenHeight", screenRect.width());
    }
    else
    {
        context->setContextProperty("screenWidth", screenRect.width());
        context->setContextProperty("screenHeight", screenRect.height());
    }


    view.setSource(QUrl("qrc:/qml/dicehero/main.qml"));
    view.setResizeMode(QDeclarativeView::SizeRootObjectToView);



    QObject *rootObject = dynamic_cast<QObject*>(view.rootObject());

    //associate Qt / QML signals and slots
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
        // Lock orientation to portrait
        view.setAttribute(Qt::WA_LockPortraitOrientation, true);
        view.showFullScreen();
    #else
        view.show();
    #endif

    // Start application loop
    return app.exec();
}
