define(["knockout", "js/l10n", "js/tasty_widget"], function (ko, l10n, TastyWidget) {

  ko.bindingHandlers["l10n"] = {
    init: function(element) {
      return { "controlsDescendantBindings": true };
    },
    update: function (element, valueAccessor, allBindings) {
      ko.utils.setTextContent(element, l10n[valueAccessor()]);
    }
  };

  window.widget = new TastyWidget({
    style: {
      sideMargins: "narrow"
    }
  });

  ko.applyBindings(window.widget);

  setInterval(function () {
    var style = ko.toJS(widget.style);
    delete style.SIDE_MARGINS;
    document.querySelector("pre").innerText = JSON.stringify(style);
  }, 500);

});