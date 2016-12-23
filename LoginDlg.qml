import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Window {
    id: loginDlg
    property alias lblusername: username_label.text
    property alias lblpassword: password_label.text
    property alias lblcancelbtn: cancel_button.text
    property alias lblokbtn: ok_button.text

    height: 150
    width: 300
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width

    modality:  Qt.ApplicationModal
    flags: Qt.Dialog

    function resize(){
        var userline = username_label.width + username_dropdown.width
        var passline = password_label.width + password_value_border.width

        var okcan =   cancel_button.text.length + ok_button.text.length

        if(loginDlg.width < ( userline + 100)){
            if(userline > passline)
                loginDlg.width = userline + 50
            else
                loginDlg.width = passline + 50

        }
        if(loginDlg.width < okcan + 30){
            loginDlg.width = okcan + 100
        }


    }

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
        text: "Username Extremely Very Long" // TODO: Get from i18n
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
        text: "Password Extremely Very Long" // TODO: Get from i18n
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
        text: "Cancel" // TODO: Get from i18n
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
        text: "Ok Extremely Very Long" // TODO: Get from i18n
        onClicked:  {
             reset.turnOn = true
            loginDlg.visible=false
        }
    }
}
