import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

RowLayout{
    id: root

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter

        width:  28
        height: 28
        
        color: 'transparent'

        border {
            width: 1
            color: '#8000ff'
        }

        radius: 10
        antialiasing: true

        Text {
            id: osLogtype
            anchors.centerIn: parent

            text: "󰣇"

            color: '#FFFFFF'

            font {
                family: 'JetBrainsMono Nerd Font Propo'
                pixelSize: 28
            }

        }

        MouseArea {
            anchors.fill: parent
            onClicked: Quickshell.execDetached(["wofi", "--show", "drun"])
        }
    }
}