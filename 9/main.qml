import QtQuick
import QtQuick.Controls
import QtQuick.Window

Window {
    visible: true
    width: 640
    height: 480
    title: "Fibonacci Calculator"

    Column {
        spacing: 20
        anchors.centerIn: parent

        Text {
            text: "Fibonacci Calculator"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: numberInput
            placeholderText: "Enter n"
            width: 200
            inputMethodHints: Qt.ImhDigitsOnly
            validator: IntValidator { bottom: 0 }
        }

        Button {
            text: "Calculate"
            onClicked: {
                if (numberInput.text !== "") {
                    resultText.text = "Calculating...";
                    myWorker.sendMessage({ number: parseInt(numberInput.text) });
                } else {
                    resultText.text = "Please enter a valid number";
                }
            }
        }

        Text {
            id: resultText
            text: ""
            font.pixelSize: 20
            color: "blue"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        WorkerScript {
            id: myWorker
            source: "workerscript.js"

            onMessage: {
                resultText.text = "Result: " + messageObject.result;
            }
        }
    }
}
