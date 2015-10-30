// jscs:disable

$(document).ready(function() {
	// Initialize google map
	var map = new GMaps( {
		el: '#gmap',
		lat: 42.9047,
		lng: -78.8494,
		zoom: 8
	} );

	map.addMarker( {
		lat: 42.9047,
		lng: -78.8494,
		title: 'Lima',
		infoWindow: {
			content: '<p>HTML Content</p>'
		}
	} );

	// Get user location
	GMaps.geolocate( {
		success: function( position ) {
			map.setCenter( position.coords.latitude, position.coords.longitude );
		},
		error: function( error ) {

			// Handle the error
		},
		not_supported: function() {

			// Geoip not supported
		},
		always: function() {

			// Always do something
		}
	} );
});