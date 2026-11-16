import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Item {
    id: root

    implicitWidth: 40
    implicitHeight: 40

    NotificationServer {
        id: notificationServer
        actionsSupported: true
        persistenceSupported: true

        onNotification: notification.tracked = true
    }

    Rectangle {
        id: notificationButton
        width:  40
        height: 40
        radius: 14
        color: buttonMouse.containsMouse ? "#80FFFFFF" : "transparent"

        Text {
            anchors.centerIn: parent
            text: "󰂚"
            color: "#ffffff"
            font.family: "Symbols Nerd Font"
            font.pixelSize: 20
        }

        MouseArea {
            id: buttonMouse
            anchors.fill: parent
            hoverEnabled: true
            onClicked: popup.visible = !popup.visible
        }
    }

    PopupWindow {
        id: popup
        anchor.item: notificationButton
        anchor.edges: Edges.Right | Edges.VerticalCenter
        anchor.gravity: Edges.Right | Edges.VerticalCenter

        grabFocus: true
        visible: false
        
        width: 320
        height: 420
        color: "transparent"

        Rectangle {
            anchors.fill: parent
            radius: 14
            color: "#00FFFFFF"
            border.width: 4
            border.color: "#80FFFFFF"

            Column {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 10

                Text {
                    text: "Notificações"
                    color: "#FFFFFF"
                    font.pixelSize: 14
                    font.weight: Font.DemiBold
                }

                ListView {
                    width: parent.width
                    height: parent.height - 32
                    spacing: 8
                    clip: true
                    model: notificationServer.trackedNotifications

                    delegate: Rectangle {
                        required property var modelData

                        width: ListView.view.width
                        implicitHeight: contentColumn.implicitHeight + 20
                        radius: 10
                        color: "#808000FF"

                        Column {
                            id: contentColumn
                            anchors.left: parent.left
                            anchors.right: closeButton.left
                            anchors.top: parent.top
                            anchors.margins: 10
                            spacing: 5

                            Text {
                                width: parent.width
                                text: modelData.summary
                                color: "#ffffff"
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                wrapMode: Text.Wrap
                            }

                            Text {
                                width: parent.width
                                text: modelData.body
                                color: "#FFFFFF"
                                font.pixelSize: 12
                                wrapMode: Text.Wrap
                                textFormat: Text.PlainText
                            }
                        }

                        Text {
                            id: closeButton
                            anchors.top: parent.top
                            anchors.right: parent.right
                            anchors.margins: 8
                            text: "×"
                            color: "#FFFFFF"
                            font.pixelSize: 18

                            MouseArea {
                                anchors.fill: parent
                                anchors.margins: -6
                                onClicked: modelData.dismiss()
                            }
                        }
                    }
                }
            }
        }
    }
}
