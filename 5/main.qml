import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
    visible: true
    width: 400
    height: 300
    title: qsTr("Викторина")

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: QuestionPage {
            onAnswerSelected: function(correct) {
                stackView.push(Qt.resolvedUrl("ResultPage.qml"), {isCorrect: correct});
            }
        }
    }
}
