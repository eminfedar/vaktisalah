import QtQuick 2.5
import QtQuick.Controls 2.3

Rectangle {
    id: background

    width: 200
    height: 290
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
        id: txt_imsak
        x: 110
        y: 80
        width: 72
        color: "#ffffff"
        text: times[0]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_gunes
        x: 110
        y: 103
        width: 72
        color: "#ffffff"
        text: times[1]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_ogle
        x: 110
        y: 126
        width: 72
        color: "#ffffff"
        text: times[2]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_ikindi
        x: 110
        y: 149
        width: 72
        color: "#ffffff"
        text: times[3]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_aksam
        x: 110
        y: 172
        width: 72
        color: "#ffffff"
        text: times[4]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_yatsi
        x: 110
        y: 195
        width: 72
        color: "#ffffff"
        text: times[5]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: lbl_imsak
        x: 17
        y: 80
        color: "#ffffff"
        text: qsTr("İmsak")
        font.pixelSize: 14
    }

    Text {
        id: lbl_ogle
        x: 17
        y: 126
        color: "#ffffff"
        text: qsTr("Öğle")
        font.pixelSize: 14
    }

    Text {
        id: lbl_ikindi
        x: 17
        y: 149
        color: "#ffffff"
        text: qsTr("İkindi")
        font.pixelSize: 14
    }

    Text {
        id: lbl_aksam
        x: 17
        y: 172
        height: 20
        color: "#ffffff"
        text: qsTr("Akşam")
        font.pixelSize: 14
    }

    Text {
        id: lbl_yatsi
        x: 17
        y: 195
        color: "#ffffff"
        text: qsTr("Yatsı")
        font.pixelSize: 14
    }

    Text {
        id: lbl_gunes
        x: 17
        y: 103
        color: "#ffffff"
        text: qsTr("Güneş")
        font.pixelSize: 14
    }

    Text {
        id: txt_sehir
        x: 58
        y: 10
        color: "#ffffff"
        text: qsTr("-")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
    }

    Text {
        id: txt_ulke
        x: 79
        y: 34
        width: 42
        height: 12
        color: "#cccccc"
        text: qsTr("-")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 11
    }

    Text {
        id: txt_kalanIsim
        x: 62
        y: 231
        color: "#ffffff"
        text: qsTr("-")
        anchors.horizontalCenterOffset: 0
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: txt_kalan
        x: 55
        y: 252
        color: "#00ff00"
        text: qsTr("-")
        font.pixelSize: 22
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        id: rct_border
        x: 0
        y: 221
        width: 179
        height: 1
        color: "#ee00692e"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: rct_border1
        x: -8
        y: 73
        width: 179
        height: 1
        color: "#ee00692e"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
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
        y: 53
        width: 67
        height: 12
        color: "#ffffff"
        text: qsTr("-")
        anchors.left: parent.left
        anchors.leftMargin: 11
        font.pixelSize: 12
        horizontalAlignment: Text.AlignLeft
    }

    Text {
        id: txt_hicriTakvim
        x: 115
        y: 53
        width: 67
        height: 12
        color: "#00ff00"
        text: qsTr("-")
        anchors.right: parent.right
        anchors.rightMargin: 11
        font.pixelSize: 12
        horizontalAlignment: Text.AlignRight
    }

    Rectangle {
        id: rct_updateNeed
        width: 200
        height: 290
        enabled: visible
        color: "#111111"
        visible: false

        Text {
            y: 71
            width: 145
            color: "#ffffff"
            text: qsTr("Vakitlerin güncellenmesi için internet gerekli.")
            anchors.horizontalCenter: parent.horizontalCenter
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 14
        }

        Button {
            id: btn_updateTimes
            x: 69
            y: 139
            width: 86
            height: 32
            text: qsTr("Güncelle")
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
            text: qsTr("Başarısız!")
            visible: false
            font.bold: false
            anchors.horizontalCenterOffset: 0
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }
}

/*##^##
Designer {
    D{i:21;anchors_height:100;anchors_width:100}D{i:19;anchors_width:24;anchors_x:168}
D{i:23;anchors_x:17}D{i:24;invisible:true}
}
##^##*/

