/* Global JS goes in here */

$( document ).ready( function() {

	// Initialize slideout.js mobile style menu
	var slideout = new Slideout( {
		'panel': document.getElementById( 'main' ),
		'menu': document.getElementById( 'mobile-menu' ),
		'padding': 275,
		'tolerance': 70,
		'side': 'right',
		'touch': false
	} );

	slideout.on( 'beforeopen', function() {
		$( 'header' ).toggleClass( 'transition-fx' );
	} );

	slideout.on( 'beforeclose', function() {
		$( 'header' ).toggleClass( 'transition-fx' );
	} );

	$( '#mobile-menu-toggle' ).on( 'click', function() {
		slideout.toggle();
		$( this ).children( 'i' ).toggleClass( 'fa-bars fa-times' );
		return false;
	} );

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
