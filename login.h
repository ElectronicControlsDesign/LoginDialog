#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QString>
#include <QStringList>

class Login : public QObject
{
    Q_OBJECT

    struct users {
        QString name;
        QString pw;
    } m_user;

    QString m_SelectedUser;
    QString m_userpw;

    QList<users> m_Users;





public:
    explicit Login(QObject *parent = 0);

    Q_PROPERTY(QStringList Users READ Users)

    QStringList m_userlist;

    QStringList Users(){ return m_userlist;}

    Q_INVOKABLE void setUser(int index);
    Q_INVOKABLE void setUserPw(QString pw);


signals:
    void passed();
    void failed();

public slots:
};

#endif // LOGIN_H
