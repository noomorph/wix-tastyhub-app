define [
  "style/metric", "style/metric_box",
  "style/padding"
], (Metric, MetricBox, Padding) ->

  describe "Padding", ->
    describe "padding.$", ->
       
      it "should nest padding property", ->
        when_constructed_with = (a) ->
          padding = new Padding(a[0], a[1], a[2], a[3])
          metric_box = new MetricBox(a[0], a[1], a[2], a[3])
          expect(padding.$()).toEqual { padding: metric_box.$() }

        when_constructed_with []
        when_constructed_with [1]
        when_constructed_with [0, 1]
        when_constructed_with [1, 0, 2]
        when_constructed_with [2, 1, 0, 3]
