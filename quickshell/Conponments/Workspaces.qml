import Quickshell
import Quickshell.Hyprland
import QtQuick

Column {
    id: root
    spacing: 8

    Repeater {
        model: Hyprland.workspaces

        delegate: Rectangle {
            required property var modelData

            width:  40
            height: 25
            radius: 7
            color: modelData.focused ? "#8000FF" : "#80FFFFFF"

            Text {
                anchors.centerIn: parent
                text: modelData.name
                color: modelData.focused ? "#FFFFFF" : "transparent"
                font.pixelSize: 14
            }

            MouseArea {
                anchors.fill: parent
                onClicked: modelData.activate()
            }
        }
    }
}