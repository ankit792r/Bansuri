import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Item {
    id: root
    width: Screen.width
    height: Screen.height
    focus: true

    /* =====================
       BACKGROUND + BLUR
       ===================== */
    Image {
        id: background
        anchors.fill: parent
        source: "~/Downloads/forest.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    FastBlur {
        anchors.fill: parent
        source: background
        radius: 6
    }

    /* =====================
       TIME
       ===================== */
    Text {
        id: timeLabel
        text: Qt.formatDateTime(new Date(), "hh:mm")
        font.pixelSize: 90
        font.family: "JetBrains Mono"
        color: "#E6E6E6"

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 40
        anchors.bottomMargin: 200

        opacity: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
                easing.type: Easing.Linear
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: timeLabel.text =
                Qt.formatDateTime(new Date(), "hh:mm")
        }

        Component.onCompleted: opacity = 1.0
    }

    /* =====================
       DATE
       ===================== */
    Text {
        id: dateLabel
        text: Qt.formatDateTime(new Date(), "dddd, dd MMMM yyyy")
        font.pixelSize: 18
        font.family: "JetBrains Mono"
        color: "#8F8F8F"

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 40
        anchors.bottomMargin: 170

        opacity: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
                easing.type: Easing.Linear
            }
        }

        Component.onCompleted: opacity = 1.0
    }

    /* =====================
       PASSWORD FIELD
       ===================== */
    Rectangle {
        id: inputBox
        width: parent.width * 0.18
        height: parent.height * 0.05

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 40
        anchors.bottomMargin: 70

        radius: 2
        color: "transparent"
        border.width: 2
        border.color: "#33CCFF"

        opacity: 0.0
        Behavior on opacity {
            NumberAnimation {
                duration: 500
                easing.type: Easing.Linear
            }
        }

        TextInput {
            id: password
            anchors.fill: parent
            anchors.margins: 8

            focus: true
            echoMode: TextInput.Password
            passwordCharacter: "•"

            font.family: "JetBrains Mono"
            font.pixelSize: 16
            color: "#8F8F8F"
            selectionColor: "#33CCFF"

            Keys.onReturnPressed: {
                sddm.login(sddm.user, password.text, sddm.session)
            }
        }

        Component.onCompleted: opacity = 1.0
    }

    /* =====================
       ERROR FEEDBACK
       ===================== */
    Connections {
        target: sddm
        function onLoginFailed() {
            inputBox.border.color = "#FF6633"
            password.text = ""
        }
        function onLoginSucceeded() {
            inputBox.border.color = "#33CCFF"
        }
    }
}

