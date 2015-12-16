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
DEFAULT_ZOOM = 4;

/**
 * The maximum number of markers allowed on the map.
 *
 * @constant
 * @default
 */
MAX_NUM_MARKERS = 25;

/**
 * Map object
 */
var map;

/**
 * Markers container
 */
var markers = [];

/**
 * Add a marker to the google map
 * @param {Marker} marker Marker object
 */
function addMarker(marker) {
	map.addMarker( marker );

	// Add marker to markers container
	last = map.markers.length - 1;
	markers.push(map.markers[last]);

	if(markers.length > MAX_NUM_MARKERS) {
		// Remove oldest marker from the map and markers container
		markers.shift().setMap(null);
	}
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
			content: content,
			disableAutoPan: false
		}		
	};

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
 * Close all open info windows on the  map
 * 
 * @return none
 */
function closeAllMarkers() {
	for(i = 0; i < map.markers.length; i++) {
		closeMarker(i);
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
	if ( !paused && !throttled ) {
		alert_user('new_tweet');
		
		tweet = $.parseJSON( tweet );

		tweetContent = htmlify(tweet).show().removeClass('tweet-template').addClass('tweet').prop('outerHTML');

		marker = makeMarker( tweet.coordinates[0], tweet.coordinates[1], 'tweet title', tweetContent );

		addMarker( marker );

		closeAllMarkers();

		openMarker( map.markers.length-1 );

		console.log( tweet );

		throttled = true;
		setTimeout(function(){ throttled = false; }, THROTTLE_RATE);
	}
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