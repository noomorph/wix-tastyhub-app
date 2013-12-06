define(["knockout"], function (ko) {
  "use strict";

  function Metric(value, unit) {
    if (typeof value === "object") {
      unit = value.unit;
      value = value.value;
    }

    this.value = ko.observable(value || 0);
    this.unit = ko.observable(unit || "px");

    this.$ = ko.computed(function () {
      var v = this.value();
      var u = v === 0 ? "" : this.unit();
      return v + u;
    }, this);
  }

  return Metric;
});
