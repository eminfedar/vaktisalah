import QtQuick 2.5

Rectangle {
    id: rectangle

    width: 200
    height: 290
    color: "#cc000000"
    property alias txt_error: txt_error

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

    property var times: []
    property var timesTxts: [txt_imsak, txt_gunes, txt_ogle, txt_ikindi, txt_aksam, txt_yatsi]
    property var timesLbls: [lbl_imsak, lbl_gunes, lbl_ogle, lbl_ikindi, lbl_aksam, lbl_yatsi]

    Text {
        id: txt_imsak
        x: 110
        y: 68
        width: 72
        color: "#ffffff"
        text: times[0]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_gunes
        x: 110
        y: 90
        width: 72
        color: "#ffffff"
        text: times[1]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_ogle
        x: 110
        y: 112
        width: 72
        color: "#ffffff"
        text: times[2]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_ikindi
        x: 110
        y: 134
        width: 72
        color: "#ffffff"
        text: times[3]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_aksam
        x: 110
        y: 156
        width: 72
        color: "#ffffff"
        text: times[4]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: txt_yatsi
        x: 110
        y: 178
        width: 72
        color: "#ffffff"
        text: times[5]
        horizontalAlignment: Text.AlignRight
        font.pixelSize: 14
    }

    Text {
        id: lbl_imsak
        x: 17
        y: 68
        color: "#ffffff"
        text: qsTr("İmsak")
        font.pixelSize: 14
    }

    Text {
        id: lbl_ogle
        x: 17
        y: 112
        color: "#ffffff"
        text: qsTr("Öğle")
        font.pixelSize: 14
    }

    Text {
        id: lbl_ikindi
        x: 17
        y: 134
        color: "#ffffff"
        text: qsTr("İkindi")
        font.pixelSize: 14
    }

    Text {
        id: lbl_aksam
        x: 17
        y: 156
        color: "#ffffff"
        text: qsTr("Akşam")
        font.pixelSize: 14
    }

    Text {
        id: lbl_yatsi
        x: 17
        y: 178
        color: "#ffffff"
        text: qsTr("Yatsı")
        font.pixelSize: 14
    }

    Text {
        id: lbl_gunes
        x: 17
        y: 90
        color: "#ffffff"
        text: qsTr("Güneş")
        font.pixelSize: 14
    }

    Text {
        id: txt_sehir
        x: 58
        y: 10
        color: "#ffffff"
        text: qsTr("SAKARYA")
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
        text: qsTr("TÜRKİYE")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 11
    }

    Text {
        id: txt_kalanIsim
        x: 62
        y: 223
        color: "#ffffff"
        text: qsTr("Öğle'ye:")
        anchors.horizontalCenterOffset: 0
        font.pixelSize: 18
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: txt_kalan
        x: 55
        y: 247
        color: "#00ff00"
        text: qsTr("06:28:13")
        font.pixelSize: 22
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 0
        horizontalAlignment: Text.AlignHCenter
    }

    Rectangle {
        id: rct_border
        x: 0
        y: 212
        width: 179
        height: 1
        color: "#ee00692e"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: rct_border1
        x: -8
        y: 56
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
        id: txt_error
        x: 8
        y: 14
        width: 154
        height: 260
        color: "#ff0000"
        wrapMode: Text.WrapAnywhere
        font.pixelSize: 12
    }
}




/*##^## Designer {
    D{i:21;anchors_height:100;anchors_width:100}
}
 ##^##*/
