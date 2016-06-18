TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    building.cpp \
    item.cpp \
    invitem.cpp \
    game.cpp

RESOURCES += qml.qrc \
    audio.qrc \
    images.qrc

RC_ICONS = ../image/effective-dollop-icon.ico

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    game.h \
    building.h \
    item.h \
    invitem.h
