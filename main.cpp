#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "loginDlg.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    LoginDlg loginDlg(nullptr);

    engine.rootContext()->setContextProperty("LoginDlgPassword",&loginDlg);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
