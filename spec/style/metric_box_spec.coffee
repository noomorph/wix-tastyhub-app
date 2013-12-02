define ['style/box', 'style/metric', 'style/metric_box'], (Box, Metric, MetricBox) ->
  describe 'MetricBox', ->
    subject = (all, side, bottom, left) ->
      new MetricBox(all, side, bottom, left)

    beforeEach ->
      @addMatchers
        toBeMetric: (value, unit) ->
          if @actual? and @actual.constructor == Metric
            return @actual.$() == new Metric(value, unit).$()
          false

    describe "undefined", ->
      it "should have undefined top metric", ->
        expect(subject().top).toBeMetric()
      it "should have undefined left metric", ->
        expect(subject().left).toBeMetric()
      it "should have undefined right metric", ->
        expect(subject().right).toBeMetric()
      it "should have undefined bottom metric", ->
        expect(subject().bottom).toBeMetric()

    describe "constructed with single value parameter", ->
      value = 5
      beforeEach -> @box = subject(value)

      it "should init: top", ->
        expect(@box.top).toBeMetric(value)
      it "should init: right", ->
        expect(@box.right).toBeMetric(value)
      it "should init: bottom", ->
        expect(@box.bottom).toBeMetric(value)
      it "should init: left", ->
        expect(@box.left).toBeMetric(value)

    describe "constructed with two value parameters", ->
      [first, second] = [2, 5]
      beforeEach -> @box = subject(first, second)

      it "should init: top = 1st arg", ->
        expect(@box.top).toBeMetric(first)
      it "should init: right = 2nd arg", ->
        expect(@box.right).toBeMetric(second)
      it "should init: bottom = 1st arg", ->
        expect(@box.bottom).toBeMetric(first)
      it "should init: left = 2nd arg", ->
        expect(@box.left).toBeMetric(second)

    describe "constructed with three value parameters", ->
      [first, second, third] = [2, 5, 0]
      beforeEach -> @box = subject(first, second, third)

      it "should init: top = 1st arg", ->
        expect(@box.top).toBeMetric(first)
      it "should init: right = 2nd arg", ->
        expect(@box.right).toBeMetric(second)
      it "should init: bottom = 3rd arg", ->
        expect(@box.bottom).toBeMetric(third)
      it "should init: left = 2nd arg", ->
        expect(@box.left).toBeMetric(second)

    describe "constructed with four value parameters", ->
      [arg1, arg2, arg3, arg4] = [2, 5, 0, 1]
      beforeEach -> @box = subject(arg1, arg2, arg3, arg4)

      it "should init: top = 1st arg", ->
        expect(@box.top).toBeMetric(arg1)
      it "should init: right = 2nd arg", ->
        expect(@box.right).toBeMetric(arg2)
      it "should init: bottom = 3rd arg", ->
        expect(@box.bottom).toBeMetric(arg3)
      it "should init: left = 4th arg", ->
        expect(@box.left).toBeMetric(arg4)

    describe "constructed with four object parameters", ->
      metric = (v, u) -> { value: v, unit: u }
      top = metric(1, 'px')
      right = metric(5, '%')
      bottom = metric(2, 'em')
      left = metric(10, '%')

      beforeEach -> @box = subject(top, right, bottom, left)

      it "should init: top = 1st arg", ->
        expect(@box.top).toBeMetric(top.value, top.unit)
      it "should init: right = 2nd arg", ->
        expect(@box.right).toBeMetric(right.value, right.unit)
      it "should init: bottom = 3rd arg", ->
        expect(@box.bottom).toBeMetric(bottom.value, bottom.unit)
      it "should init: left = 4th arg", ->
        expect(@box.left).toBeMetric(left.value, left.unit)
