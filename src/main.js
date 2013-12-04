define(["knockout", "js/tasty_widget"], function(ko, TastyWidget) {
  window.widget = new TastyWidget();
  ko.applyBindings(window.widget);
});
