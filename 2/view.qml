import QtQuick
import QtQuick.Controls

// Создать приложение которое позволяет отображать ,
// список из (ListView) прямоугольников(Rectangle)
// с использованием компонента в ListModel качестве модели .
// Модель должна содержать информацию о цвете фона
// прямоугольника тексте отображаемом в прямоугольнике , ,
// и цвете текста Текст должен содержать название цвета фона .
// прямоугольника.

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Список прямоугольников"

    ListModel {
        id: rectangleModel
        ListElement { bgColor: "white"; text: "Белый"; textColor: "black" }
        ListElement { bgColor: "blue"; text: "Синий"; textColor: "white" }
        ListElement { bgColor: "red"; text: "Красный"; textColor: "black" }
        ListElement { bgColor: "green"; text: "Зеленый"; textColor: "white" }
        ListElement { bgColor: "yellow"; text: "Желтый"; textColor: "black" }
        ListElement { bgColor: "purple"; text: "Фиолетовый"; textColor: "white" }
        ListElement { bgColor: "orange"; text: "Оранжевый"; textColor: "black" }
    }


    ListView {
        anchors.fill: parent
        model: rectangleModel

        delegate: Rectangle {
            width: parent.width
            height: 80
            color: model.bgColor

            Text {
                anchors.centerIn: parent
                text: model.text
                color: model.textColor
                font.bold: true
                font.pointSize: 16
            }
        }
    }
}

