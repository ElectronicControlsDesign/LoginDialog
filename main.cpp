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

    auto const rootContext = engine.rootContext();
    if (rootContext != nullptr)
    {
        rootContext->setContextProperty("LoginDlgPassword", &loginDlg);
        engine.load(QUrl(QLatin1String("qrc:/main.qml")));

//        auto const loginDlgObject = object->findChild<QObject*>("loginDlg");
//        if (loginDlgObject != nullptr)
//        {
//            // Why not use QObject::connect?
//            QObject::connect
//                (
//                    loginDlgObject,
//                    SIGNAL(signalAccepted()),
//                    &loginDlgConnection,
//                    SLOT(handleOnAccepted())
//                );
//        }
//        else
//        {
//            // LOG(Log::Severity::error, Log::Category::initialize, "Connect failed.");
//        }
    }
    else
    {
        // LOG(Log::Severity::error, Log::Category::initialize, "Load failed.");
    }
    return app.exec();
}
