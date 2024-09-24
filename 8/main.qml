import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    visible: true
    width: 640
    height: 480

    Column {
        anchors.fill: parent
        spacing: 10

        ListView {
            id: todoListView
            anchors.fill: parent
            model: ListModel { id: todoModel }

            delegate: Item {
                width: parent.width
                height: 50

                Row {
                    spacing: 1
                    anchors.fill: parent
                    anchors.margins: 5

                    Text {
                        text: "ID: " + model.id + " - " + model.title
                        width: parent.width * 0.8
                        elide: Text.ElideRight
                    }

                    Text {
                        text: model.completed ? "true" : "false"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }
    }

    function requestTodos() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                var json = JSON.parse(xhr.responseText);
                todoModel.clear();
                for (var i = 0; i < json.length; i++) {
                    todoModel.append({"id": json[i].id, "title": json[i].title, "completed": json[i].completed});
                }
            }
        }
        xhr.open("GET", "https://jsonplaceholder.typicode.com/todos");
        xhr.send();
    }

    Component.onCompleted: {
        requestTodos(); 
    }
}
