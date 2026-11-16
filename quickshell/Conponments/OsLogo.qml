import Quickshell
import QtQuick

Rectangle {
    id: root

    width: 40
    height: 40
    radius: 360
    color: "#FFFFFF"

    border {
        width: 2
        color: "#8000FF"
    }
    

    Rectangle {
        anchors.fill: parent

        color: mouseArea.containsMouse ? "#808000FF" : "transparent"

        radius: root.radius
    }

    Text {
    anchors.centerIn: parent
    text: ""
    color: "#000000"
    font.family: "Symbols Nerd Font"
    font.pixelSize: 23
}


    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onClicked: Quickshell.execDetached(["wofi", "--show", "drun"])
    }
}
