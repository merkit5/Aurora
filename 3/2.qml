import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 500
    height: 600
    title: "Расписание группы"

    ListView {
        anchors.fill: parent
        model: scheduleModel
        delegate: Item {
            width: parent.width
            height: 50

            Row {
                anchors.fill: parent
                spacing: 10

                Text {
                    text: model.subject
                    font.bold: true
                }

                Text {
                    text: model.teacher
                }
            }
        }

        section.property: "day"
        section.delegate: Rectangle {
            width: ListView.view.width
            height: 30
            color: "#f0f0f0"
            border.color: "#cccccc"
            Label {
                anchors.centerIn: parent
                text: section
                font.bold: true
            }
        }
    }


    ListModel {
    id: scheduleModel

    ListElement { day: "Понедельник"; subject: "Интеллектуальный анализ данных"; teacher: "Федулов Д.Д." }
    ListElement { day: "Понедельник"; subject: "Интеллектуальный анализ данных"; teacher: "Федулов Д.Д." }
    ListElement { day: "Понедельник"; subject: "Разработка программных приложений для ОС Аврора"; teacher: "Лагутина К.В." }
    ListElement { day: "Понедельник"; subject: "Современные подходы к разработке облачных сервисов"; teacher: "Бегунов А.В. Тензор" }
    ListElement { day: "Понедельник"; subject: "Разработка программных приложений для ОС Аврора"; teacher: "Лагутина К.В." }

    ListElement { day: "Вторник"; subject: "Дополнительные главы математической статистики "; teacher: "Богомолов Ю.В." }
    ListElement { day: "Вторник"; subject: "Дополнительные главы математической статистики "; teacher: "Богомолов Ю.В." }

    ListElement { day: "Среда"; subject: "Доп.главы численных методов"; teacher: "Марушкина Е.А." }
    ListElement { day: "Среда"; subject: "Цифровая обработка сигналов "; teacher: "Матвеев Д.В." }
    ListElement { day: "Среда"; subject: "Цифровая обработка сигналов "; teacher: "Матвеев Д.В." }
    ListElement { day: "Среда"; subject: "Современные редакторские технологии"; teacher: "Шабаршин В.А." }

    ListElement { day: "Пятница"; subject: "Программирование в Net Framework на языке С#"; teacher: "Васильчиков В.В." }
    ListElement { day: "Пятница"; subject: "Программирование в Net Framework на языке С#"; teacher: "Васильчиков В.В." }
    ListElement { day: "Пятница"; subject: "БЖД"; teacher: "Середняков В.Е." }

    ListElement { day: "Суббота"; subject: "Основы права"; teacher: " Кулев А.Г." }
    ListElement { day: "Суббота"; subject: "Система управления БД Oracle"; teacher: "Горбунов О.Е." }

}

}
