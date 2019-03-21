import QtQuick 2.7
import QtQuick.Controls 2.5

Rectangle {
    id: rectangle

    width: 200
    height: 290
    color: "#bb000000"
    property alias cmb_cities: cmb_cities
    property alias cmb_countries: cmb_countries
    property alias ma_back: ma_back
    border.width: 0

    Rectangle {
        id: btn_back
        x: 168
        y: 9
        width: 24
        height: 24
        color: ma_back.containsMouse ? ma_back.pressed ? "00000a" : "#00402e" : "#00200e"
        radius: 7
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

    ComboBox {
        id: cmb_countries
        x: 68
        y: 51
        width: 120
        height: 26
        font.pixelSize: 13
    }

    Text {
        id: lbl_countries
        x: 12
        y: 56
        color: "#ffffff"
        text: qsTr("Ülke:")
        font.pixelSize: 12
    }

    ComboBox {
        id: cmb_cities
        x: 68
        y: 83
        width: 120
        height: 26
        font.pixelSize: 13
    }

    Text {
        id: lbl_countries1
        x: 12
        y: 88
        color: "#ffffff"
        text: qsTr("Şehir:")
        font.pixelSize: 12
    }

    Text {
        id: element
        x: 89
        y: 13
        color: "#ffffff"
        text: qsTr("Ayarlar")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 14
    }

    Rectangle {
        id: rct_border
        x: 0
        y: 41
        width: 179
        height: 1
        color: "#ee00692e"
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
    }
}




/*##^## Designer {
    D{i:3;anchors_height:100;anchors_width:100}
}
 ##^##*/
