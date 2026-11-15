import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../Conponments"
// AequoriaShell Top Pill (pillLayout) //

PanelWindow {
    id: root

     anchors {
        top: true
    }

    margins {
        top: 7
    }

    implicitHeight: 40
    implicitWidth: 90
    color: 'transparent'

    Rectangle {
        anchors {
            fill: parent
        }
        
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#40000000" }
            GradientStop { position: 0.5; color: "#20808080" }
            GradientStop { position: 1.0; color: "#40FFFFFF" }
        }

        border {
            width: 1
            color: '#FFFFFF'
        }

        radius: root.implicitHeight / 2

    }

    Clock {anchors.centerIn: parent}

}