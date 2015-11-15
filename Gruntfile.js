module.exports = function( grunt ) {
	require( 'time-grunt' )( grunt );

	require( 'load-grunt-tasks' )( grunt, {
		pattern: [ 'grunt-*', '!grunt-log-headers' ]
	} );

	require( 'grunt-log-headers' )( grunt );

	grunt.initConfig( {
		pkg: grunt.file.readJSON( 'package.json' ),
		newer: {
			options: {
				gruntLogHeader: false
			}
		},
		'newer-postrun': {
			options: {
				gruntLogHeader: false
			}
		},
		clean: {
			src: [
			'public/stylesheets/**/*.css',
			'public/javascripts/**/*.js',
			'.sass-cache/',
			'tmp/debug_kit.sqlite'
			]
		},
		scsslint: {
			files: [
			'app/assets/stylesheets/**/*.scss'
			],
			options: {
				bundleExec: true,
				config: '.scss-lint.yml',
				reporterOutput: 'scss-lint-report.xml',
				colorizeOutput: true
			}
		},
		jshint: {
			options: {
				reporter: require( 'jshint-stylish' ),
				globals: {
					jQuery: true,
					console: true
				}
			},
			src: [
			'*.js',
			'app/assets/javascripts/**/*.js'
			]
		},
		jscs: {
			src: [
			'*.js',
			'app/assets/javascripts/**/*.js'
			],
			options: {
				preset: 'jquery',			// Enforce jQuery code style guidelines (see: https://contribute.jquery.org/style-guide/js/)
				fix: true,					// Auto fix code style errors
				validateQuoteMarks: '\'',	// Enforce single quotes instead of double
				validateIndentation: '\t'	// Enforce use of tab for indentation
			}
		},
		uglify: {
			options: {
				banner: '/* <%= grunt.template.today("yyyy-mm-dd") %> */\n',
				sourceMap: false,
				beautify: false,
				mangle: false
			},
			base: {
				files: {
					'public/javascripts/base.js': [
					'bower_components/jquery/dist/jquery.js',
					'bower_components/jquery-ui/jquery-ui.js',
					'bower_components/bootstrap/dist/js/bootstrap.min.js',
					'bower_components/websocket-rails-js/websocket_rails.0.0.1.min.js',
					'bower_components/moment/moment.js',
					'bower_components/livestamp/livestamp.js'
					]
				}
			},
			homepage: {
				files: {
					'public/javascripts/homepage.js': [
					'app/assets/javascripts/homepage.js'
					]
				}
			},
			events: {
				files: {
					'public/javascripts/events.js': [
					'bower_components/moment/moment.js',
					'bower_components/fullcalendar/dist/fullcalendar.js'
					]
				}
			},
			map: {
				files: {
					'public/javascripts/map.js': [
					'app/assets/javascripts/map.js',
					'bower_components/slick-carousel/slick/slick.js'
					]
				}
			},
			gmaps: {
				files: {
					'public/javascripts/gmaps.js': [
					'bower_components/gmaps/gmaps.js',
					'bower_components/v3-utility-library/infobox/src/infobox.js'
					]
				}
			},
			tweetstream: {
				files: {
					'public/javascripts/tweet_stream.js': [
					'app/assets/javascripts/tweet_stream.js'
					]
				}
			},
			tweetmap: {
				files: {
					'public/javascripts/tweet_map.js': [
					'app/assets/javascripts/tweet_map.js'
					]
				}
			}
		},
		cssmin: {
			options: {
				banner: '/* <%= grunt.template.today("yyyy-mm-dd") %> */',
				root: './'
			},
			base: {
				files: {
					'public/stylesheets/base.css': [
					'bower_components/jquery-ui/themes/ui-lightness/jquery-ui.css',
					'bower_components/jquery-ui/themes/ui-lightness/theme.css',
					'bower_components/components-font-awesome/css/font-awesome.css',
					'bower_components/bootstrap/dist/css/bootstrap.min.css',
					'bower_components/bootstrap/dist/css/bootstrap-theme.min.css',
					'bower_components/fullcalendar/dist/fullcalendar.css',
					'ower_components/slick-carousel/slick/slick-theme.css',
					'bower_components/slick-carousel/slick/slick.css'
					]
				}
			}
		},
		compass: {
			dev: {
				options: {
					require: [ 'susy', 'breakpoint' ],
					sassDir: 'app/assets/stylesheets/',
					cssDir: 'public/stylesheets/',
					imagesDir: 'public/images/',
					javascriptsDir: 'public/js/',
					fontsDir: 'public/fonts/',
					importPath: 'app/assets/stylesheets/',
					outputStyle: 'expanded',
					relativeAssets: true,
					noLineComments: false,
					raw: 'preferred_syntax = :sass\n'
				}
			}
		},
		watch: {
			styles: {
				files: [ 'app/assets/stylesheets/**/*.scss' ],
				tasks: [ 'compass' ],
				options: {
					spawn: false
				}
			}
		}
	} );

	grunt.registerTask( 'default', [
	'compass',
	'newer:uglify',
	'newer:cssmin'
	] );

	grunt.registerTask( 'lint', [
	'jshint',
	'jscs',
	'scsslint'
	] );

	grunt.registerTask( 'compile', [
	'compass'
	] );

	grunt.registerTask( 'test', [
	'compass', 'jshint', 'jscs', 'scsslint'
	] );
};
