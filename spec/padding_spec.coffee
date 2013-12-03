define [
  "style/metric", "style/metric_box",
  "style/padding"
], (Metric, MetricBox, Padding) ->

  describe "Padding", ->
    describe "padding.$", ->
       
      it "should nest padding property", ->
        should_nest_when_constructed_with = (a) ->
          padding = new Padding(a[0], a[1], a[2], a[3])
          metric_box = new MetricBox(a[0], a[1], a[2], a[3])
          expect(padding.$()).toEqual { padding: metric_box.$() }

        should_nest_when_constructed_with []
        should_nest_when_constructed_with [1]
        should_nest_when_constructed_with [0, 1]
        should_nest_when_constructed_with [1, 0, 2]
        should_nest_when_constructed_with [2, 1, 0, 3]
