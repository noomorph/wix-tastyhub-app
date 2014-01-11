/* jshint maxparams: 6 */
define(["knockout"], function (ko) {
  "use strict";

  function TastyStyle(config) {
    config = config || {};

    this.sideMargins = ko.observable(config.sideMargins || "none");
  }

  TastyStyle.prototype = {
    setSideMargins: function (value) {
      return function () {
        this.sideMargins(value);
      }.bind(this);
    }
  };

  return TastyStyle;
});
