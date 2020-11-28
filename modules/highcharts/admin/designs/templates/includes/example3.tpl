console.log(Date.UTC(1970,  9, 27));

$(document).ready(function() {
				$('#container').highcharts({
					chart: {
						renderTo: 'container',
						type: 'spline'
					},
					title: {
						text: 'Snow depth in the Vikjafjellet mountain, Norway'
					},
					subtitle: {
						text: 'An example of irregular time data in Highcharts JS'	
					},
					xAxis: {
						type: 'datetime',
						dateTimeLabelFormats: { // don't display the dummy year
							month: '%e. %b',
							year: '%b'
						}
					},
					yAxis: {
						title: {
							text: 'Snow depth (m)'
						},
						min: 0
					},
					tooltip: {
						formatter: function() {
				                return '<b>'+ this.series.name +'</b><br/>'+
								Highcharts.dateFormat('%e. %b', this.x) +': '+ this.y +' m';
						}
					},
					series: [{
						name: 'Winter 2007-2008',
						// Define the data points. All series have a dummy year
						// of 1970/71 in order to be compared on the same x axis. Note
						// that in JavaScript, months start at 0 for January, 1 for February etc.
						data: [
							[Date.UTC(1970,  9, 27), 1   ],                                                        
							
						]
					}, {
						name: 'Winter 2008-2009',
						data: [
							[Date.UTC(1970,  9, 18), 5   ],
							
						]
					}]
				});
				
				
			});
				
		</script>