/* jshint eqnull: true */
define(function () {
  function Box(Klass, all, side, bottom, left) {
    side = side != null ? side : all;
    bottom = bottom != null ? bottom : all;
    left = left != null ? left : side;

    if (typeof all === "object" &&
        all.hasOwnProperty("top") &&
        all.hasOwnProperty("right") &&
        all.hasOwnProperty("bottom") &&
        all.hasOwnProperty("left")) {
      left = all.left;
      bottom = all.bottom;
      side = all.right;
      all = all.top;
    }

    this.top = new Klass(all);
    this.bottom = new Klass(bottom);
    this.left = new Klass(left);
    this.right = new Klass(side);
  }

  return Box;
});
