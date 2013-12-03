define [
  "style/metric", "style/metric_box",
  "style/margin"
], (Metric, MetricBox, Margin) ->

  describe "Margin", ->
    describe "margin.$", ->
       
      it "should nest margin property", ->
        when_constructed_with = (a) ->
          margin = new Margin(a[0], a[1], a[2], a[3])
          metric_box = new MetricBox(a[0], a[1], a[2], a[3])
          expect(margin.$()).toEqual { margin: metric_box.$() }

        when_constructed_with []
        when_constructed_with [1]
        when_constructed_with [0, 1]
        when_constructed_with [1, 0, 2]
        when_constructed_with [2, 1, 0, 3]
