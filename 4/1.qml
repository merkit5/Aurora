import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 200
    height: 100
    title: qsTr("Button State")

    Column {
        anchors.centerIn: parent
        spacing: 10

        Button {
            id: toggleButton
            text: "Нажать"
            onPressed: textField.text = "Нажата"
            onReleased: textField.text = "Отпущена"
        }

        Text {
            id: textField
            text: "Отпущена"
            font.pointSize: 16
        }
    }
}
