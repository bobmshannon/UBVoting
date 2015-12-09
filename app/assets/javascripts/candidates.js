// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
	$(window).on('load resize', function() {
		if( $(window).width() > 999 ) {
			headerHeight = $('header').height();
			windowHeight = $(window).height();
			$('#coverphoto').height(windowHeight - headerHeight);
			$('#coverphoto .overlay').height(windowHeight - headerHeight);
		}
	});

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