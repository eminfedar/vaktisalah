import QtQuick 2.7
import QtQuick.Window 2.2
import "praytimes.js" as PrayTimes
import org.eminfedar.file 1.0
import QtQuick.Controls 2.0
//import QtMultimedia 5.12
import "ui"

Window {
    id: root
    visible: true
    width: 210
    height: 300
    color: "#00000000"

    title: qsTr("Vakt-i Salah")
    flags: Qt.FramelessWindowHint | Qt.Window

    property string dataPath: ":/data/places.json"
    property string settingsPath: "./settings.json"

    property string selectedCountry: "Türkiye";
    property string selectedCity: "İstanbul";
    property string selectedDistrict: "İstanbul";
    property var selectedObj;

    property var jsonedAllData
    property var countries: []
    property var cities: []
    property var districts: []

    property int daylightSaving: 0
    property var vakitOffset: {"imsak":0, "fajr":0, "sunrise":-6, "dhuhr":6, "asr":4, "sunset":6, "maghrib":6, "isha":0}

    property point clickPos: "1,1" // for dragable window

    property date currentDate: new Date()
    property date tomorrowDate: new Date(currentDate.getTime() + (1000 * 60 * 60 * 24))
    property int warnMin: settingsForm.sb_warnMin.value
    property bool warned: false


    Component.onCompleted: {
        PrayTimes.prayTimes.setMethod('MWL')
        PrayTimes.prayTimes.tune(vakitOffset)

        readSettings();
        updateSelectedPlace()
    }

    Timer{
        id: secondTicker
        interval: 1000
        running: true
        repeat: true

        onTriggered: {
            refreshVakits();
        }
    }

    function refreshVakits() {
        currentDate = new Date()
        tomorrowDate = new Date(currentDate.getTime() + (1000 * 60 * 60 * 24))
        var tomorrowTimes = PrayTimes.prayTimes.getTimes(tomorrowDate, [selectedObj.lat, selectedObj.lon], selectedObj.timeZone, daylightSaving)
        var todayTimes = PrayTimes.prayTimes.getTimes(currentDate, [selectedObj.lat, selectedObj.lon], selectedObj.timeZone, daylightSaving)

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
    }

    function tickTime() {
        var timeDate = new Date()

        var i = 0
        for(i=0; i<mainForm.times.length; i++){
            timeDate.setHours(parseInt(mainForm.times[i].split(":")[0]))
            timeDate.setMinutes(parseInt(mainForm.times[i].split(":")[1]))
            timeDate.setSeconds(0, 0)
            if( timeDate.getTime() > currentDate.getTime() ){
                break
            }
        }

        var vakitDate = new Date();
        if(i === 7) {
            i = 6
            // tomorrow:
            vakitDate.setFullYear(tomorrowDate.getFullYear())
            vakitDate.setMonth(tomorrowDate.getMonth())
            vakitDate.setDate(tomorrowDate.getDate())
            vakitDate.setHours(mainForm.times[6].split(":")[0])
            vakitDate.setMinutes(mainForm.times[6].split(":")[1])
        } else {
            vakitDate.setFullYear(currentDate.getFullYear());
            vakitDate.setMonth(currentDate.getMonth());
            vakitDate.setDate(currentDate.getDate())
            vakitDate.setHours(mainForm.times[i].split(":")[0])
            vakitDate.setMinutes(mainForm.times[i].split(":")[1])
        }
        vakitDate.setSeconds(0, 0)

        var remainingTimeToNextVakit = vakitDate.getTime() - currentDate.getTime()
        //remainingTimeToNextVakit += (24 * 60 * 60 * 1000) // add 1 day
        remainingTimeToNextVakit -= ((selectedObj.timeZone-daylightSaving) * 60 * 60 * 1000) // remove timezone additional hours
        remainingTimeToNextVakit = new Date(remainingTimeToNextVakit)
        mainForm.txt_kalan.text = remainingTimeToNextVakit.toLocaleString(Qt.locale(),"hh:mm:ss")
        mainForm.txt_kalanIsim.text = getVakitName(i)

        // Colorize current vakit
        for(var k=0; k < mainForm.timesTxts.length; k++) {
            if (i === 6) {
                mainForm.timesTxts[0].color = "#00ff00";
                mainForm.timesLbls[0].color = "#00ff00";
                break
            }

            if (k === i) {
                mainForm.timesTxts[k].color = "#00ff00";
                mainForm.timesLbls[k].color = "#00ff00";
            } else {
                mainForm.timesTxts[k].color = "#ffffff";
                mainForm.timesLbls[k].color = "#ffffff";
            }
        }
        if (mainForm.txt_kalan.text.split(':')[0] === "00"
                && mainForm.txt_kalan.text.split(':')[1] === "15"
                && !warned) {
            settingsForm.visible = false
            mainForm.visible = true
            //playSound.play()
            root.show()
            root.raise()
            root.flags = Qt.WindowStaysOnTopHint | Qt.FramelessWindowHint | Qt.Window
            root.flags = Qt.FramelessWindowHint | Qt.Window
            warned = true

        } else if ( warned && mainForm.txt_kalan.text.split(':')[1] !== "15") {
            warned = false // reset warn.
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
        if (data.length > 0 && data.substring(0,3) !== "ERR") {
            var jsonedSettings = JSON.parse(data)

            selectedCountry = jsonedSettings.country
            selectedCity = jsonedSettings.city
            selectedDistrict = jsonedSettings.district
            root.x = jsonedSettings.x
            root.y = jsonedSettings.y
            settingsForm.sli_saydamlik.value = jsonedSettings.backgroundOpacity
            settingsForm.sb_warnMin.value = warnMin = jsonedSettings.warnMin
        } else {
            saveSettings()
            readSettings()
        }
    }

    function saveSettings() {
        var obj = {
            country: selectedCountry,
            city: selectedCity,
            district: selectedDistrict,
            x: root.x,
            y: root.y,
            warnMin: settingsForm.sb_warnMin.value,
            backgroundOpacity: settingsForm.sli_saydamlik.value
        }

        file.saveFile(settingsPath, JSON.stringify(obj))
    }

    function updateSelectedPlace() {
        var data = file.readFile(dataPath)
        if (data.length > 0 && data.substring(0,3) !== "ERR") {
            jsonedAllData = JSON.parse(data)

            countries = Object.keys(jsonedAllData)
            settingsForm.cmb_countries.model = countries
            settingsForm.cmb_countries.currentIndex = countries.indexOf(selectedCountry)

            cities = jsonedAllData[selectedCountry]
            settingsForm.cmb_cities.model = Object.keys(cities)
            settingsForm.cmb_cities.currentIndex = settingsForm.cmb_cities.model.indexOf(selectedCity)

            districts = jsonedAllData[selectedCountry][selectedCity]
            settingsForm.cmb_districts.model = Object.keys(districts)
            settingsForm.cmb_districts.currentIndex = settingsForm.cmb_districts.model.indexOf(selectedDistrict)

            mainForm.txt_sehir.text = selectedDistrict
            mainForm.txt_ulke.text = selectedCountry

            selectedObj = districts[selectedDistrict]
            refreshVakits()
        }
    }

    MouseArea {
        id: dragger
        anchors.fill: parent
        preventStealing: true

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

            saveSettings()
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
            selectedCountry = settingsForm.cmb_countries.currentText

            cities = jsonedAllData[selectedCountry]
            districts = jsonedAllData[selectedCountry][Object.keys(cities)[0]]

            selectedCity = Object.keys(cities)[0]
            selectedDistrict = Object.keys(districts)[0]

            settingsForm.cmb_cities.model = Object.keys(cities)
            settingsForm.cmb_districts.model = Object.keys(districts)

            updateSelectedPlace()
            saveSettings()
        }
    }

    Connections {
        target: settingsForm.cmb_cities
        onActivated: {
            selectedCity = settingsForm.cmb_cities.currentText

            districts = jsonedAllData[selectedCountry][selectedCity]
            settingsForm.cmb_districts.model = Object.keys(districts)

            selectedDistrict = Object.keys(districts)[0]

            updateSelectedPlace()
            saveSettings()
        }
    }

    Connections {
        target: settingsForm.cmb_districts
        onActivated: {
            var districtName = settingsForm.cmb_districts.currentText
            selectedDistrict = districtName

            updateSelectedPlace()
            saveSettings()
        }
    }

    Connections {
        target: settingsForm.cb_yazsaati
        onCheckStateChanged: {
            daylightSaving = settingsForm.cb_yazsaati.checkState === Qt.Checked ? 1 : 0
        }
    }

    Connections {
        target: settingsForm.sli_saydamlik
        onValueChanged: {
            var colorCode = settingsForm.sli_saydamlik.value.toString(16);
            if (colorCode.length === 1) colorCode = "0" + colorCode;
            mainForm.background.color = settingsForm.background.color = "#" + colorCode + "000000"

            saveSettings();
        }
    }

    /* SoundEffect {
        id: playSound
        source: "qrc:/sound/warn.wav"
    } */

}
