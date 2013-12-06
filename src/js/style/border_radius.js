define(["knockout", "style/metric_box"], function (ko, MetricBox) {
  function BorderRadius(topLeft, topRight, bottomRight, bottomLeft) {
    MetricBox.call(this, "borderRadius", topLeft, topRight, bottomRight, bottomLeft);
  }
  return BorderRadius;
});
