module.exports = function(grunt) {
  require('time-grunt')(grunt);

  require('load-grunt-tasks')(grunt, {
    pattern: ['grunt-*', '!grunt-log-headers']
  });

  require('grunt-log-headers')(grunt);

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
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
      'webroot/css/**/*.css',
      'webroot/js/**/*.js',
      '.sass-cache/',
      'tmp/debug_kit.sqlite'
      ]
    },
    scsslint: {
      files: [
      'assets/stylesheets/**/*.scss',
      ],
      options: {
        bundleExec: true,
        config: '.scss-lint.yml',
        reporterOutput: 'scss-lint-report.xml',
        colorizeOutput: true
      },
    },
    jshint: {
      options: {
        reporter: require('jshint-stylish'),
        globals: {
          jQuery: true,
          console: true
        }
      },
      src: [
      '*.js',
      'assets/js/**/*.js',
      ]
    },
    jscs: {
      src: [
      '*.js',
      'assets/js/**/*.js',
      ],
      options: {
        preset: 'google',	// Enforce google JS code style guidelines
        fix: true			// Auto fix code style errors
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
          'webroot/js/base.js': [
          'bower_components/jquery/dist/jquery.js',
          'bower_components/jquery-ui/jquery-ui.js'
          ]
        }
      },
      homepage: {
        files: {
          'webroot/js/homepage.js': [
          'assets/js/homepage.js',
          ]
        }
      },
    },
    cssmin: {
      options: {
        banner: '/* <%= grunt.template.today("yyyy-mm-dd") %> */',
        root: './'
      },
      base: {
        files: {
          'webroot/css/base.css': [
          'bower_components/jquery-ui/themes/ui-lightness/jquery-ui.css',
          'bower_components/jquery-ui/themes/ui-lightness/theme.css',
          'bower_components/components-font-awesome/css/font-awesome.css'
          ]
        }
      }
    },
    compass: {
      dev: {
        options: {
          require: ['susy', 'breakpoint'],
          sassDir: 'assets/stylesheets/',
          cssDir: 'webroot/css/',
          imagesDir: 'webroot/img/',
          javascriptsDir: 'webroot/js/',
          fontsDir: 'webroot/fonts/',
          importPath: 'assets/stylesheets/',
          outputStyle: 'expanded',
          relativeAssets: true,
          noLineComments: false,
          raw: 'preferred_syntax = :sass\n'
        }
      },
    },
    watch: {
      styles: {
        files: ['assets/stylesheets/**/**/*.scss'],
        tasks: ['compass'],
        options: {
          spawn: false,
        },
      },
    },
  });

  grunt.registerTask('default', [
  'compass',
  'newer:uglify',
  'newer:cssmin',
  ]);

  grunt.registerTask('lint', [
  'jshint',
  'jscs',
  'scsslint'
  ]);

  grunt.registerTask('compile', [
  'compass'
  ]);

  grunt.registerTask('watch', [
  'watch'
  ]);

  grunt.registerTask('test', [
  'compass', 'jshint', 'jscs', 'scsslint'
  ]);
};
