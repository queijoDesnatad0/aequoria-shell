// SideBar Config \\
import Quickshell
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import "../Conponments"

PanelWindow {
    id: root

    anchors {
        left: true
        top: true
        bottom: true
    }

    implicitWidth: 53
    color: "transparent"

    Rectangle {
        id: sidebar
        anchors.fill: parent
        color: "transparent"

        Rectangle {
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }

            width: 3

            gradient: Gradient {
                orientation: Gradient.Horizontal
                GradientStop { position: 0.0; color: "#FF000000" }
                GradientStop { position: 0.5; color: "#80000000" }
                GradientStop { position: 1.0; color: "#00000000" }
            }
        }

        ColumnLayout {
            anchors {
                fill: parent
                rightMargin: 3
            }

            spacing: 10

            Clock {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    top: parent.top
                    topMargin: 4
                }
            }

            Separator {anchors.horizontalCenter: parent.horizontalCenter}

            Notification {anchors.horizontalCenter: parent.horizontalCenter}

            Network {anchors.horizontalCenter: parent.horizontalCenter}

            Volume {anchors.horizontalCenter: parent.horizontalCenter}

            Devices {anchors.horizontalCenter: parent.horizontalCenter}

            Item {Layout.fillHeight: true}

            Workspaces {anchors.centerIn:parent}

            OsLogo {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                    bottomMargin: 4
                }
            }
        }
    }
}