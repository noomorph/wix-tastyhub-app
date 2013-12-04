define([
  "knockout",
  "js/tasty_navigation",
  "style/metric",
  "style/border"
], function (ko, TastyNavigation, Metric, Border) {
  'use strict';

  function TastyStyle () {
    this.width = new Metric();
    this.height = new Metric();
    this.border = new Border();
    this.navigation = new TastyNavigation();
  }

  return TastyStyle;
});
