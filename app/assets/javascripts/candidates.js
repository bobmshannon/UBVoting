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
