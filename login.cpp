#include "login.h"

Login::Login(QObject *parent) : QObject(parent)
{

    // not thought out for economy!!

    m_user.name="";
    m_user.pw="ZZZZ";

    m_Users.append(m_user);


    m_user.name="Bob";
    m_user.pw="1234";

    m_Users.append(m_user);

    m_user.name="Mary";
    m_user.pw="5678";

    m_Users.append(m_user);

    m_user.name="Joe";
    m_user.pw="ABCD";

    m_Users.append(m_user);

    m_userlist << " " << "Bob" << "Mary" << "Joe";

}

void Login::setUser(int index)
{
    m_SelectedUser = m_userlist.at(index);
}

void Login::setUserPw(QString pw)
{

    int n = m_userlist.indexOf(m_SelectedUser);
    if(n == -1)
        return;

    if(pw == m_Users[n].pw){
        m_userpw = pw;
        emit passed();
    } else {
        m_userpw = "";
        emit failed();

    }

}

