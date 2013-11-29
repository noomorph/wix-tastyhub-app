define(["knockout", "style/metric", "style/border"], function (ko, Metric, Border) {
  'use strict';

  function TastyStyle () {
    this.width = new Metric();
    this.height = new Metric();
    this.border = new Border();
  }

  return TastyStyle;
});
