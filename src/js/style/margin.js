define(["knockout", "style/metric_box"], function (ko, MetricBox) {
  function Margin(all, side, bottom, left) {
    MetricBox.call(this, "margin", all, side, bottom, left);
  }
  return Margin;
});
