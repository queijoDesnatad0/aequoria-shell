import Quickshell
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    spacing: 0
     
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }

    Text {
        id: timeText
        
        anchors.horizontalCenter: parent.horizontalCenter
        
        text: Qt.formatDateTime(clock.date, "hh:mm")
        color: '#FFFFFF'
        
        font {
            pixelSize: 12
        }
    }

    Text {
        id: dateText

        text: Qt.formatDateTime(clock.date, "yyyy/MM/dd") 
        color: '#FFFFFF'

        font {
            pixelSize: 12
        }
    }
}