define ['js/tasty_style'], (TastyStyle) ->

  describe 'TastyStyle', ->
    describe "when created from config", ->

# helper code
      subject = (config) -> new TastyStyle(config)
      its = (prop, value) ->
        o = {}
        o[prop] = value?.eq || value
        new TastyStyle(o)[prop]()
# end

      it "should have init sideMargins from config", ->
        expect(its 'sideMargins', { eq: "none" }).toEqual "none"
        expect(its 'sideMargins', { eq: "narrow" }).toEqual "narrow"
        expect(its 'sideMargins', { eq: "wide" }).toEqual "wide"