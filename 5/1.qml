import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 400
    height: 200
    title: qsTr("Меню и Текст")

    MenuBar {
        Menu {
            title: "Позиция"

            Action {
                text: "Позиция 1"
                onTriggered: displayText.text = "Выбрана позиция  1"
            }

            Action {
                text: "Позиция 2"
                onTriggered: displayText.text = "Выбрана позиция 2"
            }

            Action {
                text: "Позиция 3"
                onTriggered: displayText.text = "Выбрана позиция 3"
            }
        }
    }

    Text {
        id: displayText
        text: "Выберите позицию из меню"
        anchors.centerIn: parent
        font.pointSize: 16
    }
}
