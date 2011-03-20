QT += core gui declarative

symbian:TARGET.UID3 = 0xE0947FC2

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices


CONFIG += mobility
MOBILITY += sensors
INCLUDEPATH += .
include(qmlbox2d/box2d-static.pri)

INCLUDEPATH += ../../../src/sensors

TARGET = dicehero
TEMPLATE = app
VERSION = 1.0


SOURCES += main.cpp \
    accelerometerFilter.cpp \


HEADERS += \
    accelerometerFilter.h \



OTHER_FILES += qml/*.qml \
    qml/*.png \

RESOURCES = resources.qrc

symbian {
    TARGET = DiceHero

    # To lock the application to landscape orientation
    LIBS += -lcone -leikcore -lavkon

    ICON = DiceHero.svg
}
