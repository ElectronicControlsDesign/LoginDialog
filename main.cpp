#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "LoginDlg.h"

int main(int argc, char *argv[])
{
    int result =-1;

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml"))); // TODO: Why does QUrl::fromLocalFile("application.qml") fail? Should it work? I see examples that use: qrc:///main.qml, what is this?

    // TODO: Move to place to invoke after application is running and only when user asks for login.
    const auto const qmlRootContext = engine.rootContext(); // TODO: How do I tell the variable type Qt Creator? // Need to work out the warning here
    if (qmlRootContext != nullptr)
    {
        const auto const firstObject = engine.rootObjects().first(); // TODO: Is this the top of the QML tree?

        if (firstObject != nullptr)
        {
            const auto const loginDlgObject = firstObject->findChild<QObject*>("LoginDlg"); // Is "LoginDlg" the ObjectName in QML?
            LoginDlg loginDlg(nullptr); // TODO: What is the actual parent?

            loginDlg.setUsernameLabel("TODO Label: "); // TODO: Use i18n string here.
            // TODO: qmlRootContext.setContextProperty("LoginDlg",&loginDlg);
            // ...
            result = app.exec();

        }
        else
        {
            // TODO: LOG(Log::Severity::error, Log::Category::initialize | Log::Category::communication, "Unable to find first QML object."); // TODO: Verify message makes sense.
        }
    }
    else
    {
        // TODO: LOG(Log::Severity::error, Log::Category::initialize | Log::Category::communication, "Unable to find root context.");
    }

    return result;
}
