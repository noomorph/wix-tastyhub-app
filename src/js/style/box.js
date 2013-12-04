define(function () {
  function Box (Klass, all, side, bottom, left) {
    side = side != null ? side : all;
    bottom = bottom != null ? bottom : all;
    left = left != null ? left : side;

    this.top = new Klass(all);
    this.bottom = new Klass(bottom);
    this.left = new Klass(left);
    this.right = new Klass(side);
  }
  
  return Box;
});
