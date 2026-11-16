import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire

Column {
    id: root

    property bool sliderVisible: false
    readonly property var sink: Pipewire.defaultAudioSink

    PwObjectTracker {
        objects: root.sink ? [root.sink] : []
    }

    Rectangle {
        id: volumeIcon
        width:  40
        height: 40
        radius: 14
        color: iconMouse.containsMouse ? "#80FFFFFF" : "transparent"

        Text {
            anchors.centerIn: parent
            text: root.sink?.audio.muted ? "" : ""
            color: "#FFFFFF"
            font.pixelSize: 20
        }

        MouseArea {
            id: iconMouse
            anchors.fill: parent
            hoverEnabled: true
            onClicked: root.sliderVisible = !root.sliderVisible
        }
    }

    PopupWindow {
        anchor.item: volumeIcon
        anchor.edges: Edges.Right | Edges.VerticalCenter
        anchor.gravity: Edges.Right | Edges.VerticalCenter

        grabFocus: true
        visible: root.sliderVisible
        
        width:  182
        height: 50
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            radius: 14
            color: "#00FFFFFF"

            border {
                width: 4
                color: "#80FFFFFF"
            }

            Slider {
                id: volumeSlider
                anchors.centerIn: parent
                orientation: Qt.Horizontal
                from: 0
                to: 1
                value: root.sink?.audio.volume ?? 0
                implicitWidth: 128
                implicitHeight: 34
                enabled: root.sink !== null

                onMoved: {
                    if (root.sink?.audio) {
                        root.sink.audio.muted = false
                        root.sink.audio.volume = value
                    }
                }
            }
        }
    }
}
