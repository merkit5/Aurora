import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 400
    height: 200
    title: qsTr("TabBar и Текст")

    Column {
        anchors.fill: parent

        TabBar {
            id: tabBar
            width: parent.width

            TabButton {
                text: "Позиция 1"
                onClicked: displayText.text = "Выбрана Позиция 1"
            }

            TabButton {
                text: "Позиция 2"
                onClicked: displayText.text = "Выбрана Позиция 2"
            }

            TabButton {
                text: "Позиция 3"
                onClicked: displayText.text = "Выбрана Позиция 3"
            }
        }

        Text {
            id: displayText
            text: "Выберите вкладку"
            font.pointSize: 16
            anchors.centerIn: parent
        }
    }
}
