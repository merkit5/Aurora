import sys
from pathlib import Path
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    # qml_file = Path(__file__).parent / 'Практика 1.qml'
    # qml_file = Path(__file__).parent / 'main.qml'
    # qml_file = Path(__file__).parent / 'DOP1.qml'
    # qml_file = Path(__file__).parent / 'DOP2.qml'
    qml_file = Path(__file__).parent / 'DOP3.qml'
    engine.load(qml_file)
    if not engine.rootObjects():
        sys.exit(-1)
    exit_code = app.exec()
    del engine
    sys.exit(exit_code)
