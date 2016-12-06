import QtQuick 2.6
import QtQuick.Controls 1.5
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            Qt.quit()
        }
    }

    LoginDlg {
        id: loginDlg
        objectName: "LoginDlg"

        onAccepted: {
            console.log("QML mainWindow.OnAccepted.")
        }
    }
}
