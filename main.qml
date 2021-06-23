import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Controls.Universal 2.12
import QtQuick.Window 2.12
import QtMultimedia 5.12

import org.eminfedar.file 1.0
import "ui"

Window {
    id: root
    visible: true
    width: 200
    height: 300
    color: "#00000000"

    title: "Vakt-i Salah"

    flags: Qt.FramelessWindowHint | Qt.Window

    property string settingsPath: "settings.json";
    property date lastUpdateDate: new Date("01/01/2000");
    property int lastUpdateDayDiff: 0

    property string selectedCountry: "TÜRKİYE";
    property string selectedCity: "İSTANBUL";
    property string selectedDistrict: "İSTANBUL";
    property var selectedDistrictTimes: [];

    property var countries: {"ABD":{"id":"33"},"AFGANISTAN":{"id":"166"},"ALMANYA":{"id":"13"},"ANDORRA":{"id":"17"},"ANGOLA":{"id":"140"},"ANGUILLA":{"id":"125"},"ANTIGUA VE BARBUDA":{"id":"90"},"ARJANTIN":{"id":"199"},"ARNAVUTLUK":{"id":"25"},"ARUBA":{"id":"153"},"AVUSTRALYA":{"id":"59"},"AVUSTURYA":{"id":"35"},"AZERBAYCAN":{"id":"5"},"BAHAMALAR":{"id":"54"},"BAHREYN":{"id":"132"},"BANGLADES":{"id":"177"},"BARBADOS":{"id":"188"},"BELARUS":{"id":"208"},"BELCIKA":{"id":"11"},"BELIZE":{"id":"182"},"BENIN":{"id":"181"},"BERMUDA":{"id":"51"},"BIRLESIK ARAP EMIRLIGI":{"id":"93"},"BOLIVYA":{"id":"83"},"BOSNA HERSEK":{"id":"9"},"BOTSVANA":{"id":"167"},"BREZILYA":{"id":"146"},"BRUNEI":{"id":"97"},"BULGARISTAN":{"id":"44"},"BURKINA FASO":{"id":"91"},"BURMA (MYANMAR)":{"id":"154"},"BURUNDI":{"id":"65"},"BUTAN":{"id":"155"},"CAD":{"id":"156"},"CECENISTAN":{"id":"43"},"CEK CUMHURIYETI":{"id":"16"},"CEZAYIR":{"id":"86"},"CIBUTI":{"id":"160"},"CIN":{"id":"61"},"DANIMARKA":{"id":"26"},"DEMOKRATIK KONGO CUMHURIYETI":{"id":"180"},"DOGU TIMOR":{"id":"176"},"DOMINIK":{"id":"123"},"DOMINIK CUMHURIYETI":{"id":"72"},"EKVATOR":{"id":"139"},"EKVATOR GINESI":{"id":"63"},"EL SALVADOR":{"id":"165"},"ENDONEZYA":{"id":"117"},"ERITRE":{"id":"175"},"ERMENISTAN":{"id":"104"},"ESTONYA":{"id":"6"},"ETYOPYA":{"id":"95"},"FAS":{"id":"145"},"FIJI":{"id":"197"},"FILDISI SAHILI":{"id":"120"},"FILIPINLER":{"id":"126"},"FILISTIN":{"id":"204"},"FINLANDIYA":{"id":"41"},"FRANSA":{"id":"21"},"GABON":{"id":"79"},"GAMBIYA":{"id":"109"},"GANA":{"id":"143"},"GINE":{"id":"111"},"GRENADA":{"id":"58"},"GRONLAND":{"id":"48"},"GUADELOPE":{"id":"171"},"GUAM ADASI":{"id":"169"},"GUATEMALA":{"id":"99"},"GUNEY AFRIKA":{"id":"67"},"GUNEY KORE":{"id":"128"},"GURCISTAN":{"id":"62"},"GUYANA":{"id":"82"},"HAITI":{"id":"70"},"HINDISTAN":{"id":"187"},"HIRVATISTAN":{"id":"30"},"HOLLANDA":{"id":"4"},"HOLLANDA ANTILLERI":{"id":"66"},"HONDURAS":{"id":"105"},"HONG KONG":{"id":"113"},"INGILTERE":{"id":"15"},"IRAK":{"id":"124"},"IRAN":{"id":"202"},"IRLANDA":{"id":"32"},"ISPANYA":{"id":"23"},"ISRAIL":{"id":"205"},"ISVEC":{"id":"12"},"ISVICRE":{"id":"49"},"ITALYA":{"id":"8"},"IZLANDA":{"id":"122"},"JAMAIKA":{"id":"119"},"JAPONYA":{"id":"116"},"KAMBOCYA":{"id":"161"},"KAMERUN":{"id":"184"},"KANADA":{"id":"52"},"KARADAG":{"id":"34"},"KATAR":{"id":"94"},"KAZAKISTAN":{"id":"92"},"KENYA":{"id":"114"},"KIRGIZISTAN":{"id":"168"},"KOLOMBIYA":{"id":"57"},"KOMORLAR":{"id":"88"},"KOSOVA":{"id":"18"},"KOSTARIKA":{"id":"162"},"KUBA":{"id":"209"},"KUDUS":{"id":"206"},"KUVEYT":{"id":"133"},"KUZEY KIBRIS":{"id":"1"},"KUZEY KORE":{"id":"142"},"LAOS":{"id":"134"},"LESOTO":{"id":"174"},"LETONYA":{"id":"20"},"LIBERYA":{"id":"73"},"LIBYA":{"id":"203"},"LIECHTENSTEIN":{"id":"38"},"LITVANYA":{"id":"47"},"LUBNAN":{"id":"42"},"LUKSEMBURG":{"id":"31"},"MACARISTAN":{"id":"7"},"MADAGASKAR":{"id":"98"},"MAKAO":{"id":"100"},"MAKEDONYA":{"id":"28"},"MALAVI":{"id":"55"},"MALDIVLER":{"id":"103"},"MALEZYA":{"id":"107"},"MALI":{"id":"152"},"MALTA":{"id":"24"},"MARTINIK":{"id":"87"},"MAURITIUS ADASI":{"id":"164"},"MAYOTTE":{"id":"157"},"MEKSIKA":{"id":"53"},"MIKRONEZYA":{"id":"85"},"MISIR":{"id":"189"},"MOGOLISTAN":{"id":"60"},"MOLDAVYA":{"id":"46"},"MONAKO":{"id":"3"},"MONTSERRAT (U.K.)":{"id":"147"},"MORITANYA":{"id":"106"},"MOZAMBIK":{"id":"151"},"NAMIBYA":{"id":"196"},"NEPAL":{"id":"76"},"NIJER":{"id":"84"},"NIJERYA":{"id":"127"},"NIKARAGUA":{"id":"141"},"NIUE":{"id":"178"},"NORVEC":{"id":"36"},"ORTA AFRIKA CUMHURIYETI":{"id":"80"},"OZBEKISTAN":{"id":"131"},"PAKISTAN":{"id":"77"},"PALAU":{"id":"149"},"PANAMA":{"id":"89"},"PAPUA YENI GINE":{"id":"185"},"PARAGUAY":{"id":"194"},"PERU":{"id":"69"},"PITCAIRN ADASI":{"id":"183"},"POLONYA":{"id":"39"},"PORTEKIZ":{"id":"45"},"PORTO RIKO":{"id":"68"},"REUNION":{"id":"112"},"ROMANYA":{"id":"37"},"RUANDA":{"id":"81"},"RUSYA":{"id":"207"},"S. ARABISTAN":{"id":"64"},"SAMOA":{"id":"198"},"SENEGAL":{"id":"102"},"SEYSEL ADALARI":{"id":"138"},"SIERRA LEONE":{"id":"210"},"SILI":{"id":"200"},"SINGAPUR":{"id":"179"},"SIRBISTAN":{"id":"27"},"SLOVAKYA":{"id":"14"},"SLOVENYA":{"id":"19"},"SOMALI":{"id":"150"},"SRI LANKA":{"id":"74"},"SUDAN":{"id":"129"},"SURINAM":{"id":"172"},"SURIYE":{"id":"191"},"SVALBARD":{"id":"163"},"SVAZILAND":{"id":"170"},"TACIKISTAN":{"id":"101"},"TANZANYA":{"id":"110"},"TAYLAND":{"id":"137"},"TAYVAN":{"id":"108"},"TOGO":{"id":"71"},"TONGA":{"id":"130"},"TRINIDAT VE TOBAGO":{"id":"96"},"TUNUS":{"id":"118"},"TÜRKİYE":{"id":"2"},"TURKMENISTAN":{"id":"159"},"UGANDA":{"id":"75"},"UKRAYNA":{"id":"40"},"UKRAYNA-KIRIM":{"id":"29"},"UMMAN":{"id":"173"},"URDUN":{"id":"192"},"URUGUAY":{"id":"201"},"VANUATU":{"id":"56"},"VATIKAN":{"id":"10"},"VENEZUELA":{"id":"186"},"VIETNAM":{"id":"135"},"YEMEN":{"id":"148"},"YENI KALEDONYA":{"id":"115"},"YENI ZELLANDA":{"id":"193"},"YESIL BURUN":{"id":"144"},"YUNANISTAN":{"id":"22"},"ZAMBIYA":{"id":"158"},"ZIMBABVE":{"id":"136"}}
    property var cities: {"ADANA":{"id":"500"},"ADIYAMAN":{"id":"501"},"AFYONKARAHİSAR":{"id":"502"},"AĞRI":{"id":"503"},"AKSARAY":{"id":"504"},"AMASYA":{"id":"505"},"ANKARA":{"id":"506"},"ANTALYA":{"id":"507"},"ARDAHAN":{"id":"508"},"ARTVİN":{"id":"509"},"AYDIN":{"id":"510"},"BALIKESİR":{"id":"511"},"BARTIN":{"id":"512"},"BATMAN":{"id":"513"},"BAYBURT":{"id":"514"},"BİLECİK":{"id":"515"},"BİNGÖL":{"id":"516"},"BİTLİS":{"id":"517"},"BOLU":{"id":"518"},"BURDUR":{"id":"519"},"BURSA":{"id":"520"},"ÇANAKKALE":{"id":"521"},"ÇANKIRI":{"id":"522"},"ÇORUM":{"id":"523"},"DENİZLİ":{"id":"524"},"DİYARBAKIR":{"id":"525"},"DÜZCE":{"id":"526"},"EDİRNE":{"id":"527"},"ELAZIĞ":{"id":"528"},"ERZİNCAN":{"id":"529"},"ERZURUM":{"id":"530"},"ESKİŞEHİR":{"id":"531"},"GAZİANTEP":{"id":"532"},"GİRESUN":{"id":"533"},"GÜMÜŞHANE":{"id":"534"},"HAKKARİ":{"id":"535"},"HATAY":{"id":"536"},"IĞDIR":{"id":"537"},"ISPARTA":{"id":"538"},"İSTANBUL":{"id":"539"},"İZMİR":{"id":"540"},"KAHRAMANMARAŞ":{"id":"541"},"KARABÜK":{"id":"542"},"KARAMAN":{"id":"543"},"KARS":{"id":"544"},"KASTAMONU":{"id":"545"},"KAYSERİ":{"id":"546"},"KİLİS":{"id":"547"},"KIRIKKALE":{"id":"548"},"KIRKLARELİ":{"id":"549"},"KIRŞEHİR":{"id":"550"},"KOCAELİ":{"id":"551"},"KONYA":{"id":"552"},"KÜTAHYA":{"id":"553"},"MALATYA":{"id":"554"},"MANİSA":{"id":"555"},"MARDİN":{"id":"556"},"MERSİN":{"id":"557"},"MUĞLA":{"id":"558"},"MUŞ":{"id":"559"},"NEVŞEHİR":{"id":"560"},"NİĞDE":{"id":"561"},"ORDU":{"id":"562"},"OSMANİYE":{"id":"563"},"RİZE":{"id":"564"},"SAKARYA":{"id":"565"},"SAMSUN":{"id":"566"},"ŞANLIURFA":{"id":"567"},"SİİRT":{"id":"568"},"SİNOP":{"id":"569"},"ŞIRNAK":{"id":"570"},"SİVAS":{"id":"571"},"TEKİRDAĞ":{"id":"572"},"TOKAT":{"id":"573"},"TRABZON":{"id":"574"},"TUNCELİ":{"id":"575"},"UŞAK":{"id":"576"},"VAN":{"id":"577"},"YALOVA":{"id":"578"},"YOZGAT":{"id":"579"},"ZONGULDAK":{"id":"580"}}
    property var districts: {"ARNAVUTKOY":{"id":"9535"},"AVCILAR":{"id":"17865"},"BAŞAKŞEHİR":{"id":"17866"},"BEYLİKDÜZÜ":{"id":"9536"},"BÜYÜKÇEKMECE":{"id":"9537"},"ÇATALCA":{"id":"9538"},"ÇEKMEKÖY":{"id":"9539"},"ESENYURT":{"id":"9540"},"İSTANBUL":{"id":"9541"},"KARTAL":{"id":"9542"},"KÜÇÜKÇEKMECE":{"id":"9543"},"MALTEPE":{"id":"9544"},"PENDİK":{"id":"9545"},"SANCAKTEPE":{"id":"9546"},"ŞİLE":{"id":"9547"},"SİLİVRİ":{"id":"9548"},"SULTANBEYLİ":{"id":"9549"},"SULTANGAZİ":{"id":"9550"},"TUZLA":{"id":"9551"}}

    property point clickPos: "1,1" // for dragable window

    property date currentDate: new Date()
    property date tomorrowDate: new Date(currentDate.getTime() + (1000 * 60 * 60 * 24))
    property int warnMin: settingsForm.sb_warnMin.value
    property bool warned: false

    function httpGet(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) {
            return function() {
                callback(myxhr);
            }
        })(xhr);
        xhr.open('GET', url, true);
        xhr.send('');
    }


    Component.onCompleted: {
        readSettings(); // Read from settings.json

        var timeDiff = Math.abs(new Date().getTime() - lastUpdateDate.getTime());
        lastUpdateDayDiff = Math.floor(timeDiff / (1000 * 3600 * 24));
        if (lastUpdateDayDiff >= 25) {
            // Update prayer times if necessary from diyanet.gov.tr
            mainForm.rct_updateNeed.visible = true
            updatePrayerTimes(function(){
                saveSettings()
                applySettings()
                secondTicker.start()
                refreshVakits()
            })
        }
        else {
            applySettings(); // Apply settings read from settings.json
            secondTicker.start()
            refreshVakits()
        }
    }

    Timer{
        id: secondTicker
        interval: 1000
        running: false
        repeat: true

        onTriggered: {
            refreshVakits();
        }
    }

    function refreshVakits() {
        currentDate = new Date()
        tomorrowDate = new Date(currentDate.getTime() + (1000 * 60 * 60 * 24))

        var timeDiff = Math.abs(new Date().getTime() - lastUpdateDate.getTime());
        lastUpdateDayDiff = Math.floor(timeDiff / (1000 * 3600 * 24));

        var todayTimes = selectedDistrictTimes[lastUpdateDayDiff]
        var tomorrowTimes = selectedDistrictTimes[lastUpdateDayDiff+1]

        mainForm.times = [
                    todayTimes["Imsak"],
                    todayTimes["Gunes"],
                    todayTimes["Ogle"],
                    todayTimes["Ikindi"],
                    todayTimes["Aksam"],
                    todayTimes["Yatsi"],
                    tomorrowTimes["Imsak"]
                ]

        mainForm.txt_miladiTakvim.text = todayTimes["MiladiTarihUzun"].substr(0, todayTimes["MiladiTarihUzun"].lastIndexOf(" "))
        mainForm.txt_hicriTakvim.text = todayTimes["HicriTarihUzun"]

        tickTime()

    }

    function tickTime() {
        var i = 0
        for(i=0; i<mainForm.times.length; i++){
            var vakithours = parseInt(mainForm.times[i].split(":")[0])
            var vakitminutes = parseInt(mainForm.times[i].split(":")[1])

            if( (vakithours*60)+vakitminutes > (currentDate.getHours()*60)+currentDate.getMinutes() )
                break;
        }

        var vakitSeconds = 0
        if(i === 7) {
            i = 6
            vakitSeconds = parseInt(mainForm.times[i].split(":")[0]) * 60 * 60 + parseInt(mainForm.times[i].split(":")[1]) * 60 + 60
            vakitSeconds += 24 * 60 * 60
        } else {
            vakitSeconds = parseInt(mainForm.times[i].split(":")[0]) * 60 * 60 + parseInt(mainForm.times[i].split(":")[1]) * 60 + 60
        }

        var nowSeconds = currentDate.getHours() * 60 * 60 + currentDate.getMinutes() * 60 + currentDate.getSeconds()

        var remainingHours = Math.floor((vakitSeconds - nowSeconds)/60/60) % 24
        var remainingMinutes = Math.floor((vakitSeconds - nowSeconds)/60) % 60
        var remainingSeconds = (vakitSeconds - nowSeconds) % 60

        mainForm.txt_kalan.text = (remainingHours < 10 ? "0" : "") + remainingHours + ":"
                + (remainingMinutes < 10 ? "0" : "") + remainingMinutes + ":"
                + (remainingSeconds < 10 ? "0" : "") + remainingSeconds
        mainForm.txt_kalanIsim.text = getVakitName(i)

        // Colorize current vakit
        for(var k=0; k < mainForm.timesTxts.length; k++) {
            mainForm.timesTxts[k].color = "#ffffff"
            mainForm.timesLbls[k].color = "#ffffff"
        }
        mainForm.timesTxts[i%6].color = "#00ff00"
        mainForm.timesLbls[i%6].color = "#00ff00"

        if (mainForm.txt_kalan.text.split(':')[0] === "00"
                && mainForm.txt_kalan.text.split(':')[1] === "15"
                && !warned) {
            settingsForm.visible = false
            mainForm.visible = true
            playSound.play()
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
            return qsTr("to Fajr")
        } else if (i === 1){
            return qsTr("to Sunrise")
        } else if (i === 2){
            return qsTr("to Dhuhr")
        } else if (i === 3){
            return qsTr("to Asr")
        } else if (i === 4){
            return qsTr("to Maghrib")
        } else if (i === 5){
            return qsTr("to Isha")
        }
    }

    File {
        id: file
    }

    function readSettings() {
        var data = file.readFile(settingsPath, 'config')
        if (data.length > 0 && data.substring(0,3) !== "ERR") {
            var jsonedSettings = JSON.parse(data)

            if (!jsonedSettings.lastUpdateDate) {
                saveSettings()
                readSettings()
                return
            }

            // If country is available. Then send get request.
            selectedCountry = jsonedSettings.country.toLocaleUpperCase('TR')
            selectedCity = jsonedSettings.city.toLocaleUpperCase('TR')
            selectedDistrict = jsonedSettings.district.toLocaleUpperCase('TR')

            countries = jsonedSettings.countries
            cities = jsonedSettings.cities
            districts = jsonedSettings.districts

            root.x = jsonedSettings.x
            root.y = jsonedSettings.y

            settingsForm.sli_saydamlik.value = jsonedSettings.backgroundOpacity
            updateOpacity()

            settingsForm.sb_warnMin.value = warnMin = jsonedSettings.warnMin

            lastUpdateDate = new Date(jsonedSettings.lastUpdateDate)

            selectedDistrictTimes = jsonedSettings.selectedDistrictTimes
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
            backgroundOpacity: settingsForm.sli_saydamlik.value,
            countries: countries,
            cities: cities,
            districts: districts,
            selectedDistrictTimes: selectedDistrictTimes,
            lastUpdateDate: lastUpdateDate
        }

        file.saveFile(settingsPath, JSON.stringify(obj), 'config')
    }

    function applySettings() {
        settingsForm.cmb_countries.model = Object.keys(countries)
        settingsForm.cmb_countries.currentIndex = settingsForm.cmb_countries.model.indexOf(selectedCountry)

        settingsForm.cmb_cities.model = Object.keys(cities)
        settingsForm.cmb_cities.currentIndex = settingsForm.cmb_cities.model.indexOf(selectedCity)

        settingsForm.cmb_districts.model = Object.keys(districts)
        settingsForm.cmb_districts.currentIndex = settingsForm.cmb_districts.model.indexOf(selectedDistrict)

        mainForm.txt_sehir.text = selectedDistrict
        mainForm.txt_ulke.text = selectedCountry
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
        function onClicked(event) {
            settingsForm.visible = true
            mainForm.visible = false
        }
    }

    Connections {
        target: settingsForm.ma_back
        function onClicked(event) {
            settingsForm.visible = false
            mainForm.visible = true

            saveSettings()
        }
    }

    MainForm {
        id: mainForm
        radius: 15
        anchors.fill: parent
        visible: true
    }

    Settings {
        id: settingsForm
        radius: 15
        anchors.fill: parent
        visible: false
    }

    Connections {
        target: settingsForm.cmb_countries
        function onActivated() {
            selectedCountry = settingsForm.cmb_countries.currentText
            var selectedCountryID = countries[selectedCountry]["id"]

            httpGet("https://namazvakitleri.diyanet.gov.tr/tr-TR/home/GetRegList?ChangeType=country&Culture=tr-TR&CountryId=" + selectedCountryID, function(xhr) {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var cityList = JSON.parse(xhr.responseText)["StateList"]
                    var cityListNew = {};

                    for(var i in cityList)
                    {
                        cityListNew[cityList[i]["SehirAdi"]] = {"id":cityList[i]["SehirID"]}
                    }

                    cities = cityListNew
                    selectedCity = Object.keys(cities)[0]

                    settingsForm.cmb_cities.model = Object.keys(cities)

                    districts = {}
                    selectedDistrict = ""
                    settingsForm.cmb_districts.model = Object.keys(districts)
                }
            })
        }
    }

    Connections {
        target: settingsForm.cmb_cities
        function onActivated() {
            selectedCity = settingsForm.cmb_cities.currentText
            var selectedCityID = cities[selectedCity]["id"]

            httpGet("https://namazvakitleri.diyanet.gov.tr/tr-TR/home/GetRegList?ChangeType=state&Culture=tr-TR&StateId=" + selectedCityID, function(xhr) {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var districtList = JSON.parse(xhr.responseText)["StateRegionList"]
                    var districtListNew = {};

                    for(var i in districtList)
                    {
                        districtListNew[districtList[i]["IlceAdi"]] = {"id":districtList[i]["IlceID"]}
                    }

                    districts = districtListNew
                    selectedDistrict = Object.keys(districts)[0]
                    settingsForm.cmb_districts.model = Object.keys(districts)
                }
            })
        }
    }


    Connections {
        target: settingsForm.cmb_districts
        function onActivated() {
            selectedDistrict = settingsForm.cmb_districts.currentText
        }
    }

    Connections {
        target: settingsForm.sli_saydamlik
        function onMoved() {
            updateOpacity()
        }
    }

    function updateOpacity() {
        var colorCode = settingsForm.sli_saydamlik.value.toString(16);
        if (colorCode.length === 1) colorCode = "0" + colorCode;
        mainForm.background.color = settingsForm.background.color = "#" + colorCode + "090909"
    }

    function updatePrayerTimes(callback) {
        var selectedDistrictID = districts[selectedDistrict]["id"]
        console.log('ilce:' + selectedDistrictID)
        httpGet("https://ezanvakti.herokuapp.com/vakitler?ilce=" + selectedDistrictID, function(xhr) {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    mainForm.rct_updateNeed.visible = false
                    selectedDistrictTimes = JSON.parse("{ \"days\":" + xhr.responseText + "}").days
                    lastUpdateDate = new Date()

                    var timeDiff = Math.abs(new Date().getTime() - lastUpdateDate.getTime());
                    lastUpdateDayDiff = Math.floor(timeDiff / (1000 * 3600 * 24));

                    refreshVakits()
                    callback()
                } else {
                    mainForm.rct_updateNeed.visible = true
                    mainForm.txt_failed.visible = true
                }
            }
        })
    }

    Connections {
        target: settingsForm.btn_save
        function onClicked(event) {
            saveSettings()
            updatePrayerTimes(function(){
                saveSettings()
                applySettings()
                secondTicker.start()
                refreshVakits()
            })
        }
    }

    Connections {
        target: mainForm.btn_updateTimes
        function onClicked(event) {
            mainForm.txt_failed.visible = false
            updatePrayerTimes(function(){
                saveSettings()
                applySettings()
                secondTicker.start()
                refreshVakits()
                mainForm.txt_failed.visible = false
                mainForm.rct_updateNeed.visible = false
            })
        }
    }

    SoundEffect {
        id: playSound
        source: "qrc:/sound/warn.wav"
    }

}


