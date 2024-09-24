import QtQuick
import QtQuick.Controls

// Создать приложение которое отображает кнопку и список ,
// из прямоугольников По нажатию на кнопку происходит .
// добавление нового элемента в список По нажатию на элемент .
// списка происходит удаление данного элемента .
// В прямоугольниках должен отображаться текст с порядковым
// номером элемента в списке При удалении элементов .
// порядковые номера у добавленных прямоугольников остаются
// неизменными.
ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Список прямоугольников"

    ListModel {id: dataModel}

    property int itemCount: 1

    Column {
        spacing: 10
        anchors.fill: parent
        anchors.margins: 10

        ListView {
            width: parent.width
            height: parent.height - addButton.height
            model: dataModel
            delegate: Rectangle {
                width: parent.width; height: 70; color: "skyblue";
                Text {
                    anchors.centerIn: parent
                    text: model.text
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: dataModel.remove(index)
                }
            }
        }

        Button {
            id: addButton
            text: "Добавить элемент"
            width: parent.width

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    dataModel.append({ text: "Элемент #" + itemCount });
                    itemCount++;
                }
            }
        }
    }
}
