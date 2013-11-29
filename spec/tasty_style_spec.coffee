define ['src/tasty_style', 'style/metric', 'style/border'], (TastyStyle, Metric, Border) ->
  describe 'TastyStyle', ->
    describe "#new", ->
      subject = -> new TastyStyle()

      it "should have width", ->
        expect(subject().width).toBeInstanceOf Metric

      it "should have height", ->
        expect(subject().height).toBeInstanceOf Metric

      it "should have border", ->
        expect(subject().border).toBeInstanceOf Border
