define([
  "knockout",
  "js/tasty_navigation",
  "style/metric",
  "style/border"
], function (ko, TastyNavigation, Metric, Border) {
  'use strict';

  function TastyStyle (config) {
    config = config || {};
    this.width = new Metric(config.width);
    this.height = new Metric(config.height);
    this.border = new Border(config.border);
    this.navigation = new TastyNavigation(config.navigation);

    this.$ = ko.computed(function () {
      return {
        width: this.width.$(),
        height: this.height.$(),
        border: this.border.$()
      };
    }, this);
  }

  return TastyStyle;
});
