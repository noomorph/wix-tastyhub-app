define ["style/border_radius"], (BorderRadius) ->
  describe "new BorderRadius( ... ).$", ->
    it "should have shorthand 'borderRadius' property", ->
      expect(new BorderRadius(3).$()).toEqual { borderRadius: "3px" }
    it "should have full 'borderRadius' property", ->
      expect(new BorderRadius(2).$()).toEqual { borderRadius: "2px" }
