/* Homepage specific JS goes here */
$( document ).ready( function() {
	var ctx = $( 'canvas#turnout-by-age' ).get( 0 ).getContext( '2d' );

	var data = {
		labels: [ '1964', '1968', '1972', '1976', '1980', '1984', '1988',
				'1992', '1996', '2000', '2004', '2008', '2012'],
		datasets: [
	        {
				label: '18-24 Years Old',
				fillColor: 'rgba(220,220,220,0.2)',
				strokeColor: '#ff0000',
				pointColor: '#1e1ac5',
				pointStrokeColor: '#fff',
				pointHighlightFill: '#fff',
				pointHighlightStroke: 'rgba(220,220,220,1)',
				data: [ 50.88, 50.35, 48.71, 41.92, 40.00, 40.74, 36.56, 41.48,
				      32.39, 33.24, 42.19, 43.73, 38.15 ]
	        },
	        {
				label: 'My Second dataset',
				fillColor: 'rgba(151,187,205,0.2)',
				strokeColor: 'rgba(151,187,205,1)',
				pointColor: 'rgba(151,187,205,1)',
				pointStrokeColor: '#fff',
				pointHighlightFill: '#fff',
				pointHighlightStroke: 'rgba(151,187,205,1)',
				data: [ 28, 48, 40, 19, 86, 27, 90 ]
	        }
	    ]
	};

	var options = {

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
		bezierCurve: true,

		//Number - Tension of the bezier curve between points
		bezierCurveTension: 0.4,

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
		datasetFill: true
	};

	var myLineChart = new Chart( ctx ).Line( data, options );
} );
