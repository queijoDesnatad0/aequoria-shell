import QtQuick
import Quickshell
import Quickshell.Networking

Rectangle {
    id: root

    width:  40
    height: 40
    radius: 14
    color: mouseArea.containsMouse ? "#80FFFFFF" : "transparent"

    property bool popupOpen: false

    readonly property var wifiDevice:
        Networking.devices.values.find(
            device => device.type === DeviceType.Wifi
        ) ?? null

    Text {
        anchors.centerIn: parent
        text: Networking.wifiEnabled ? "󰤨" : "󰖪"
        color: "#FFFFFF"
        font.pixelSize: 20
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.popupOpen = !root.popupOpen
    }

    PopupWindow {
        id: wifiPopup
        anchor.item: root
        anchor.edges: Edges.Right | Edges.VerticalCenter
        anchor.gravity: Edges.Right | Edges.VerticalCenter

        visible: root.popupOpen
        grabFocus: true
        width: 280
        height: 340
        color: "transparent"

        onVisibleChanged: {
            if (root.wifiDevice)
                root.wifiDevice.scannerEnabled = visible && Networking.wifiEnabled
        }

        Rectangle {
            anchors.fill: parent
            radius: 14
            color: "#00FFFFFF"
            border.color: "#80FFFFFF"
            border.width: 4

            Column {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 10

                Text {
                    text: Networking.wifiEnabled ? "Redes Wi-Fi" : "Wi-Fi desligado"
                    color: "#ffffff"
                    font.pixelSize: 16
                    font.weight: Font.DemiBold
                }

                ListView {
                    width: parent.width
                    height: parent.height - 32
                    spacing: 6
                    clip: true
                    model: Networking.wifiEnabled && root.wifiDevice
                           ? root.wifiDevice.networks
                           : null

                    delegate: Rectangle {
                        required property var modelData

                        width: ListView.view.width
                        height: 48
                        radius: 8
                        color: networkMouse.containsMouse
                               ? "#8000FF" : "#808000FF"

                        Column {
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.leftMargin: 10
                            anchors.rightMargin: 10
                            spacing: 3

                            Text {
                                width: parent.width
                                text: modelData.name
                                color: "#FFFFFF"
                                font.pixelSize: 13
                                elide: Text.ElideRight
                            }

                            Text {
                                text: modelData.connected
                                      ? "Conectada"
                                      : modelData.known ? "Salva" : ""
                                color: "#FFFFFF"
                                font.pixelSize: 11
                            }
                        }

                        MouseArea {
                            id: networkMouse
                            anchors.fill: parent
                            hoverEnabled: true
                            enabled: !modelData.connected
                            onClicked: modelData.connect()
                        }
                    }
                }
            }
        }
    }
}
