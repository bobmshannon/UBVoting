// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready( function() {
	$( window ).on( 'load resize', function() {

		// Set height of specified containers to 100% of viewport
		headerHeight = $( 'header' ).height();
		windowHeight = $( window ).height();
		$( '.auto-height' ).height( windowHeight - headerHeight );

		// Set height of all issues to equal values
		var max = 0;

		$( '.issue-content' ).each( function() {
			height = $( this ).height();
			if ( height > max ) {
				max = height;
			}
		} );

		$( '.issue' ).height( max + 20 );
	} );

	/**
	 * Normalizes positive and negative sentiment
	 * values into a single [x,y] pair where x is
	 * % positive and y is % negative.
	 *
	 * @examples
	 * 	getDataPoint(0, 0) ---> 0% positive, 0% negative ---> [0,0]
	 * 	getDataPoint(5, 5) ---> 50% positive, 50% negative ---> [50,50]
	 * 	getDatapoint(2, 3) ---> 40% positive, 60% negative ---> [40,60]
	 * 	getDataPoint(1, 9) ---> 10% positive, 90% negative ---> [10,90]
	 */
	function getDataPoint( pos, neg ) {
		if ( pos === 0 && neg === 0 ) {
			return [ 0, 0 ];
		}
		return [ 100 * ( ( pos ) / ( pos + neg ) ), 100 * ( ( neg ) / ( pos + neg ) ) ];
	}

	/*
		The graph!
	*/
	var cand =  $( '#get-candidate' ).data( 'url' );
	var states = cand.states;
	var ctx = $( 'canvas#twitter-poll-results' ).get( 0 ).getContext( '2d' );

	var data = {
		    labels: [ states[ 4 ].name, states[ 42 ].name, states[ 8 ].name, states[ 31 ].name,
		    states[ 12 ].name, states[ 37 ].name, states[ 34 ].name, states[ 9 ].name,
		    states[ 32 ].name,states[ 21 ].name ],
		    datasets: [
		        {
			label: 'Positive Sentiment (%)',
			fillColor: 'rgba(136,193,0,0.75)',
			strokeColor: 'rgba(136,193,0,0.85)',
			highlightFill: 'rgba(136,193,0,0.90)',
			highlightStroke: 'rgba(136,193,0,1)',
			data: [
				getDataPoint( states[ 4 ].positiveSentiment, states[ 4 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 42 ].positiveSentiment, states[ 42 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 8 ].positiveSentiment, states[ 8 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 31 ].positiveSentiment, states[ 31 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 12 ].positiveSentiment, states[ 12 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 37 ].positiveSentiment, states[ 37 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 34 ].positiveSentiment, states[ 34 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 9 ].positiveSentiment, states[ 9 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 32 ].positiveSentiment, states[ 32 ].negativeSentiment )[ 0 ],
				getDataPoint( states[ 21 ].positiveSentiment, states[ 21 ].negativeSentiment )[ 0 ]
			]
		        },
		        {

			label: 'Negative Sentiment (%)',
			fillColor: 'rgba(255,0,60,0.75)',
			strokeColor: 'rgba(255,0,60,0.85)',
			highlightFill: 'rgba(255,0,60,0.90)',
			highlightStroke: 'rgba(255,0,60,1)',
			data: [
				getDataPoint( states[ 4 ].positiveSentiment, states[ 4 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 42 ].positiveSentiment, states[ 42 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 8 ].positiveSentiment, states[ 8 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 31 ].positiveSentiment, states[ 31 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 12 ].positiveSentiment, states[ 12 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 37 ].positiveSentiment, states[ 37 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 34 ].positiveSentiment, states[ 34 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 9 ].positiveSentiment, states[ 9 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 32 ].positiveSentiment, states[ 32 ].negativeSentiment )[ 1 ],
				getDataPoint( states[ 21 ].positiveSentiment, states[ 21 ].negativeSentiment )[ 1 ]
			]
		        }
		    ]
	};

	var options = {
		responsive: true,

		//Boolean - Whether the scale should start at zero,
		//or an order of magnitude down from the lowest value
		scaleBeginAtZero: true,

		//Boolean - Whether grid lines are shown across the chart
		scaleShowGridLines: true,

		//String - Colour of the grid lines
		scaleGridLineColor: 'rgba(0,0,0,.05)',

		//Number - Width of the grid lines
		scaleGridLineWidth: 1,

		//Boolean - Whether to show horizontal lines (except X axis)
		scaleShowHorizontalLines: true,

		//Boolean - Whether to show vertical lines (except Y axis)
		scaleShowVerticalLines: true,

		//Boolean - If there is a stroke on each bar
		barShowStroke: true,

		//Number - Pixel width of the bar stroke
		barStrokeWidth: 2,

		//Number - Spacing between each of the X value sets
		barValueSpacing: 5,

		//Number - Spacing between data sets within X values
		barDatasetSpacing: 3,

		//String - A legend template
		//jscs:disable
		legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].fillColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>'

		//jscs:enable
	};

	var myBarChart = new Chart( ctx ).Bar( data, options );
	document.getElementById( 'legendDiv' ).innerHTML = myBarChart.generateLegend();

	//jscs:disable
	/*$('.issue h2 a').each(function() {
	        $(this).on('click', function() {
	            $(this).parent().parent().children('.issue-content p').toggle();
	            $(this).parent().parent().children('.issue-content h2 i').toggleClass('fa-chevron-circle-up fa-chevron-circle-down');
	            var text = $(this).text();
	            console.log(text);
	            $(this).text(
	                text == "learn more" ? "show less" : "learn more");
	            return false;
	        });
	    });*/

	/*
		hide(document.querySelectorAll('h3'));
		var container = document.querySelectorAll('#hidden');
		createUniqueIDs(container);
	    function hide(description) {
	      for (var i = 0; i < description.length; i++) {
	        description[i].style.visibility = 'hidden';
	      }
	    };
	    function show(description){
	    	for (var i = 0; i < description.length; i++){
	    		description[i].style.visibility = 'visible';
	    	}
	    };
	    $('i').hover(function(){

	    	setTimeout(function(){show(document.querySelectorAll('h3'));}, 900);
	    });
	   function createUniqueIDs(array){
	            for (var i =0; i< array.length; i++){
	            	array[i].setAttribute('id','hiddenchild'+i);
	            }
	        };
	    */

} );

