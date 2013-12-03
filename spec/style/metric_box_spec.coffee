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

    describe "constructed with 4 metric args", ->
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

    describe "metric_box.$", ->
      beforeEach -> @box = subject(5)

      describe 'when all sides are equal', ->
        it "should have $ = '<all>'", ->
          expect(@box.$()).toBe "5px"

      describe 'when left == right and bottom == top == 0', ->
        beforeEach ->
          @box.top.value(0)
          @box.bottom.value(0)
        it "should have $ = '<top/bottom> <left/right>'", ->
          expect(@box.$()).toBe "0 5px"

      describe 'when left == right but bottom != top', ->
        beforeEach ->
          @box.bottom.value(0)
        it "should have $ = '<top> <side> <bottom>'", ->
          expect(@box.$()).toBe "5px 5px 0"

      describe 'when right != left', ->
        beforeEach ->
          @box.left.unit('%')
        it "should have $ = '<top> <right> <bottom> <left>'", ->
          expect(@box.$()).toBe "5px 5px 5px 5%"
