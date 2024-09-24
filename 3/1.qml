import QtQuick
import QtQuick.Controls
import QtQml.XmlListModel

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Список прямоугольников"

    XmlListModel {
        id: currencyModel
        source: "1.xml"
        query: "/ValCurs/Valute"

        XmlListModelRole { name: "charCode"; elementName: "CharCode" }
        XmlListModelRole { name: "name"; elementName: "Name" }
        XmlListModelRole { name: "value"; elementName: "Value" }
    }

    ListView {
        anchors.fill: parent
        model: currencyModel

        delegate: Item {
            width: parent.width
            height: 50

            Row {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: model.charCode
                    font.bold: true
                    color: "black"
                }

                Text {
                    text: model.name
                    color: "black"
                }

                Text {
                    text: model.value
                    color: "black"
                }
            }
        }
    }
}
