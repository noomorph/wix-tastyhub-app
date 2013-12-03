define [
  "style/metric", "style/metric_box",
  "style/margin"
], (Metric, MetricBox, Margin) ->

  describe "Margin", ->
    describe "margin.$", ->
       
      it "should nest margin property", ->
        should_nest_when_constructed_with = (a) ->
          margin = new Margin(a[0], a[1], a[2], a[3])
          metric_box = new MetricBox(a[0], a[1], a[2], a[3])
          expect(margin.$()).toEqual { margin: metric_box.$() }

        should_nest_when_constructed_with []
        should_nest_when_constructed_with [1]
        should_nest_when_constructed_with [0, 1]
        should_nest_when_constructed_with [1, 0, 2]
        should_nest_when_constructed_with [2, 1, 0, 3]
