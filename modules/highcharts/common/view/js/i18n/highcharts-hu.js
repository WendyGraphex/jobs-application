Highcharts.setOptions({
    lang: {
        loading: 'Betöltés...',
        months: ['január', 'február', 'március', 'április', 'május','június',
            'július', 'augusztus', 'szeptember', 'október', 'november', 'december'],
        shortMonths:  ['jan', 'febr', 'márc', 'ápr', 'máj', 'jún', 'júl', 'aug', 'szept', 'okt', 'nov', 'dec'],
        weekdays: ['vasámap', 'hétfő', 'kedd', 'szerda', 'csütörtök', 'péntek', 'szombat'],                     
        exportButtonTitle: "Exportál",
        printButtonTitle: "Importál",
        rangeSelectorFrom: "ettől",
        rangeSelectorTo: "eddig",
        rangeSelectorZoom: "mutat:",
        downloadPNG: 'Letöltés PNG képként',
        downloadJPEG: 'Letöltés JPEG képként',
        downloadPDF: 'Letöltés PDF dokumentumként',
        downloadSVG: 'Letöltés SVG formátumban',
        resetZoom: "Visszaállít",
        resetZoomTitle: "Visszaállít",
        thousandsSep: "",
        decimalPoint: ','
    },
    rangeSelector: {
          buttons: [
            { count: 1, type: 'month', text: '1 hó'}, 
            { count: 3, type: 'month', text: '3 hó'},
            { count: 6, type: 'month', text: '6 hó'},
            { count: 1, type: 'year' , text: '1 év'},
            { type: 'all', text: 'mind'}
        ],
        inputEnabled: false,
        selected: 0
    }
});