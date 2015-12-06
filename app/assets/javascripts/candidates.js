$(document).ready(function() {
	if( $(window).width() > 999 ) {
		headerHeight = $('header').height();
		windowHeight = $(window).height();
		$('#coverphoto').height(windowHeight - headerHeight);
		$('#coverphoto .overlay').height(windowHeight - headerHeight);
	}
});