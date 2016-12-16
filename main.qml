import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Window {
    id: window1
    visible: true
        width: Screen.width
        height: Screen.height
        title: "Main Exe"



//    height: 300
//    width: 400
//    modality:  Qt.ApplicationModal
//    flags: Qt.Dialog


        Button {
            text: "Login"
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 30
            onClicked: {
                if((Login.userWidth() > 50) || (Login.pwWidth() > 50)) // You need to set this based on real vales
                    loginDlg.width = 600 // set it based on the actual above returned values + margins
                loginDlg.visible=true
            }
        }



    LoginDlg {
        id: loginDlg

    }



}
