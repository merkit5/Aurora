import QtQuick
import QtQuick.Controls

Page {
    id: resultPage
    property bool isCorrect: false

    Column {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: isCorrect ? "Ваш ответ правильный." : "Ваш ответ неверный."
            font.pointSize: 16
            color: isCorrect ? "green" : "red"
        }

        Image {
            source: isCorrect ? "1.png" : "2.png"
            width: 100
            height: 100
            fillMode: Image.PreserveAspectFit
        }

        Button {
            text: "Вернуться к вопросу"
            onClicked: stackView.pop()
        }
    }
}
