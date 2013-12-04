define(["knockout", "style/metric_box"], function (ko, MetricBox) {
  function Padding (all, side, bottom, left) {
    MetricBox.call(this, all, side, bottom, left);

    var _$ = this.$;
    this.$ = ko.computed(function () {
      return { padding: _$() };
    }, this);
  }
  return Padding;
});

