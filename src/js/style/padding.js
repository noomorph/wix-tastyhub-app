define(["knockout", "style/metric_box"], function (ko, MetricBox) {
  function Padding(all, side, bottom, left) {
    MetricBox.call(this, "padding", all, side, bottom, left);
  }
  return Padding;
});

