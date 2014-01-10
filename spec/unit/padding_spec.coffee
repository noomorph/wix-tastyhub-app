define ["style/padding"], (Padding) ->
  describe "new Padding( ... ).$", ->
    it "should have shorthand 'padding' property", ->
      expect(new Padding(3).$()).toEqual { padding: "3px" }
    it "should have 'padding' property", ->
      expect(new Padding(2, 1, 0, 3).$()).toEqual { padding: "2px 1px 0 3px" }
