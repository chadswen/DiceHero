#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QtGui/QMainWindow>
#include <QBasicTimer>
#include <QAccelerometer>

QTM_USE_NAMESPACE
namespace Ui {
    class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT
public:
    enum ScreenOrientation {
        ScreenOrientationLockPortrait,
        ScreenOrientationLockLandscape,
        ScreenOrientationAuto
    };

    explicit MainWindow(QWidget *parent = 0);
    virtual ~MainWindow();

    void setOrientation(ScreenOrientation orientation);
    void showExpanded();

public slots:
    void calibrateXYZ();

protected:
    bool event(QEvent *event);

private:
    Ui::MainWindow *ui;
    void updateRawXYZ();
    void processXYZ();
    void printXYZ();

private:
    QAccelerometer *accelerometerSensor;
    QAccelerometerReading *reading;
    QBasicTimer Timer;
    qreal rawX;
    qreal rawY;
    qreal rawZ;

    qreal filtX;
    qreal filtY;
    qreal filtZ;

    qreal calX;
    qreal calY;
    qreal calZ;

    qreal printX;
    qreal printY;
    qreal printZ;
};

#endif // MAINWINDOW_H
