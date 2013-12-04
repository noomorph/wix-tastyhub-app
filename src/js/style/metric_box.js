define(["knockout", "style/metric", "style/box"], function (ko, Metric, Box) {
  function MetricBox (all, side, bottom, left) {
    Box.call(this, Metric, all, side, bottom, left);

    this.$ = ko.computed(function () {
      var left = this.left.$(),
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

      return args.join(' ');
    }, this);
  }

  return MetricBox;
});

