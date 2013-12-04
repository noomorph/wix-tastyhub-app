define ['js/tasty_style', 'js/tasty_navigation', 'style/metric', 'style/border'], (TastyStyle, TastyNavigation, Metric, Border) ->
  describe 'TastyStyle', ->
    describe "#new", ->
      subject = -> new TastyStyle()

      it "should have width", ->
        expect(subject().width).toBeInstanceOf Metric

      it "should have height", ->
        expect(subject().height).toBeInstanceOf Metric

      it "should have border", ->
        expect(subject().border).toBeInstanceOf Border

      it "should have navigation settings", ->
        expect(subject().navigation).toBeInstanceOf TastyNavigation
