// jscs:disable
/**
 * @fileOverview Manages the google map with info boxes showing each tweet.
 */

/**
 * ID selector of the map container.
 */
MAP_ID = '#gmap';

/**
 * The default centermost latitude of the initial map state.
 * 
 * @constant
 * @default
 */
DEFAULT_LAT = 42.9047;

/**
 * The default centermost longitude of the initial map state.
 * 
 * @constant
 * @default
 */
DEFAULT_LNG = -78.8494;

/**
 * The default zoom level of the initial map state.
 *
 * @constant
 * @default
 */
DEFAULT_ZOOM = 8

/**
 * Map object
 */
var map;


/**
 * Add a marker to the google map
 * @param {Marker} marker Marker object
 */
function addMarker(marker) {
	map.addMarker( {
		lat: 42.9047,
		lng: -78.8494,
		title: 'Lima',
		infoWindow: {
			content: '<p>HTML Content</p>'
		}
	} );
}

/**
 * Make a google map marker object
 * 
 * @param  {JSON} data JSON array containing marker data
 * @return {Marker} Marker object
 */
function makeMarker(data) {
	marker = {
		lat: 42.9047,
		lng: -78.8494,
		title: 'Lima',
		infoWindow: {
			content: '<p>HTML Content</p>'
		}		
	}

	return marker;
}

/**
 * Ask user for their current location, and if successful pan the 
 * google map accordingly.
 */
function getLocation() {
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
}

$(document).ready(function() {
	// Initialize google map
	map = new GMaps( {
		el: MAP_ID,
		lat: DEFAULT_LAT,
		lng: DEFAULT_LNG,
		zoom: DEFAULT_ZOOM
	} );
});