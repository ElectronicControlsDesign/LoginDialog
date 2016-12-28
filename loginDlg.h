#ifndef LOGINDLG_H
#define LOGINDLG_H

#include <QObject>
#include <QString>
#include <QStringList>

#define _WSTR(s) L ## s // Wide string

class LoginDlg : public QObject
{
    Q_OBJECT

private:
    using TCHAR = wchar_t;
    using tchar_type = TCHAR;
    using tstring = std::basic_string<tchar_type>;

private:
    tstring usernameLabel_;
    tstring username_;
    tstring passwordLabel_;
    tstring password_;

    static const tchar_type* userList_[];

public:
    explicit LoginDlg(QObject* const parent);

    Q_PROPERTY(QStringList users READ getUserList) // TODO: private:  Can be private. Q_PROPERTY doesn't terminate with a ;

    QStringList getUserList() const; // TODO: private: ?

private:
    void setPasswordChanged(const bool correct);

signals:
    void passwordChanged(const bool correct);

public slots:
    void setPassword(const QString& password);
    void setUsername(const int index);
};

#endif // LOGINDLG_H
