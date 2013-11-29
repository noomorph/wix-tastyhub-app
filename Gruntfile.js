module.exports = function(grunt) {
  'use strict';

  // Project configuration.
  grunt.initConfig({
    jasmine: {
      requirejs: {
        src: 'src/**/*.js',
          options: {
            specs: 'spec/**/*.js',
              template: require('grunt-template-jasmine-requirejs'),
              templateOptions: {
              requireConfig: {
              baseUrl: ''
            }
          }
        }
      }
    },
    jshint: {
      all: [
        'Gruntfile.js',
        'src/**/*.js'
      ],
      options: {
        jshintrc: '.jshintrc'
      }
    },
    coffee: {
      spec: {
        options: {
          sourceMap: true
        },
        expand: true,
        flatten: true,
        cwd: 'spec/',
        src: ['*.coffee'],
        dest: 'spec/',
        ext: '.js'
      }
    },
    clean: ["spec/**/*.js", "spec/**/*.js.map"],
    watch: {
      js: {
        files: ['src/**/*.js', 'spec/**/*.coffee'],
        tasks: 'test'
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-jasmine');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('test', ['clean', 'jshint', 'coffee', 'jasmine']);
  grunt.registerTask('default', ['test', 'watch']);

};
