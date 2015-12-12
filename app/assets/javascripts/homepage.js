/* Homepage specific JS goes here */
$( document ).ready( function() {
	if ( $( window ).width() > 999 ) {
		headerHeight = $( 'header' ).height();
		windowHeight = $( window ).height();
		$( '#coverphoto' ).height( windowHeight - headerHeight );
		$( '#coverphoto .cover-shade' ).height( windowHeight - headerHeight );
	}

	// Initialize graph showing voting turnout by age
	// jscs:disable
	var ctx = $( 'canvas#turnout-by-age' ).get( 0 ).getContext( '2d' );

	var data = {
		labels: [ '1964', '1968', '1972', '1976', '1980', '1984', '1988',
				'1992', '1996', '2000', '2004', '2008', '2012' ],
		datasets: [
	        {
		label: '65+ Years Old',
		fillColor: 'rgba(83, 138, 242, 0.6)',
		strokeColor: '#538AF2',
		pointColor: '#75a3fa',
		pointStrokeColor: '#538AF2',
		pointHighlightFill: '#fff',
		pointHighlightStroke: '#538AF2',
		data: [ 67.77, 67.66, 68.87, 69.91, 67.12, 66.31, 65.79, 68.23, 63.48, 62.39, 68.86, 65.3, 69.65 ]
	        },
	        {
		label: '45-64 Years Old',
		fillColor: 'rgba(217, 28, 39, 0.6)',
		strokeColor: '#D91C27',
		pointColor: '#db585f',
		pointStrokeColor: '#D91C27',
		pointHighlightFill: '#fff',
		pointHighlightStroke: '#D91C27',
		data: [ 69.77, 64.29, 68.1, 69.75, 64.59, 76.04, 74.78, 65.03, 70.88, 68.81, 66.52, 69.36, 63.51 ]
	        },
	        {
		label: '25-44 Years Old',
		fillColor: 'rgba(20, 40, 64, 0.6)',
		strokeColor: '#142840',
		pointColor: '#1e3a5d',
		pointStrokeColor: '#142840',
		pointHighlightFill: '#fff',
		pointHighlightStroke: '#142840',
		data: [ 58.09, 49.97, 54.32, 57.9, 49.45, 68.88, 66.52, 51.85, 62.48, 58.78, 52.16, 58.72, 49.6 ]
	        },
	        {
		label: '18-24 Years Old',
		fillColor: 'rgba(241, 61, 60, 0.6)',
		strokeColor: '#f13d3c',
		pointColor: '#f06666',
		pointStrokeColor: '#f13d3c',
		pointHighlightFill: '#fff',
		pointHighlightStroke: '#f13d3c',
		data: [ 50.88, 50.35, 48.71, 41.92, 40.00, 40.74, 36.56, 41.48, 32.39, 33.24, 42.19, 43.73, 38.15 ]
	        }
	    ]
	};

	var options = {
		responsive: true,

		multiTooltipTemplate: '<%= datasetLabel %> - <%= value %>%',

		///Boolean - Whether grid lines are shown across the chart
		scaleShowGridLines: true,

		//String - Colour of the grid lines
		scaleGridLineColor: 'rgba(0,0,0,.05)',

		//Number - Width of the grid lines
		scaleGridLineWidth: 1,

		//Boolean - Whether to show horizontal lines (except X axis)
		scaleShowHorizontalLines: true,

		//Boolean - Whether to show vertical lines (except Y axis)
		scaleShowVerticalLines: true,

		//Boolean - Whether the line is curved between points
		bezierCurve: false,

		//Number - Tension of the bezier curve between points
		//bezierCurveTension: 0.4,

		//Boolean - Whether to show a dot for each point
		pointDot: true,

		//Number - Radius of each point dot in pixels
		pointDotRadius: 4,

		//Number - Pixel width of point dot stroke
		pointDotStrokeWidth: 1,

		//Number - amount extra to add to the radius to cater for
		//hit detection outside the drawn point
		pointHitDetectionRadius: 20,

		//Boolean - Whether to show a stroke for datasets
		datasetStroke: true,

		//Number - Pixel width of dataset stroke
		datasetStrokeWidth: 2,

		//Boolean - Whether to fill the dataset with a colour
		datasetFill: true,

		//String - A legend template

		legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].strokeColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>'
	};
	
	// jscs:enable
	var myLineChart = new Chart( ctx ).Line( data, options );
} );
