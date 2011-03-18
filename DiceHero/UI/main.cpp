#include <QtDeclarative/QDeclarativeView>
#include <QtGui>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QDeclarativeView view;
    QString absolutePath = QCoreApplication::applicationDirPath () +
            "/init.qml";
    view.setSource(QUrl::fromLocalFile(absolutePath));
    view.show();
    return app.exec();
}
