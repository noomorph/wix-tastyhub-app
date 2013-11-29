# TastyHub widget for Wix App Market [![Build Status](https://travis-ci.org/noomorph/wix-tastyhub-app.png)](https://travis-ci.org/noomorph/wix-tastyhub-app)

Licensed under GPLv2 [LICENSE].

## Description

To be done.

## Getting Started

- Clone this repo locally.
- If you haven't installed [grunt] yet, check out the [Getting Started] guide, or: `npm install -g grunt-cli`
- Install dependencies by running: `npm install`
- Run jshint and the Jasmine tests with: `grunt test`

Project has been also configured [package.json] to run the test tasks by running: `npm test`

## Test setup

Test specs are within the `spec/` directory. Spec files are wrapped in a define method requiring the module to be tested as a dependency.

Generally, spec files should only test a single js module. Ideally, module dependencies should be mocked or stubbed so that the module can be tested in isolation.

[grunt-contrib-jasmine] handles automatic creation of the Jasmine test runner and [grunt-template-jasmine-requirejs] will setup requiring of spec files and module sources. This is all configured within `Gruntfile.js`.

```js
grunt.initConfig({
    jasmine : {
        src : 'src/**/*.js',
        options : {
            specs : 'spec/**/*.js',
            template: require('grunt-template-jasmine-requirejs'),
            templateOptions: {
                requireConfig: {
                        baseUrl: ''
                }
            }
        }
    }
})
```

> Created using [grunt-contrib-jasmine] and [grunt-template-jasmine-requirejs].
> Cloned from Jarrod Overson's [grunt-contrib-jasmine-example].

[grunt]: http://gruntjs.com/
[Getting Started]: https://github.com/gruntjs/grunt/blob/devel/docs/getting_started.md
[package.json]: https://npmjs.org/doc/json.html
[grunt-contrib-jasmine]: https://github.com/gruntjs/grunt-contrib-jasmine
[grunt-template-jasmine-requirejs]: https://github.com/jsoverson/grunt-template-jasmine-requirejs
[grunt-contrib-jasmine-example]: https://github.com/jsoverson/grunt-contrib-jasmine-example
