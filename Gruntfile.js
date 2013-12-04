module.exports = function(grunt) {
  'use strict';

  // Project configuration.
  grunt.initConfig({
    jasmine: {
      requirejs: {
        src: 'src/**/*.js',
        options: {
          specs: ['spec/**/*.js', '!spec/helper.js'],
          template: require('grunt-template-jasmine-requirejs'),
          templateOptions: {
            requireConfig: {
              baseUrl: '',
              paths: {
                "js": "src/js/",
                "spec": "spec/compiled/",
                "style": "src/js/style/",
                "knockout": "bower_components/knockout/build/output/knockout-latest.debug"
              }
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
          sourceMap: false
        },
        expand: true,
        flatten: true,
        cwd: 'spec/',
        src: ['**/*.coffee'],
        dest: 'spec/compiled/',
        ext: '.js'
      }
    },
    clean: ["spec/compiled"],
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
