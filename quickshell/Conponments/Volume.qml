import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout {
    id: volumeModule
    spacing: expanded ? 8 : 0

    property bool expanded: false
    readonly property var sink: Pipewire.defaultAudioSink
    readonly property real volume: sink?.audio?.volume ?? 0
    readonly property bool muted: sink?.audio?.muted ?? false

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Slider {
        visible: volumeModule.expanded
        width: 180
        height: 40
        from: 0
        to: 1
        value: volume

        onMoved: {
            if (sink?.ready) {
                sink.audio.muted = false
                sink.audio.volume = value
            }
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter

        text: muted ? '󰖁' : (volume >= 0.75 ? '󰕾' : volume >= 0.50 ? '󰖀' : volume >= 0.01 ? '󰕿' : '󰝟' )
        
        color: '#FFFFFF'

        font {
            family: 'JetBrainsMono Nerd Font Propo'
            pixelSize: 22
        }

        MouseArea {
            anchors.fill: parent
            onClicked: volumeModule.expanded = !volumeModule.expanded
        }
    }

}
