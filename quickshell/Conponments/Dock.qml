import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Item {
    property var apps: ["kitty", "codium", "firefox", "nautilus"]

    implicitWidth: row.implicitWidth
    implicitHeight: 20

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 7

        Repeater {
            model: apps

            delegate: Item {
                required property string modelData
                width:  28
                height: 28
            
                property var entry: DesktopEntries.heuristicLookup(modelData)
            
                Rectangle {
                    anchors.fill: parent
                    radius: 10
                    antialiasing: true
                    color: mouseArea.containsMouse ? "#808000FF" : "transparent"
            
                    Behavior on color {
                        ColorAnimation { duration: 120 }
                    }
                }
            
                IconImage {
                    anchors.centerIn: parent
                    implicitSize: 24
                    source: entry?.icon
                        ? Quickshell.iconPath(entry.icon, true)
                        : Quickshell.iconPath(modelData, true)
                }
            
                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: entry?.execute()
                }
            }
        }
    }
}