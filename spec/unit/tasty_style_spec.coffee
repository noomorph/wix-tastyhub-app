define [
  'js/tasty_style',
  'js/tasty_navigation',
  'style/metric',
  'style/border_radius',
  'style/border_box'
], (TastyStyle, TastyNavigation, Metric, BorderRadius, BorderBox) ->

  describe 'TastyStyle', ->
    describe "when created from config", ->

# helper code
      subject = (config) -> new TastyStyle(config)
      its = (prop, value) ->
        o = {}
        o[prop] = value?.eq || value
        new TastyStyle(o)[prop]
# end

      it "should have init width from config", ->
        expect(its 'width', { eq: 320 }).toEqualJSON new Metric(320)

      it "should have init height from config", ->
        expect(its 'height', { eq: 480 }).toEqualJSON new Metric(480)

      it "should have border", ->
        configured =
          top: { width: 1, style: 'solid', color: '#000' }
          right: { width: 2, style: 'dashed', color: '#999' }
          bottom: { width: 3, style: 'dotter', color: '#fff' }
          left: { width: 0, style: 'none', color: '#555' }
        expect(its 'border', configured).toEqualJSON new BorderBox(configured)

      it "should have radius", ->
        configured = { left: 0, top: 1, right: 2, bottom: 3 }
        expect(its 'radius', configured).toEqualJSON new BorderRadius(configured)

      it "should have navigation settings", ->
        configured = {}
        expect(its 'navigation', configured).toEqualJSON new TastyNavigation(configured)

    describe ".$", ->
      its = (prop) -> new TastyStyle().$()[prop]

      it "should have width", ->
        expect(its 'width').toBe "0"
      it "should have height", ->
        expect(its 'height').toBe "0"
      it "should have border", ->
        expect(its 'border').toBe "none"
