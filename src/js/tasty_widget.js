define(["knockout", "js/tasty_style"], function (ko, TastyStyle) {
  "use strict";

  function TastyWidget(config) {
    config = config || {};
    this.style = new TastyStyle(config.style);
    this.color = ko.observable("black");
  }

  return TastyWidget;
});
