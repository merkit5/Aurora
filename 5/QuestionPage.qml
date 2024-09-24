import QtQuick
import QtQuick.Controls

Page {
    id: questionPage
    signal answerSelected(bool correct)

    Column {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: "Кто написал роман 'Война и мир?'"
            font.pointSize: 16
        }

        Button {
            text: "Л. Н. Толстой"
            onClicked: questionPage.answerSelected(true)
        }

        Button {
            text: "А. С. Пушкин"
            onClicked: questionPage.answerSelected(false)
        }

        Button {
            text: "А. П. Чехов"
            onClicked: questionPage.answerSelected(false)
        }

        Button {
            text: "С. А. Есенин"
            onClicked: questionPage.answerSelected(false)
        }
    }
}
