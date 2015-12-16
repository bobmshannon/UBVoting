// jscs:disable

/**
 * Maximum number of tweets to be displayed in list view
 * @const
 */
MAX_NUM_TWEETS = 10;

/**
 * Maximum number of tweets to display per unit of time as
 * defined below
 * @const
 * @examples
 *    5000ms ---> 1 tweet every 5 seconds
 *    3000ms ---> 1 tweet every 3 seconds
 *    1000ms ---> 1 tweet every second
 */
THROTTLE_RATE = 4000;

/**
 * Whether the stream is paused or not
 *
 * @type {Boolean}
 */
paused = false;

/**
 * Whether stream is currently throttled or not
 */
throttled = false;

/**
 * Generate tweet HTML markup
 *
 * @param  {json} tweet JSON array containing tweet information
 * @return {Jquery} DOM object with tweet information
 */
function htmlify( tweet ) {
	tweetHtml = $( '.tweet-template' ).clone();
	tweetHtml.find( '.text' ).append( $.parseHTML( tweet.text_html ) );
	tweetHtml.find( '.text a').each(function() {
		$(this).attr('target', '_blank');
	});
	tweetHtml.find( '.handle a' ).text( tweet.user.name ).attr( 'href', 'https://twitter.com/' + tweet.user.screen_name );
	tweetHtml.find( 'a.profile-picture' ).attr( 'href', 'https://twitter.com/' + tweet.user.screen_name );
	tweetHtml.find( '.handle span' ).text( '@' + tweet.user.screen_name );
	tweetHtml.find( '.profile-picture img' ).attr( 'src', tweet.user.profile_image_url_https.replace( '_normal', '' ) );
	var time = new Date( parseInt( tweet.timestamp_ms ) ).toISOString();
	tweetHtml.find( '.timestamp span' ).attr( 'data-livestamp', time );

	tweetHtml.find( '.reply a').attr('href', tweetUrl('reply', tweet.id_str));
	tweetHtml.find( '.retweet a' ).attr('href', tweetUrl('retweet', tweet.id_str));
	tweetHtml.find( '.favorite a').attr('href', tweetUrl('favorite', tweet.id_str));

	tweetHtml.find( '.tweet-location span').text(tweet.place.full_name);

	return tweetHtml;
}

/**
 * Return a URL to initiate a specified action on a specified tweet
 * 
 * @param  {String} type The type of tweet action (favorite, retweet, or reply)
 * @return {String}      The twitter.com URL corresponding to the specified action and tweet ID
 */
function tweetUrl(type, id) {
    switch (type) {
        case 'reply':
            url = 'https://twitter.com/intent/tweet?in_reply_to=';
            break;
        case 'retweet':
            url = 'https://twitter.com/intent/retweet?tweet_id=';
            break;
        case 'favorite':
            url = 'https://twitter.com/intent/favorite?tweet_id=';
            break;
        default:
            url = 'https://twitter.com/statuses/';
            break;
    }

    return url + id;
}

/**
 * Insert tweet into page
 *
 * @param  {JQuery} tweet DOM object with tweet information
 * @return none
 */
function insert(tweet) {
    if ($('#tweets').children().length > MAX_NUM_TWEETS) {
        tweet = $('#tweets').children().last().prev();
        destroy(tweet);
    }
    tweetHtml.prependTo('#tweets').fadeIn(2000).removeClass('tweet-template');
    init(tweetHtml);
    return;
}

/**
 * Initialize a tweet
 *
 * @param  {JQuery} tweet DOM object with tweet information
 * @return none
 */
function init( tweet ) {
	// Initialize stuff in here
	return;
}

/**
 * Destroy a tweet
 *
 * @param  {JQuery} tweet DOM object with tweet information
 * @return none
 */
function destroy( tweet ) {
	tweet.find( '.timestamp' ).livestamp( 'destroy' );
	tweet.remove();
}

function alert_user( state ) {
	switch ( state ) {
		case 'waiting':
			$('#tweet-alert').removeClass('alert-success alert-warning').addClass('alert-info');
			$('#tweet-alert p').removeClass('show');
			$('#tweet-alert p#waiting').toggleClass('show');
			break;
		case 'new_tweet':
			$('#tweet-alert').removeClass('alert-info alert-warning').addClass('alert-success');
			$('#tweet-alert p').removeClass('show');
			$('#tweet-alert p#new-tweet').toggleClass('show');
            setTimeout(function() {
            	if ( !paused ) {
                	alert_user('waiting');
            	}
            }, 2500);
			break;
		case 'paused':
			$('#tweet-alert').removeClass('alert-success alert-info').addClass('alert-warning');
			$('#tweet-alert p').removeClass('show');
			$('#tweet-alert p#paused').toggleClass('show');
			break;
		default:
			alert_user('waiting');
			break;
	}
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
		console.log( tweet );
		tweet = htmlify( tweet );
		insert( tweet );
		tweet = null;

		throttled = true;
		setTimeout(function(){ throttled = false; }, THROTTLE_RATE);
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
		alert_user('waiting');
	} else {
		paused = true;
		alert_user('paused');
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
