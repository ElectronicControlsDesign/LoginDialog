#include "LoginDlg.h"

#include <iostream>

#include <QString>
#include <QDebug>

LoginDlg::LoginDlg(QObject *parent)
    : QObject(parent)
{
}

LoginDlg::~LoginDlg()
{
}

void LoginDlg::handleOnAccepted()
{
    // TODO:
}

void LoginDlg::setUsernameLabel(const std::string &value)
{
    if (value.compare(usernameLabel_) != 0)
    {
        usernameLabel_ = value;
        emit onUsernameLabelChanged();
    }
}

QString LoginDlg::getUsernameLabel() const
{
    const QString result = QString::fromStdString(usernameLabel_); // TODO: Write a fromStdTString function then use it.
    return result;
}
