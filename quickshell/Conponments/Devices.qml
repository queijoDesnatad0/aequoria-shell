import QtQuick
import Quickshell
import Quickshell.Io

Item {
    id: root

    implicitWidth: 40
    implicitHeight: 40

    property var usbDevices: []

    Process {
        id: usbProcess
        command: ["/usr/sbin/lsusb"]


        stdout: StdioCollector {
            onStreamFinished: {
                root.usbDevices = this.text
                    .trim()
                    .split("\n")
                    .filter(line => line.length > 0)
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: if (!usbProcess.running) usbProcess.running = true
    }

    Component.onCompleted: usbProcess.running = true

    Rectangle {
        id: usbButton
        width:  40
        height: 40
        radius: 14
        color: buttonMouse.containsMouse ? "#80FFFFFF" : "transparent"

        Text {
            anchors.centerIn: parent
            text: ""
            color: "#ffffff"
            font.family: "Symbols Nerd Font"
            font.pixelSize: 20
        }

        MouseArea {
            id: buttonMouse
            anchors.fill: parent
            hoverEnabled: true
            onClicked: usbPopup.visible = !usbPopup.visible
        }
    }

    PopupWindow {
        id: usbPopup
        anchor.item: usbButton
        anchor.edges: Edges.Right | Edges.VerticalCenter
        anchor.gravity: Edges.Right | Edges.VerticalCenter

        grabFocus: true
        visible: false

        width:  320
        height: 300

        color: "transparent"

        Rectangle {
            anchors.fill: parent
            radius: 14
            color: "#00FFFFFF"
            border {
                color: "#80FFFFFF"
                width: 4
            }

            Column {
                anchors.fill: parent
                anchors.margins: 7
                spacing: 7

                Text {
                    text: "Hardware Conectado"
                    color: "#FFFFFF"
                    font.pixelSize: 16
                    font.weight: Font.DemiBold
                }

                Text {
                    visible: root.usbDevices.length === 0
                    text: "Nenhum dispositivo encontrado"
                    color: "#80000000"
                    font.pixelSize: 14
                }

                ListView {
                    width: parent.width
                    height: parent.height - 32
                    spacing: 6
                    clip: true
                    model: root.usbDevices

                    delegate: Rectangle {
                        required property string modelData

                        width: ListView.view.width
                        height: 44
                        radius: 8
                        color: "#808000FF"

                        Text {
                            anchors.fill: parent
                            anchors.margins: 10
                            verticalAlignment: Text.AlignVCenter
                            text: modelData
                            color: "#FFFFFF"
                            font.pixelSize: 12
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }
    }
}
