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
DEFAULT_LAT = 39.8282;

/**
 * The default centermost longitude of the initial map state.
 * 
 * @constant
 * @default
 */
DEFAULT_LNG = -98.5795;

/**
 * The default zoom level of the initial map state.
 *
 * @constant
 * @default
 */
DEFAULT_ZOOM = 4

/**
 * Map object
 */
var map;

/**
 * Add a marker to the google map
 * @param {Marker} marker Marker object
 */
function addMarker(marker) {
	map.addMarker( marker );
}

/**
 * Make a google map marker object
 * @param  {Integer} lat    The latitude of the marker
 * @param  {Integer} lng    The longitude of the marker    
 * @param  {String} content HTML string to be put inside content box 
 * @return {Marker}         marker object
 */
function makeMarker(lat, lng, title, content) {
	marker = {
		lat: lat,
		lng: lng,
		title: title,
		infoWindow: {
			content: '<div>' + content + '</div>'
		}		
	} 

	return marker;
}

/**
 * Open the info window associated with a specified marker
 * 
 * @param  {Integer} index The index associated with the marker in the markers array
 * @return none
 */
function openMarker(index) {
	if (map.markers.length > 0 && index >= 0 && index < map.markers.length) {
		map.markers[index].infoWindow.open(map.map, map.markers[index]);
	}
}

/**
 * Open the info window associated with a specified marker
 * 
 * @param  {Integer} index The index associated with the marker in the markers array
 * @return none
 */
function closeMarker(index) {
	if (map.markers.length > 0 && index >= 0 && index < map.markers.length) {
		map.markers[index].infoWindow.close();
	}
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

/**
 * Process an incoming tweet from the web socket
 *
 * @return none
 */
function processTweet( tweet ) {
	tweet = $.parseJSON( tweet );

	marker = makeMarker( tweet.coordinates[0], tweet.coordinates[1], 'tweet title', tweet.text_html );

	addMarker( marker );

	openMarker(map.markers.length-1);

	console.log( tweet );
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