/* jshint maxparams: 6 */
define([
  "knockout",
  "lodash",
  "js/tasty_navigation",
  "style/metric",
  "style/border_radius",
  "style/border_box"
], function (ko, _, TastyNavigation, Metric, BorderRadius, BorderBox) {
  'use strict';

  function TastyStyle (config) {
    config = config || {};
    this.width = new Metric(config.width);
    this.height = new Metric(config.height);
    this.border = new BorderBox(config.border);
    this.radius = new BorderRadius(config.radius);
    this.navigation = new TastyNavigation(config.navigation);

    this.$ = ko.computed(function () {
      var result = {
        width: this.width.$(),
        height: this.height.$()
      };
      _.assign(result, this.border.$());

      return result;
    }, this);
  }

  return TastyStyle;
});
