define ["style/margin"], (Margin) ->
  describe "new Margin( ... ).$", ->
    it "should have shorthand 'margin' property", ->
      expect(new Margin(3).$()).toEqual { margin: "3px" }
    it "should have full 'margin' property", ->
      expect(new Margin(2, 1, 0, 3).$()).toEqual { margin: "2px 1px 0 3px" }
