import QtQuick
import Quickshell

Column {
    id: clockModule

    spacing: 0

    SystemClock {
        id: systemClock
        precision: SystemClock.Minutes
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatDateTime(systemClock.date, "hh:mm")
        color: "#FFFFFF"
        font.pixelSize: 11
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatDateTime(systemClock.date, "dd/MM/yy")
        color: "#FFFFFF"
        font.pixelSize: 10
    }
}
