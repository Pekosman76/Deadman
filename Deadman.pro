TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += \
    assets.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    Scores.qml \
    Missile.qml \
    main.qml \
    Key.qml \
    Home.qml \
    Game.qml \
    Character.qml \
    Bonus.qml

