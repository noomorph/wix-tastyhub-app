define(["src/tasty_style"], function (TastyStyle) {
  'use strict';

  function TastyWidget(config) {
      config = config || {};
      this.style = new TastyStyle(config.style);
  }

  return TastyWidget;
});
