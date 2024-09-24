import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 360
    height: 480
    title: qsTr("User Registration")

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        TextField {
            id: emailField
            placeholderText: "Enter your email"
            Layout.fillWidth: true
        }

        TextField {
            id: passwordField
            placeholderText: "Enter your password"
            echoMode: TextInput.Password
            Layout.fillWidth: true
        }

        Button {
            text: "Register"
            Layout.fillWidth: true
            onClicked: {
                apiHandler.registerUser(emailField.text, passwordField.text)
            }
        }

        Text {
            id: resultText
            text: ""
            wrapMode: Text.WordWrap
            color: "red"
            Layout.fillWidth: true
        }

        Connections {
            target: apiHandler
            function onResultChanged(newResult) {
                resultText.text = newResult ? newResult : "No result";
            }
        }

    }
}
