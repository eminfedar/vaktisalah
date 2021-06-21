import QtQuick 2.5
import QtQuick.Controls 2.0

Rectangle {
    id: background

    width: 200
    height: 300
    color: "#111111"

    property alias btn_save: btn_save
    property alias background: background

    property alias sli_saydamlik: sli_saydamlik
    property alias cmb_districts: cmb_districts
    property alias sb_warnMin: sb_warnMin
    property alias cmb_cities: cmb_cities
    property alias cmb_countries: cmb_countries
    property alias ma_back: ma_back
    border.width: 0

    Text {
        id: lbl_title
        x: 89
        y: 12
        color: "#ffffff"
        text: qsTr("Ayarlar")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
    }

    Rectangle {
        id: btn_back
        x: 168
        y: 9
        width: 24
        height: 24
        color: ma_back.containsMouse ? ma_back.pressed ? "00000a" : "#00402e" : "#00200e"
        radius: 7
        anchors.right: parent.right
        anchors.rightMargin: 8
        border.color: ma_back.containsMouse ? "#ff00692e" : "#aa00692e"

        Image {
            id: img_back
            x: 3
            y: 3
            width: 18
            height: 18
            source: "../img/back_icon.png"
        }

        MouseArea {
            id: ma_back
            hoverEnabled: true
            anchors.fill: parent

            cursorShape: Qt.PointingHandCursor
        }
    }

    Rectangle {
        id: rct_border
        x: 11
        y: 39
        width: 179
        height: 1
        color: "#ee00692e"
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: lbl_saydamlik
        x: 12
        y: 178
        color: "#ffffff"
        text: qsTr("Arkaplan Saydamlığı:")
        anchors.left: rct_border.left
        anchors.leftMargin: 1
        font.pixelSize: 13
    }

    Slider {
        id: sli_saydamlik
        x: 12
        y: 197
        width: 176
        height: 24
        to: 255
        stepSize: 1
        value: 255
        anchors.left: rct_border.left
        anchors.leftMargin: 1
    }

    Text {
        id: lbl_countries2
        x: 12
        y: 117
        color: "#ffffff"
        text: "İlçe:"
        anchors.left: rct_border.left
        anchors.leftMargin: 1
        font.pixelSize: 13
    }

    ComboBox {
        id: cmb_districts
        x: 68
        y: 112
        width: 120
        height: 26
        anchors.right: rct_border.right
        anchors.rightMargin: 2
        font.pixelSize: 13
    }

    SpinBox {
        id: sb_warnMin
        x: 114
        y: 144
        width: 74
        height: 28
        from: 1
        value: 15
        to: 60
        anchors.right: rct_border.right
        anchors.rightMargin: 2
    }

    Text {
        id: lbl_warningmin
        x: 12
        y: 149
        color: "#ffffff"
        text: qsTr("Dakika kala uyar:")
        anchors.left: rct_border.left
        anchors.leftMargin: 1
        font.pixelSize: 13
    }

    Text {
        id: lbl_countries1
        x: 12
        y: 85
        color: "#ffffff"
        text: qsTr("Şehir:")
        anchors.left: rct_border.left
        anchors.leftMargin: 1
        font.pixelSize: 13
    }

    ComboBox {
        id: cmb_cities
        x: 68
        y: 80
        width: 120
        height: 26
        anchors.right: rct_border.right
        anchors.rightMargin: 2
        font.pixelSize: 13
    }

    Text {
        id: lbl_countries
        y: 53
        color: "#ffffff"
        text: qsTr("Ülke:")
        anchors.left: rct_border.left
        anchors.leftMargin: 1
        font.pixelSize: 13
    }

    ComboBox {
        id: cmb_countries
        x: 68
        y: 48
        width: 120
        height: 26
        anchors.right: rct_border.right
        anchors.rightMargin: 2
        font.pixelSize: 13
    }

    Connections {
        target: lbl_info
        function onLinkActivated() {
            Qt.openUrlExternally("https://github.com/eminfedar/vaktisalah")
        }
    }

    Text {
        id: lbl_info
        x: 17
        y: 270
        color: "#99ffffff"
        textFormat: Text.RichText
        text: "<style>a:link { color: #CC00FF00; text-decoration:none }</style>Fork on:
<a href=\"https://github.com/eminfedar/vaktisalah\">github/vaktisalah</a>"
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 11

        MouseArea {
            anchors.fill: parent
            cursorShape: lbl_info.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
            acceptedButtons: Qt.NoButton
        }
    }

    Rectangle {
        id: rct_border1
        x: 0
        y: 265
        width: 179
        height: 1
        color: "#ee00692e"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: btn_save
        x: 10
        y: 228
        width: 180
        height: 32
        text: qsTr("Kaydet")
        anchors.horizontalCenter: parent.horizontalCenter
        enabled: cmb_districts.model ? cmb_districts.model.length > 0 : false
    }
}

/*##^##
Designer {
    D{i:4;anchors_height:100;anchors_width:100}D{i:14;anchors_x:12}
}
##^##*/

