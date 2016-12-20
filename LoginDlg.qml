import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import QtQuick.Layouts 1.1

Window {
    id: loginDlg
    width: 226
    height: 150
    visible: true
    modality:  Qt.ApplicationModal
    flags: Qt.Dialog


    Item {
        id: reset
        property bool turnOn: false
        onTurnOnChanged: if(turnOn){
                             turnOn=false
                             //password_value_border.color="white"
                             //ok_button.enabled=false
                             username_dropdown.focus=true
                         }
    }
    Item {
        id: loginForm_wrapper
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 15
        anchors.bottomMargin: 15


        GridLayout {
            id: loginForm_grid
            Layout.fillWidth: true
            Layout.fillHeight: true
            columns: 2

            Label {
                id: username_label
                text: "Username" // TODO: Get from i18n
                focus: true
                height: 30
                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            ComboBox {
                id: username_dropdown
                editText: ""
                editable: false
                height: 30
                Layout.fillWidth: true
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
                text: "Password" // TODO: Get from i18n
                height: 30
                Layout.fillWidth: true
                horizontalAlignment: Qt.AlignRight
                verticalAlignment: Qt.AlignVCenter
            }
            Rectangle {
                id: password_value_border
                width: 150
                height: 30
                color: "transparent"
                border.color: "black"
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
        }
        Button {
            id: test_button
            enabled: true
            text: "Translate" // TODO: Get from i18n
            anchors.bottom: cancel_button.bottom
            anchors.right: cancel_button.left
            anchors.rightMargin: 15
            // TODO: Dialog size needs to adjust to size of the label
            onClicked:  {
                username_label.text = "aljbndjabsdjkasdkjba askdjnakjsdbkasbd"
                password_label.text = "aljbndjabsdjkasdkjba askdjnakjsdbkasbd asdasda"
            }
        }
        Button {
            id: cancel_button
            enabled: true
            text: "Cancel" // TODO: Get from i18n
            anchors.bottom: ok_button.bottom
            anchors.right: ok_button.left
            anchors.rightMargin: 15
            onClicked:  {
                loginDlg.close();
            }
        }
        Button {
            id: ok_button
            enabled: false
            text: "Ok" // TODO: Get from i18n
            anchors.right: loginForm_grid.right
            anchors.top: loginForm_grid.bottom
            anchors.topMargin: 15
            anchors.rightMargin: 15

            onClicked:  {
                 reset.turnOn = true
                loginDlg.visible=false
            }
        }
     }
}
