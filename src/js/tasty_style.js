/* jshint maxparams: 6 */
define(["knockout"], function (ko) {
  "use strict";

  function TastyStyle(config) {
    config = config || {};

    this.sideMargins = ko.observable(config.sideMargins || "none");
  }

  TastyStyle.prototype = {
    SIDE_MARGINS: {
      "label": "SIDE_MARGINS",
      "values": [
        { "label": "NONE",   value: "none"   },
        { "label": "NARROW", value: "narrow" },
        { "label": "WIDE",   value: "wide"   }
      ]
    },
    setSideMargins: function (value) {
      return function () {
        this.sideMargins(value);
      }.bind(this);
    }
  };

  return TastyStyle;
});
