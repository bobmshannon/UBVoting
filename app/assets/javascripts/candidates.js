// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
	hide(document.querySelectorAll('h3'));
	
    function hide(description) {
      description = description.length ? description : [description];
      for (var i = 0; i < description.length; i++) {
        description[i].style.display = 'none';
      }
    };

    function show(description){
    	description = description.length ? description: [description];
    	for (var i = 0; i < description.length; i++){
    		description[i].style.display = 'block';
    	}
    };

    $('i').hover(function(){
    	show(document.querySelectorAll('h3'));
    });

} );