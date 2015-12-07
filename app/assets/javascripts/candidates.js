// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
	hide(document.querySelectorAll('h3'));

    function hide(description) {
      description = description.length ? description : [description];
      for (var i = 0; i < description.length; i++) {
        description[i].style.visibility = 'hidden';
      }
    };

    function show(description){
    	description = description.length ? description: [description];
    	for (var i = 0; i < description.length; i++){
    		description[i].style.visibility = 'visible';
    	}
    };

    $('i').hover(function(){
    	setTimeout(function(){show(document.querySelectorAll('h3'));}, 900);
    });

} );