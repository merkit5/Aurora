import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    Rectangle {
         color: "red"
         x: 100; y: 10
         width: 100; height: 100

         Rectangle {
             color: "green"
             x: 100; y: 50
             width: 100; height: 100


             Rectangle {
                 color: "blue"
                 x: 50; y: -50
                 width: 100; height: 100
                 Text {
                    y: 35; x: 15
                    text: "<b>Квадрат</b>"
                    color: "white"
                    font.pointSize: 13
                 }
            }

         }
    }
}

