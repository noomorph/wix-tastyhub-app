define ['src/tasty_style'], (TastyStyle) ->
  describe 'TastyStyle', ->
    describe "new style", ->
      style = -> new TastyStyle()

      it "should have width", ->
        expect(style().width).toBeDefined()

      it "should have height", ->
        expect(style().height).toBeDefined()

      it "should have border", ->
        expect(style().border).toBeDefined()
