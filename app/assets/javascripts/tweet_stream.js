/**
 * Whether the stream is paused or not
 *
 * @type {Boolean}
 */
paused = false;

/**
 * Generate tweet HTML markup
 *
 * @param  {json} tweet JSON array containing tweet information
 * @return {Jquery} DOM object with tweet information
 */
function htmlify( tweet ) {
	tweetHtml = $( '.tweet-template' ).clone();
	tweetHtml.find( '.text' ).append( $.parseHTML( tweet.text_html ) );
	tweetHtml.find( '.handle a' ).text( tweet.user.name ).attr( 'href', 'https://twitter.com/' + tweet.user.screen_name );
	tweetHtml.find( '.handle span' ).text( '@' + tweet.user.screen_name );
	tweetHtml.find( '.profile-picture img' ).attr( 'src', tweet.user.profile_image_url_https.replace( '_normal', '' ) );

	var time = new Date( parseInt( tweet.timestamp_ms ) ).toISOString();
	tweetHtml.find( '.timestamp span' ).attr( 'title', time );

	return tweetHtml;
}

/**
 * Insert tweet into page
 *
 * @param  {JQuery} tweet DOM object with tweet information
 * @return none
 */
function insert( tweet ) {

	tweetHtml.prependTo( '#tweets' ).fadeIn( 2000 ).removeClass( 'tweet-template' );
	init( tweetHtml );
}

/**
 * Initialize a tweet
 *
 * @param  {JQuery} tweet DOM object with tweet information
 * @return none
 */
function init( tweet ) {
	tweet.find( '.timestamp span' ).timeago();
}

/**
 * Destroy a tweet
 *
 * @param  {JQuery} tweet DOM object with tweet information
 * @return none
 */
function destroy( tweet ) {
	tweet.find( '.timestamp' ).timeago( 'dispose' );
}

/**
 * Process an incoming tweet from the web socket
 *
 * @return none
 */
function processTweet( tweet ) {
	if ( !paused ) {
		tweet = $.parseJSON( tweet );
		console.log( tweet );

		if ( tweet.geo ) {
			tweet = htmlify( tweet );
			insert( tweet );
			tweet = null;
		}
	}
}

/**
 * Start/stop tweet stream
 *
 * @return none
 */
function toggleStream() {
	if ( paused ) {
		paused = false;
	} else {
		paused = true;
	}
}

// Initialize web socket
var dispatcher = new WebSocketRails( 'wss://ws.ubvoting.com/websocket' );
var channel = dispatcher.subscribe( 'tweets' );
channel.bind( 'new_tweet', function( data ) {
	processTweet( data );
} );

// DOM ready
$( document ).ready( function() {

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

			// handle the error
		},
		not_supported: function() {

			// geoip not supported
		},
		always: function() {

			// always do something
		}
	} );

	// Stream control buttons (pause, play)
	$( '#pause' ).on( 'click', function() {

		// Enable/disable stream
		toggleStream();

		// Update button text and icon
		var text = $( this ).find( 'span' ).text();
		$( this ).find( 'span' ).text( text == 'Pause' ? 'Play' : 'Pause' );
		$( this ).find( 'i' ).toggleClass( 'fa-pause fa-play' );
		$( this ).blur();
	} );
} );
