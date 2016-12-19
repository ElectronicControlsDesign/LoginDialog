import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import QtQuick.Layouts 1.1

Window {
    id: loginDlg
    height: 150
    width: 300
    modality:  Qt.ApplicationModal
    flags: Qt.Dialog

    Item {
        id: reset
        property bool turnOn: false
        onTurnOnChanged: if(turnOn){
                             turnOn=false
                             password_value_border.color="white"
                             ok_button.enabled=false
                             username_dropdown.focus=true
                         }
    }

    Label {
        id: username_label
        text: qsTr("User Name")
        focus: true
        height: 30
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter

        anchors.top: parent.top
        anchors.left: parent.left

        anchors.leftMargin: 15
        anchors.topMargin: 15

    }

    ComboBox {
        id: username_dropdown
        editText: ""
        editable: false
        height: 30
        anchors.left: username_label.right
        anchors.leftMargin: 15
        anchors.top: parent.top
        anchors.topMargin: 15
        model: LoginDlgPassword.getUserList
        onCurrentIndexChanged: {
            reset.turnOn=true
            LoginDlgPassword.setUsername(username_dropdown.currentIndex)
            if (currentIndex != 0) {
                textInput1.focus = true
            }
        }
    }

    Label {
        id: password_label
        text: qsTr("Password")
        height: 30
        anchors.top: username_label.bottom
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.topMargin: 15
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }
    Rectangle {
        id: password_value_border
        width: 150
        height: 30
        color: "transparent"
        border.color: "black"
        anchors.left: username_dropdown.left
        anchors.top: password_label.top


        TextInput {
            id: password_value
            text: ""

            height: parent.height
            width: parent.width
            echoMode: TextInput.Password
            onTextChanged: LoginDlgPassword.setPassword(password_value.text)
            Connections {
                target: LoginDlgPassword
                onPasswordChanged: {
                    if (correct) {
                        password_value.color = "green"
                    }
                    else {
                        // TODO: password_value.color = defaultColor; // http://doc.qt.io/qt-5/qml-qtquick-systempalette.html
                    }
                }
            }
        }
    }

    Button {
        id: cancel_button
        enabled: true
        anchors.bottom: parent.bottom
        anchors.right: ok_button.left
        anchors.rightMargin: 15
        anchors.bottomMargin: 15
        text: qsTr("Cancel")
        onClicked:  {
            loginDlg.close();
        }
    }
    Button {
        id: ok_button
        enabled: false
        anchors.bottom:  parent.bottom
        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.bottomMargin: 15
        text: qsTr("Ok")
        onClicked:  {
             reset.turnOn = true
            loginDlg.visible=false
        }
    }




}
