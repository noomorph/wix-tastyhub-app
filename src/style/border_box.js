define(["knockout", "style/border", "style/box"], function (ko, Border, Box) {
  function BorderBox (all, side, bottom, left) {
    Box.call(this, Border, all, side, bottom, left);

    this.$ = ko.computed(function () {
      var l = this.left.$(),
          r = this.right.$(),
          t = this.top.$(),
          b = this.bottom.$();

      if (l === r && t === b && l === t) {
        return { border: t };
      }

      return {
        borderTop: t,
        borderRight: r,
        borderBottom: b,
        borderLeft: l
      };
    }, this);
  }
  return BorderBox;
});

