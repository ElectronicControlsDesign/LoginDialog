#include <cassert>
#include "loginDlg.h"

const LoginDlg::tchar_type* LoginDlg::userList_[] = {L"Administrator", L"Boss", L"Chief"};

LoginDlg::LoginDlg(QObject * const parent) : QObject(parent)
{
}

QStringList LoginDlg::getUserList() const
{
    QStringList result; // Can't QML read other datatypes? If so, what kind?

    const QString user;

    for(int x=0; x<3;x++){
        result.append(user.fromStdWString(userList_[x]));
    }

    return result;
}

void LoginDlg::setUsername(const int index)
{
    if (index>=0 && index<std::extent<decltype(userList_), 0>::value)
    {
        username_ = userList_[index];
    }
    else
    {
        assert(false);
    }
}

void LoginDlg::setPasswordChanged(const bool correct)
{
    emit passwordChanged(correct);
}

void LoginDlg::setPassword(const QString& password)
{
    const auto passwordGuess = password.toStdWString();
    if (passwordGuess.compare(password_) != 0)
    {
        const tstring stubPassword = L"password";
        const bool correct = (passwordGuess.compare(stubPassword)==0);
        password_ = passwordGuess;
        emit setPasswordChanged(correct);           // you need the keyword "emit" to send a signal
    }
}
