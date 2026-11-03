import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ShellRoot {
    PanelWindow {
        id: root

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 28
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            color: "#408000ff"

            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                
                height: 1
                color: "#8000ff"
            }
        }

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 2
            anchors.rightMargin: 2
            spacing: 7

            RowLayout {
                anchors.centerIn: parent
                spacing: 7

                SystemClock {
                    id: clock
                    precision: SystemClock.Seconds
                }

                Text {
                    id: dateText
                    font.family: 'Google Sans Code'
                    font.pixelSize: 14
                    color: "#ffffff"
                    text: Qt.formatDateTime(clock.date, "yyyy/MM/dd")     
                }

                Text {
                    id: timeText
                    font.family: 'Google Sans Code'
                    font.pixelSize: 14
                    color: "#ffffff"
                    text: Qt.formatDateTime(clock.date, "hh:mm")
                }
            }

            Item { Layout.fillWidth: true}

            RowLayout {
                spacing: 4

                Repeater {
                    model: 10
                    
                    Rectangle {
                        anchors.verticalCenter: parent.verticalCenter
                        width: 14
                        height: 14

                        property bool isActive : Hyprland.focusedWorkspace?.id === (index + 1)

                        color: isActive ? "#8000ff" : "#40ffffff"

                        radius: 10
                        antialiasing: true
                    }
                }
            }
        }
    }
}