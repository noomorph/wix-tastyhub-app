define(["knockout", "js/tasty_widget"], function(ko, TastyWidget) {
  window.widget = new TastyWidget({
    style: {
      width: 320,
      height: 480,
      border: {
        top:    { width: 1, style: 'solid', color: 'black' },
        right:  { width: 2, style: 'dashed', color: 'black' },
        bottom: { width: 3, style: 'dotted', color: 'black' },
        left:   { width: 4, style: 'solid', color: 'gray' }
      }
    }
  });
  ko.applyBindings(window.widget);
});