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


	/*
		The graph!
	*/
	var cand =  $('#get-candidate').data('url');
	var states = cand.states;
	var rand = (Math.random()*1000)
	var ctx = $('canvas#twitter-poll-results').get( 0 ).getContext( '2d' );

	var data = {
		    labels: [states[4].name, states[42].name, states[8].name, states[31].name, 
		    states[12].name, states[37].name, states[34].name, states[9].name,
		    states[32].name,states[21].name],
		    datasets: [
		        {
		            label: "Positive Sentiment",
					fillColor: "rgba(136,193,0,0.75)",
		            strokeColor: "rgba(136,193,0,0.85)",
		            highlightFill: "rgba(136,193,0,0.90)",
		            highlightStroke: "rgba(136,193,0,1)",
		            data: [states[4].positiveSentiment+rand*Math.random(), states[42].positiveSentiment+rand*Math.random(), 
		            states[8].positiveSentiment+rand*Math.random(), states[31].positiveSentiment+rand*Math.random(), 
		            states[12].positiveSentiment+rand*Math.random(), states[37].positiveSentiment+rand*Math.random(), 
		            states[34].positiveSentiment+rand*Math.random(), states[9].positiveSentiment+rand*Math.random(), 
		            states[32].positiveSentiment+rand*Math.random(), states[21].positiveSentiment+rand*Math.random()]
		        },
		        {

		            label: "Negative Sentiment",
		            fillColor: "rgba(255,0,60,0.75)",
		            strokeColor: "rgba(255,0,60,0.85)",
		            highlightFill: "rgba(255,0,60,0.90)",
		            highlightStroke: "rgba(255,0,60,1)",
		            data: [states[4].negativeSentiment+rand*Math.random(), states[42].negativeSentiment+rand*Math.random(), 
		            states[8].negativeSentiment+rand*Math.random(), states[31].negativeSentiment+rand*Math.random(), 
		            states[12].negativeSentiment+rand*Math.random(), states[37].negativeSentiment+rand*Math.random(), 
		            states[34].negativeSentiment+rand*Math.random(), states[9].negativeSentiment+rand*Math.random(), 
		            states[32].negativeSentiment+rand*Math.random(), states[21].negativeSentiment+rand*Math.random()]
		        }
		    ]
	};

	var options = {
		responsive : true,
	    //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
	    scaleBeginAtZero : true,

	    //Boolean - Whether grid lines are shown across the chart
	    scaleShowGridLines : true,

	    //String - Colour of the grid lines
	    scaleGridLineColor : "rgba(0,0,0,.05)",

	    //Number - Width of the grid lines
	    scaleGridLineWidth : 1,

	    //Boolean - Whether to show horizontal lines (except X axis)
	    scaleShowHorizontalLines: true,

	    //Boolean - Whether to show vertical lines (except Y axis)
	    scaleShowVerticalLines: true,

	    //Boolean - If there is a stroke on each bar
	    barShowStroke : true,

	    //Number - Pixel width of the bar stroke
	    barStrokeWidth : 2,

	    //Number - Spacing between each of the X value sets
	    barValueSpacing : 5,

	    //Number - Spacing between data sets within X values
	    barDatasetSpacing : 3,

	    //String - A legend template
	    legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

	}

	var myBarChart = new Chart(ctx).Bar(data, options);

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

