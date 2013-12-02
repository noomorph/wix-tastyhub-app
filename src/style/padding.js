define(["knockout", "style/metric_box"], function (ko, MetricBox) {
  function Padding (all, side, bottom, left) {
    MetricBox.call(this, all, side, bottom, left);
  }
  return Padding;
});

