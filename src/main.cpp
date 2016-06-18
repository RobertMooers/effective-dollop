#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QSurfaceFormat>
#include "game.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<Game>("com.mooers.robert.gui",1,0,"Game");
    qmlRegisterType<Building>("com.mooers.robert.gui",1,0,"Building");
    qmlRegisterType<Item>("com.mooers.robert.gui",1,0,"Item");
    qmlRegisterType<InvItem>("com.mooers.robert.gui",1,0,"InvItem");

    Game game;

    if (!game.loadGame())
            return 1;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("game", &game);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    app.exec();

    if (!game.saveGame())
            return 1;

    return 0;
}
