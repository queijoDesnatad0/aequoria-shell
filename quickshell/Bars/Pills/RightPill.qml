import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../Conponments"
// AequoriaShell Right Pill (pillLayout) //

PanelWindow {
    id: root

    anchors {
        right: true
    }

    margins{
        right: 7
    }

    implicitHeight: 192
    implicitWidth: 40
    color: 'transparent'

    Rectangle {
        anchors {
            fill: parent
        }
        
        gradient: Gradient {
            orientation: Gradient.Horizontal

            GradientStop { position: 0.0; color: "#40FFFFFF" }
            GradientStop { position: 0.5; color: "#20808080" }
            GradientStop { position: 1.0; color: "#40000000" }
        }

        border {
            width: 1
            color: '#FFFFFF'
        }

        radius: root.implicitWidth / 2
    }

    WorkspacesColumn {anchors.centerIn: parent}

}