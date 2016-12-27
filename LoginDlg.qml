import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import QtQuick.Layouts 1.1

Window {
    id: loginDlg
//    height: 150
//    width: 300
//    maximumHeight: height
//    maximumWidth: width
//    minimumHeight: height
//    minimumWidth: width

    property var textInputIndent : 10
    property var layoutMargin : 15

    width: loginForm_grid.width
    modality:  Qt.ApplicationModal
    flags: Qt.Dialog

    SystemPalette { id: system_pallet; colorGroup: SystemPalette.Active }

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
                    Layout.topMargin: layoutMargin
                    Layout.leftMargin: layoutMargin
                    Layout.fillWidth: true
                    verticalAlignment: Text.AlignVCenter
                    // TODO: Align right label
                }
                ComboBox {
                    id: username_dropdown
                    editText: ""
                    editable: false
                    height: 30
                    Layout.topMargin: layoutMargin
                    Layout.rightMargin: layoutMargin
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
                    Layout.topMargin: layoutMargin
                    Layout.leftMargin: layoutMargin
                    verticalAlignment: Text.AlignVCenter
                    // TODO: Align right label
                }
                Rectangle {
                    id: password_value_border
                    width: 150
                    height: 30
                    color: "transparent"
                    border.color: "black"
                    Layout.topMargin: layoutMargin / 2
                    Layout.rightMargin: layoutMargin
                    TextInput {
                        id: password_value
                        text: ""
                        height: parent.height
                        width: password_value_border.width
                        cursorVisible: false
                        anchors.left: parent.left
                        anchors.leftMargin: textInputIndent
                        verticalAlignment: Text.AlignVCenter
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
                                    password_value.color = system_pallet.text
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
                        //password_label.horizontalAlignment = 10
                        username_label.text = "I am the translated username label"
                        password_label.text = "I am the translated password label with a larger width"
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
                    anchors.right: password_value_border.right
                    anchors.top: password_value_border.bottom
                    anchors.topMargin: layoutMargin


                    onClicked:  {
                         reset.turnOn = true
                        loginDlg.visible=false
                    }
                }

            }


}
