import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Universal 2.12

Rectangle {
    id: background

    width: 200
    height: 300
    color: "#090909"

    property alias txt_failed: txt_failed
    property alias rct_updateNeed: rct_updateNeed
    property alias btn_updateTimes: btn_updateTimes
    property alias txt_miladiTakvim: txt_miladiTakvim
    property alias txt_hicriTakvim: txt_hicriTakvim
    property alias background: background

    property alias txt_sehir: txt_sehir
    property alias txt_ulke: txt_ulke
    property alias ma_settings: ma_settings
    property alias lbl_gunes: lbl_gunes
    property alias lbl_yatsi: lbl_yatsi
    property alias lbl_aksam: lbl_aksam
    property alias lbl_ikindi: lbl_ikindi
    property alias lbl_ogle: lbl_ogle
    property alias lbl_imsak: lbl_imsak
    property alias txt_kalanIsim: txt_kalanIsim
    property alias txt_kalan: txt_kalan
    property alias txt_imsak: txt_imsak
    property alias txt_gunes: txt_gunes
    property alias txt_ogle: txt_ogle
    property alias txt_ikindi: txt_ikindi
    property alias txt_aksam: txt_aksam
    property alias txt_yatsi: txt_yatsi

    property var times: ["01:00", "02:00", "04:00", "05:00", "06:00", "07:00", "08:00"]
    property var timesTxts: [txt_imsak, txt_gunes, txt_ogle, txt_ikindi, txt_aksam, txt_yatsi]
    property var timesLbls: [lbl_imsak, lbl_gunes, lbl_ogle, lbl_ikindi, lbl_aksam, lbl_yatsi]

    Text {
        id: txt_sehir
        x: 58
        y: 8
        color: "#ffffff"
        text: "Yalova"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 13
    }

    Text {
        id: txt_ulke
        x: 79
        y: 30
        width: 42
        height: 12
        color: "#cccccc"
        text: "Turkiye"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 8
    }

    Text {
        id: txt_kalanIsim
        x: 62
        y: 242
        color: "#ffffff"
        text: "Ikindi'ye"
        anchors.horizontalCenterOffset: 0
        font.pointSize: 13
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: txt_kalan
        y: 264
        color: "#00ff00"
        text: "00:23:15"
        font.pointSize: 15
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        id: btn_settings
        x: 168
        y: 9
        width: 24
        height: 24
        color: ma_settings.containsMouse ? ma_settings.pressed ? "#00000a" : "#00402e" : "#00200e"
        radius: 7
        anchors.right: parent.right
        anchors.rightMargin: 8
        border.color: ma_settings.containsMouse ? "#ff00692e" : "#aa00692e"

        Image {
            id: img_settings
            x: 3
            y: 3
            width: 18
            height: 18
            source: "../img/settings_icon.png"
        }

        MouseArea {
            id: ma_settings
            hoverEnabled: true
            anchors.fill: parent

            cursorShape: Qt.PointingHandCursor
        }
    }

    Text {
        id: txt_miladiTakvim
        x: 95
        y: 50
        height: 12
        color: "#ffffff"
        text: "15 Temmuz 2020"
        anchors.right: rct_vakitler.right
        anchors.rightMargin: 7
        fontSizeMode: Text.HorizontalFit
        font.pointSize: 9
        horizontalAlignment: Text.AlignRight
    }

    Rectangle {
        id: rct_vakitler
        y: 88
        height: 148
        color: "#00000000"
        border.color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.right: parent.right
        anchors.rightMargin: 8

        Text {
            id: lbl_gunes
            x: 7
            y: 30
            color: "#ffffff"
            text: qsTr("Sunrise")
            font.pointSize: 11
        }

        Text {
            id: lbl_yatsi
            x: 7
            y: 122
            color: "#ffffff"
            text: qsTr("Isha")
            font.pointSize: 11
        }

        Text {
            id: lbl_aksam
            x: 7
            y: 99
            height: 20
            color: "#ffffff"
            text: qsTr("Maghrib")
            font.pointSize: 11
        }

        Text {
            id: lbl_ikindi
            x: 7
            y: 76
            color: "#ffffff"
            text: qsTr("Asr")
            font.pointSize: 11
        }

        Text {
            id: lbl_ogle
            x: 7
            y: 53
            color: "#ffffff"
            text: qsTr("Dhuhr")
            font.pointSize: 11
        }

        Text {
            id: lbl_imsak
            x: 7
            y: 7
            color: "#ffffff"
            text: qsTr("Fajr")
            font.pointSize: 11
        }

        Text {
            id: txt_yatsi
            x: 100
            y: 122
            width: 72
            color: "#ffffff"
            text: times[5]
            anchors.right: parent.right
            anchors.rightMargin: 7
            horizontalAlignment: Text.AlignRight
            font.pointSize: 11
        }

        Text {
            id: txt_aksam
            x: 100
            y: 99
            width: 72
            color: "#ffffff"
            text: times[4]
            anchors.right: parent.right
            anchors.rightMargin: 7
            horizontalAlignment: Text.AlignRight
            font.pointSize: 11
        }

        Text {
            id: txt_ikindi
            x: 100
            y: 76
            width: 72
            color: "#ffffff"
            text: times[3]
            anchors.right: parent.right
            anchors.rightMargin: 7
            horizontalAlignment: Text.AlignRight
            font.pointSize: 11
        }

        Text {
            id: txt_ogle
            x: 100
            y: 53
            width: 72
            color: "#ffffff"
            text: times[2]
            anchors.right: parent.right
            anchors.rightMargin: 7
            horizontalAlignment: Text.AlignRight
            font.pointSize: 11
        }

        Text {
            id: txt_gunes
            x: 100
            y: 30
            width: 72
            color: "#ffffff"
            text: times[1]
            anchors.right: parent.right
            anchors.rightMargin: 7
            horizontalAlignment: Text.AlignRight
            font.pointSize: 11
        }

        Text {
            id: txt_imsak
            x: 100
            y: 7
            width: 72
            color: "#ffffff"
            text: times[0]
            anchors.right: parent.right
            anchors.rightMargin: 7
            horizontalAlignment: Text.AlignRight
            font.pointSize: 11
        }

        Rectangle {
            id: rct_border
            height: 1
            color: "#ee00692e"
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Rectangle {
            id: rct_border1
            x: 9
            y: -6
            height: 1
            color: "#ee00692e"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.right: parent.right
            anchors.left: parent.left
        }
    }

    Text {
        id: txt_hicriTakvim
        x: 91
        y: 68
        height: 12
        color: "#00ff00"
        text: "27 Ramazan 1453"
        anchors.right: rct_vakitler.right
        anchors.rightMargin: 7
        font.pointSize: 9
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: lbl_miladi
        y: 50
        height: 12
        color: "#ffffff"
        text: qsTr("Gregorian:")
        anchors.left: rct_vakitler.left
        anchors.leftMargin: 7
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 9
        fontSizeMode: Text.HorizontalFit
    }

    Text {
        id: lbl_hicri
        y: 68
        height: 12
        color: "#00ff00"
        text: qsTr("Hijri:")
        anchors.leftMargin: 7
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 9
        anchors.left: rct_vakitler.left
        fontSizeMode: Text.HorizontalFit
    }
    Rectangle {
        id: rct_updateNeed
        enabled: visible
        color: "#111111"
        anchors.fill: parent
        visible: false

        Text {
            y: 71
            width: 145
            color: "#ffffff"
            text: qsTr("Internet required to update times.")
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
        }

        Button {
            id: btn_updateTimes
            x: 69
            y: 139
            width: 86
            height: 32
            text: qsTr("Update")
            anchors.verticalCenterOffset: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Text {
            id: txt_failed
            x: -9
            y: 208
            width: 145
            color: "#ff0000"
            text: qsTr("Failed!")
            visible: false
            font.bold: false
            anchors.horizontalCenterOffset: 0

            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
