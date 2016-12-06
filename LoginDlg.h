#ifndef LOGINDLG_H
#define LOGINDLG_H

#include <string>

#include <QObject>
#include <QString>

// TODO: Does this make sense to have a set of bindings from the QML to a single C++ class or is it better to map each QML item to a class or some other option?

class LoginDlg : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString usernameLabel READ getUsernameLabel NOTIFY onUsernameLabelChanged)

private:
    std::string usernameLabel_;// TODO: Should be a tstring.
    std::string username_;// TODO: Should be a tstring.
    std::string passwordLabel_;// TODO: Should be a tstring.
    std::string password_;// TODO: Should be a tstring.

public:
    explicit LoginDlg(QObject *parent);
    ~LoginDlg();

    // TODO: Verify the UsernameLabel is using best practices, then duplicate for other dialog items.

    void setUsernameLabel(const std::string& value); // TODO: Should be a tstring.

public:
    QString getUsernameLabel() const;

signals:
    void onUsernameLabelChanged();

public slots:
    /* Q_INVOKABLE */ void handleOnAccepted(); // TODO: Doesn't appear Q_INVOKABLE does help with slots at all. Prove it does.
};

#endif // LOGINDLG_H
