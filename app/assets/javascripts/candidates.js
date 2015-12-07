// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
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

} );