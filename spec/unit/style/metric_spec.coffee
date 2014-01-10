define ['spec/helper', 'style/metric'], (H, Metric) ->
  describe 'Metric', ->
    describe "new metric", ->
      subject = (value, unit) ->
        new Metric(value, unit)

      it "should have value", ->
        expect(subject().value).toBeObservable(0)
      it "should have unit", ->
        expect(subject().unit).toBeObservable('px')
      it "should have $", ->
        expect(subject().$).toBeComputed('0')

      describe "metric.$", ->

        it "does not append unit if zero", ->
          expect(subject(0, 'em').$()).toBe '0'
        it "appends unit if not zero", ->
          expect(subject(0.5, '%').$()).toBe '0.5%'
        it "default unit is px", ->
          expect(subject(320).$()).toBe '320px'
