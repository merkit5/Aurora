import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 300
    height: 200
    title: qsTr("Dialog with Sum")

    Dialog {
        id: numberDialog
        title: "Введите числа"
        visible: true

        Column {
            spacing: 10
            padding: 20

            TextField {
                id: numberField1
                 placeholderText: qsTr("Введите первое число")
            }

            TextField {
                id: numberField2
                 placeholderText: qsTr("Введите второе число")
            }

            Button {
                text: "Подтвердить"
                onClicked: {
                    var num1 = parseInt(numberField1.text);
                    var num2 = parseInt(numberField2.text);
                    var sum = num1 + num2;

                    sumText.text = "Сумма чисел: " + sum;
                }
            }
             Text {
                id: sumText
                text: ""
                font.pointSize: 16
                color: "black"
            }
        }
    }
}
