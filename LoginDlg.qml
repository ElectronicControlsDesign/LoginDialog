import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Window {
    id: loginDlg
    height: 300
    width: 400
    modality:  Qt.ApplicationModal
    flags: Qt.Dialog

    Item {
        Connections {
            target: Login
            onPassed: {
                rectangle1.color="green"
                button1.enabled=true
            }

            onFailed:  {
                rectangle1.color="white"
                button1.enabled=false
            }
        }
    }

    Item {
        id: reset
        property bool turnOn: false
        onTurnOnChanged: if(turnOn){
                             turnOn=false
                             rectangle1.color="white"
                             button1.enabled=false
                             textInput1.text=""
                             comboBox1.focus=true

                         }
    }



    Label {
        id: lblCombo
        width: 84
        height: 24
        text: qsTr("User Name")
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 20

        font.pointSize: 13
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        focus: true
    }


    ComboBox {
        id: comboBox1
        //        x: 822
        width: 330
        height: 40
        //        currentIndex: -1
        editText: ""
        editable: false
        anchors.top: lblCombo.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        model: Login.Users

        onCurrentIndexChanged: {
            reset.turnOn=true
            Login.setUser( comboBox1.currentIndex)
            if(currentIndex != 0)
                textInput1.focus = true
        }
    }

    Label {
        id: label1
        //        y: 449
        width: 84
        height: 24
        text: qsTr("Password")
        anchors.left: rectangle1.left
        anchors.leftMargin: 0
        anchors.bottom: rectangle1.top
        anchors.bottomMargin: 4
        font.pointSize: 13
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Button {
        id: button1
        enabled: false
        //        x: 923
        width: 141
        height: 63
        text: qsTr("Ok")
        anchors.top: rectangle1.bottom
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked:  {
                     reset.turnOn = true
                    loginDlg.visible=false
        }
    }

    Rectangle {
        id: rectangle1
        //        x: 777
        width: 342
        height: 64
        color: "transparent"
        border.color: "black"
        anchors.top: comboBox1.bottom
        anchors.topMargin: 35
        anchors.horizontalCenter: parent.horizontalCenter

        TextInput {
            id: textInput1
            x: 28
            y: 22
            width: 311
            height: 34
            text: ""
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            echoMode: TextInput.Password
            font.pixelSize: 12
            onTextChanged: Login.setUserPw(textInput1.text)
        }
    }
}

