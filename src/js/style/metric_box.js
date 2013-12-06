/* jshint maxdepth: 3 */
define(["knockout", "style/metric", "style/box"], function (ko, Metric, Box) {
  function MetricBox(property, all, side, bottom, left) {
    Box.call(this, Metric, all, side, bottom, left);

    this.$ = ko.computed(function () {
      var wrapper, result,
          left = this.left.$(),
          right = this.right.$(),
          top = this.top.$(),
          bottom = this.bottom.$(),
          args = [top, right, bottom, left];

      if (left === right) {
        args.pop();
        if (bottom === top) {
          args.pop();
          if (top === left) {
            args.pop();
          }
        }
      }

      result = args.join(" ");
      if (!property) {
        return result;
      }

      wrapper = {};
      wrapper[property] = result;
      return wrapper;

    }, this);
  }

  return MetricBox;
});

