import Quickshell.Io
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: networkModule

    spacing: 0

    property int signalStrength: -1

    function updateSignal(output) {
        const match = output.match(/\*:(\d+)/)
        signalStrength = match ? parseInt(match[1]) : -1
    }

    Text {
        text: {
            if (signalStrength < 0) return "󰤭"
            if (signalStrength < 25) return "󰤟"
            if (signalStrength < 50) return "󰤢"
            if (signalStrength < 75) return "󰤥"
            return "󰤨"
        }
        color: '#FFFFFF'

        font {
            family: 'JetBrainsMono Nerd Font Propo'
            pixelSize: 28
        }
    }

    Process {
        id: wifiProcess
        command: ["nmcli", "-t", "-f", "IN-USE,SIGNAL", "dev", "wifi"]

        stdout: StdioCollector {
            onStreamFinished: networkModule.updateSignal(this.text)
        }
    }

    Component.onCompleted: wifiProcess.running = true

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: wifiProcess.running = true
    }
}
