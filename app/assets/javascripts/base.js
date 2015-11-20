/* Global JS goes in here */

$( document ).ready( function() {

	// Initialize headroom.js effect on header
	$( 'header' ).headroom( {
		offset: 100,
		tolerance: 10,

		onUnpin: function() {

			// Close dropdown menu if open
			$dropdown = $( '.dropdown' );
			if ( $dropdown.hasClass( 'open' ) ) {
				$dropdown.removeClass( 'open' );
				dropdownClosed = true;
			} else {
				dropdownClosed = false;
			}
		},

		onPin: function() {
			if ( dropdownClosed ) {
				$dropdown = $( '.dropdown' );
				$dropdown.addClass( 'open' );
			}
		}
	} );
} );
