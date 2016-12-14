#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "login.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Login login;

    engine.rootContext()->setContextProperty("Login",&login);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
