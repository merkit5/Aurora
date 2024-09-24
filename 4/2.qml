import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts

Window {
    visible: true
    width: 270
    height: 150
    title: qsTr("Hello World")
    GroupBox {
        title: qsTr("Synchronize")
        ColumnLayout {
            RadioButton {
                checked: true
                text: qsTr("1")
                onClicked: outputText.text = "Выбрана: радиокнопокa 1"
            }
            RadioButton {
                text: qsTr("2")
                onClicked: outputText.text = "Выбрана: радиокнопокa 2"
            }
            RadioButton {
                text: qsTr("3")
                onClicked: outputText.text = "Выбрана: радиокнопокa 3"
            }

            Text {
            id: outputText
            text: "Выбрана: радиокнопокa 1"
            font.pointSize: 16
            }
        }
    }
}
