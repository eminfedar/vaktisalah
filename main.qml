import QtQuick 2.7
import QtQuick.Window 2.2
import "praytimes.js" as PrayTimes
import org.eminfedar.file 1.0
import systemtrayicon 1.0
import QtQuick.Controls 1.4
import "ui"

Window {
    id: root
    visible: true
    width: 210
    height: 300
    color: "#00000000"
    title: qsTr("Vakt-i Salah")
    flags: Qt.FramelessWindowHint | Qt.Window

    property string dataPath: "../data/places.json"
    property string settingsPath: "./settings.json"

    property string selectedCountry: "Türkiye";
    property string selectedCity : "İstanbul";
    property var selectedObj;

    property var jsonedAllData
    property var countries: []
    property var cities: []
    property var vakitOffset: {"imsak":0, "fajr":0, "sunrise":-5, "dhuhr":6, "asr":4, "sunset":6, "maghrib":6, "isha":0}

    property point clickPos: "1,1" // for dragable window

    property date currentDate: new Date()
    property date tomorrowDate: new Date(currentDate.getTime() + (1000 * 60 * 60 * 24))

    Component.onCompleted: {
        PrayTimes.prayTimes.setMethod('MWL');
        PrayTimes.prayTimes.tune(vakitOffset);

        readSettings();
        updateCountryCity()
        trayIcon.show()
    }

    Timer{
        id: timer
        interval: 1000
        running: false
        repeat: true

        onTriggered: {
            tickTime();
        }
    }

    function refreshVakits() {
        var tomorrowTimes = PrayTimes.prayTimes.getTimes(tomorrowDate, [selectedObj.lat, selectedObj.long], selectedObj.timeZone)
        var todayTimes = PrayTimes.prayTimes.getTimes(currentDate, [selectedObj.lat, selectedObj.long], selectedObj.timeZone)

        var newTimes = []
        newTimes[0] = todayTimes["fajr"]
        newTimes[1] = todayTimes["sunrise"]
        newTimes[2] = todayTimes["dhuhr"]
        newTimes[3] = todayTimes["asr"]
        newTimes[4] = todayTimes["maghrib"]
        newTimes[5] = todayTimes["isha"]
        newTimes[6] = tomorrowTimes["fajr"]
        mainForm.times = newTimes

        tickTime()
        timer.start()
    }

    function tickTime() {
        var nowDate = new Date()
        var hourNow = nowDate.getHours()
        var minuteNow = nowDate.getMinutes()
        var hourTimes = -99
        var minuteTimes = -99

        var i = 0
        for(i=0; i<mainForm.times.length; i++){
            hourTimes = parseInt(mainForm.times[i].split(":")[0])
            minuteTimes = parseInt(mainForm.times[i].split(":")[1])
            if(hourNow < hourTimes){
                break
            }
        }

        var vakitDate = new Date();
        if(i === 6) {
            // tomorrow:
            vakitDate.setFullYear(laterDay.getFullYear())
            vakitDate.setMonth(laterDay.getMonth())
            vakitDate.setDate(laterDay.getDate())
            vakitDate.setHours(mainForm.times[6].split(":")[0])
            vakitDate.setMinutes(mainForm.times[6].split(":")[1])
        } else {
            vakitDate.setFullYear(nowDate.getFullYear());
            vakitDate.setMonth(nowDate.getMonth());
            vakitDate.setDate(nowDate.getDate())
            vakitDate.setHours(mainForm.times[i].split(":")[0])
            vakitDate.setMinutes(mainForm.times[i].split(":")[1])
        }
        vakitDate.setSeconds(0)

        var remainingTimeToNextVakit = vakitDate.getTime() - nowDate.getTime()
        remainingTimeToNextVakit -= (3 * 60 * 60 * 1000) // remove 3 additional hours
        mainForm.txt_kalan.text = new Date(remainingTimeToNextVakit).toLocaleString(Qt.locale(),"hh:mm:ss")
        mainForm.txt_kalanIsim.text = getVakitName(i);

        // Colorize current vakit
        for(var k=0; k < mainForm.timesTxts.length; k++) {
            if (k === i) {
                mainForm.timesTxts[k].color = "#00ff00";
                mainForm.timesLbls[k].color = "#00ff00";
            } else {
                mainForm.timesTxts[k].color = "#ffffff";
                mainForm.timesLbls[k].color = "#ffffff";
            }
        }
    }

    function getVakitName(i){
        if (i === 0 || i === 6){
            return "Sabah'a"
        } else if (i === 1){
            return "Güneş'e"
        } else if (i === 2){
            return "Öğle'ye"
        } else if (i === 3){
            return "İkindi'ye"
        } else if (i === 4){
            return "Akşam'a"
        } else if (i === 5){
            return "Yatsı'ya"
        }
    }

    File {
        id: file
    }

    function readSettings() {
        var data = file.readFile(settingsPath)
        if (data.length > 0) {
            var jsonedSettings = JSON.parse(data)

            selectedCountry = jsonedSettings.country
            selectedCity = jsonedSettings.city
            root.x = jsonedSettings.x
            root.y = jsonedSettings.y
        }
    }

    function saveSettings() {
        var obj = {
            country: selectedCountry,
            city: selectedCity,
            x: root.x,
            y: root.y
        }

        file.saveFile(settingsPath, JSON.stringify(obj))
    }

    function updateCountryCity() {
        var data = file.readFile(dataPath)
        jsonedAllData = JSON.parse(data)

        countries = Object.keys(jsonedAllData)
        settingsForm.cmb_countries.model = countries
        settingsForm.cmb_countries.currentIndex = countries.indexOf(selectedCountry)

        cities = jsonedAllData[selectedCountry]
        settingsForm.cmb_cities.model = Object.keys(cities)
        settingsForm.cmb_cities.currentIndex = settingsForm.cmb_cities.model.indexOf(selectedCity)

        mainForm.txt_sehir.text = selectedCity
        mainForm.txt_ulke.text = selectedCountry

        selectedObj = cities[selectedCity]
        refreshVakits()
    }

    MouseArea {
        id: dragger
        anchors.fill: parent

        onPressed: {
            clickPos = Qt.point(mouse.x, mouse.y)
        }

        onPositionChanged: {
            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            root.x += delta.x
            root.y += delta.y
        }

        onReleased: {
            saveSettings()
        }
    }

    Connections {
        target: mainForm.ma_settings
        onClicked: {
            settingsForm.visible = true
            mainForm.visible = false
        }
    }

    Connections {
        target: settingsForm.ma_back
        onClicked: {
            settingsForm.visible = false
            mainForm.visible = true
        }
    }

    MainForm {
        id: mainForm
        radius: 15
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        anchors.fill: parent
        times: []
        visible: true
    }

    Settings {
        id: settingsForm
        radius: 15
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        anchors.fill: parent
        visible: false
    }

    Connections {
        target: settingsForm.cmb_countries
        onActivated: {
            var countryName = settingsForm.cmb_countries.currentText
            cities = jsonedAllData[countryName]
            selectedCountry = countryName
            settingsForm.cmb_cities.model = Object.keys(cities)

            saveSettings()
        }
    }

    Connections {
        target: settingsForm.cmb_cities
        onActivated: {
            var cityName = settingsForm.cmb_cities.currentText
            selectedCity = cityName

            updateCountryCity()
            saveSettings()
        }
    }

    TrayIcon {
        id: trayIcon
        icon: iconTray
        toolTip: root.title

        onActivated: {
            if(reason === 1){
                trayMenu.popup()
            } else {
                if(root.visibility === Window.Hidden) {
                    root.show()
                } else {
                    root.hide()
                }
            }
        }
    }

    // Menu system tray
    Menu {
        id: trayMenu
        MenuItem {
            text: qsTr("Exit")
            onTriggered: {
                trayIcon.hide()
                Qt.quit()
            }
        }
    }

}
