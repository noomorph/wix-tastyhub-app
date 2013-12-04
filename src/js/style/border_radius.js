define(["knockout", "style/metric_box"], function (ko, MetricBox) {
  function BorderRadius (top_left, top_right, bottom_right, bottom_left) {
    MetricBox.call(this, 'borderRadius', top_left, top_right, bottom_right, bottom_left);
  }
  return BorderRadius;
});
