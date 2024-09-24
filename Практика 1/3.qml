import QtQuick
import QtQuick.Controls

Window {
    width: 400
    height: 300
    visible: true
    title: qsTr("Hello World")
    Rectangle {
        id: rect
        width: 100; height: 100
        x: 50; y: 50
        color: "black"

        transform: [
            Rotation {
                id: rotation
                origin.x: rect.width / 2; origin.y: rect.height / 2
                angle: 0
            },
            Translate { x: 100 }
        ]

        ParallelAnimation {
            running: true
            NumberAnimation { target: rotation; property: "angle"; to: 45; duration: 2000}
            NumberAnimation { target: rect; property: "width"; to: 50; duration: 2000}
        }
    }
}

