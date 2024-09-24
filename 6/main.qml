import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.LocalStorage
import "Database.js" as JS

Window {
    id: window
    visible: true
    width: Screen.width / 2
    height: Screen.height / 1.8
    title: qsTr("Список покупок")

    property double totalSum: 0

    function updateTotal() {
        totalSum = 0;
        for (var i = 0; i < shoppingListModel.count; i++) {
            totalSum += parseFloat(shoppingListModel.get(i).price);
        }
    }

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        TextField {
            id: productName
            placeholderText: "Название продукта"
            width: parent.width * 0.8
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextField {
            id: productPrice
            placeholderText: "Цена продукта"
            width: parent.width * 0.8
            inputMethodHints: Qt.ImhFormattedNumbersOnly
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Button {
            text: "Добавить продукт"
            width: parent.width * 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                if (productName.text !== "" && productPrice.text !== "") {
                    JS.dbInsert(productName.text, productPrice.text);
                    shoppingListModel.append({"name": productName.text, "price": productPrice.text});
                    productName.text = ""
                    productPrice.text = ""
                    updateTotal();
                }
            }
        }

        ListView {
            id: listView
            width: parent.width
            height: parent.height * 0.5
            model: ListModel { id: shoppingListModel }
            delegate: Item {
                width: parent.width
                height: 40

                Row {
                    spacing: 10

                    Text {
                        text: model.name + " - " + model.price + " руб."
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Button {
                        text: "Удалить"
                        anchors.verticalCenter: parent.verticalCenter
                        onClicked: {
                            JS.dbDelete(model.name);
                            shoppingListModel.remove(index);
                            updateTotal();
                        }
                    }
                }
            }
        }

        Text {
            text: "Общая сумма: " + totalSum.toFixed(2) + " руб."
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Component.onCompleted: {
            JS.dbInit();
            JS.dbReadAll();
            updateTotal();
        }
    }
}
