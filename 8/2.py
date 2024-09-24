import sys
import json
from pathlib import Path
from PySide6.QtCore import QObject, Slot, Signal
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtNetwork import QNetworkAccessManager, QNetworkRequest, QNetworkReply

class ApiHandler(QObject):
    resultChanged = Signal(str)

    def __init__(self):
        super().__init__()
        self._result = ""
        self.network_manager = QNetworkAccessManager()
        self.network_manager.finished.connect(self.handleResponse)

    @Slot(str, str)
    def registerUser(self, email, password):
        url = "https://reqres.in/api/register"
        request = QNetworkRequest(url)
        request.setHeader(QNetworkRequest.ContentTypeHeader, "application/json")

        data = {"email": email}
        if password:
            data["password"] = password

        self.network_manager.post(request, json.dumps(data).encode())

    def handleResponse(self, reply):
        if reply.error() == QNetworkReply.NoError:
            response_data = json.loads(reply.readAll().data().decode())
            if "token" in response_data:
                self.resultChanged.emit(f"Registration successful! Token: {response_data['token']}")
            elif "error" in response_data:
                self.resultChanged.emit(f"Registration failed: {response_data['error']}")
        else:
            self.resultChanged.emit(f"Error: {reply.errorString()}")

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    api_handler = ApiHandler()

    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("apiHandler", api_handler)

    qml_file = Path(__file__).parent / "2.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
