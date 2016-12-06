import QtQuick 2.6
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Dialog {
    title: "Login"
    standardButtons: StandardButton.Ok | StandardButton.Cancel

    Column {
        width: parent.width
        height: parent.height
        Text {
            id: lbl_username
            text: "Username:"
            width: text.width
        }
        TextField {
            id: input_username
            anchors.left: lbl_username.right
            anchors.top: lbl_username.top
            anchors.leftMargin: 25
            style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }
        }
        Text {
            id: lbl_password
            text: "Password:"
            width: text.width
            anchors.top: lbl_username.bottom
            anchors.topMargin: 25
        }
        TextField {
            id: input_password
            anchors.left: lbl_username.right
            anchors.top: lbl_password.top
            anchors.leftMargin: 25
            style: TextFieldStyle {
                textColor: "black"
                background: Rectangle {
                    radius: 2
                    implicitWidth: 100
                    implicitHeight: 24
                    border.color: "#333"
                    border.width: 1
                }
            }
        }
    }
}
