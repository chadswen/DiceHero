/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created: Mon Feb 21 03:38:40 2011
**      by: Qt User Interface Compiler version 4.6.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QMainWindow>
#include <QtGui/QMenuBar>
#include <QtGui/QPushButton>
#include <QtGui/QSpacerItem>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralWidget;
    QVBoxLayout *verticalLayout_2;
    QVBoxLayout *verticalLayout;
    QLabel *accLabel;
    QLabel *xLabel;
    QLabel *yLabel;
    QLabel *zLabel;
    QSpacerItem *verticalSpacer;
    QLabel *calLabel;
    QPushButton *calButton;
    QMenuBar *menuBar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(200, 320);
        QIcon icon;
        icon.addFile(QString::fromUtf8("dice.svg"), QSize(), QIcon::Normal, QIcon::Off);
        MainWindow->setWindowIcon(icon);
        centralWidget = new QWidget(MainWindow);
        centralWidget->setObjectName(QString::fromUtf8("centralWidget"));
        verticalLayout_2 = new QVBoxLayout(centralWidget);
        verticalLayout_2->setSpacing(6);
        verticalLayout_2->setContentsMargins(11, 11, 11, 11);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setSpacing(6);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        accLabel = new QLabel(centralWidget);
        accLabel->setObjectName(QString::fromUtf8("accLabel"));

        verticalLayout->addWidget(accLabel);

        xLabel = new QLabel(centralWidget);
        xLabel->setObjectName(QString::fromUtf8("xLabel"));

        verticalLayout->addWidget(xLabel);

        yLabel = new QLabel(centralWidget);
        yLabel->setObjectName(QString::fromUtf8("yLabel"));

        verticalLayout->addWidget(yLabel);

        zLabel = new QLabel(centralWidget);
        zLabel->setObjectName(QString::fromUtf8("zLabel"));

        verticalLayout->addWidget(zLabel);


        verticalLayout_2->addLayout(verticalLayout);

        verticalSpacer = new QSpacerItem(20, 40, QSizePolicy::Minimum, QSizePolicy::Expanding);

        verticalLayout_2->addItem(verticalSpacer);

        calLabel = new QLabel(centralWidget);
        calLabel->setObjectName(QString::fromUtf8("calLabel"));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(calLabel->sizePolicy().hasHeightForWidth());
        calLabel->setSizePolicy(sizePolicy);
        calLabel->setMinimumSize(QSize(0, 0));
        calLabel->setMaximumSize(QSize(16777215, 16777215));
        calLabel->setLayoutDirection(Qt::LeftToRight);
        calLabel->setScaledContents(true);
        calLabel->setWordWrap(true);

        verticalLayout_2->addWidget(calLabel);

        calButton = new QPushButton(centralWidget);
        calButton->setObjectName(QString::fromUtf8("calButton"));

        verticalLayout_2->addWidget(calButton);

        MainWindow->setCentralWidget(centralWidget);
        menuBar = new QMenuBar(MainWindow);
        menuBar->setObjectName(QString::fromUtf8("menuBar"));
        menuBar->setGeometry(QRect(0, 0, 200, 21));
        MainWindow->setMenuBar(menuBar);

        retranslateUi(MainWindow);
        QObject::connect(calButton, SIGNAL(clicked()), MainWindow, SLOT(calibrateXYZ()));

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "Accelerations", 0, QApplication::UnicodeUTF8));
        accLabel->setText(QApplication::translate("MainWindow", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:10pt; font-weight:600;\">Accelerations:</span></p></body></html>", 0, QApplication::UnicodeUTF8));
        xLabel->setText(QString());
        yLabel->setText(QString());
        zLabel->setText(QString());
        calLabel->setText(QApplication::translate("MainWindow", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:8pt;\">To Calibrate, hold your device in the desired starting position and press below.</span></p></body></html>", 0, QApplication::UnicodeUTF8));
        calButton->setText(QApplication::translate("MainWindow", "Calibrate", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
