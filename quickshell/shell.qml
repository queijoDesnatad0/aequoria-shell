import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ShellRoot {
    PanelWindow {
        id: root

        anchors {
            left: true
            right: true
            bottom: true
        }

        implicitHeight: 41
        color: 'transparent'

        Rectangle {
            anchors.fill: parent
            color: '#00000000'
        }

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }
            
            height: 3
            
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#00000000" }
                GradientStop { position: 0.5; color: "#80000000" }
                GradientStop { position: 1.0; color: "#FF000000" }
            }
        }


        RowLayout {
            anchors {
                fill: parent
                topMargin: 3
                leftMargin: 7
                rightMargin: 7
            }
            
            spacing: 7

            Workspaces {}

            Separator {}

            Item {Layout.fillWidth: true}

            Tray {}
            
            Separator {}

            Clock {}

        }
    }
}