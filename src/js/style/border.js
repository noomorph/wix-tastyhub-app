define(["knockout"], function (ko) {
  function Border(width, style, color) {
    if (typeof width === "object") {
      color = width.color;
      style = width.style;
      width = width.width;
    }
    this.width = ko.observable(width || 0);
    this.style = ko.observable(style || "none");
    this.color = ko.observable(color || "#000");

    this.$ = ko.computed(function () {
      var w = this.width(),
          s = this.style(),
          c = this.color(),
          none = w < 1 || s === "none";

      if (none) {
        return "none";
      } else {
        return w + "px " + s + " " + c;
      }
    }, this);
  }

  return Border;
});
