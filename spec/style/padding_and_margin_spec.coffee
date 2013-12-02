define [
  "style/metric", "style/metric_box",
  "style/padding", "style/margin"
], (Metric, MetricBox, Padding, Margin) ->

  expect_that_it_acts_like_metric_box = (Klass) ->

    describe Klass.name, ->
      subject = (all, side, bottom, left) ->
        new Klass(all, side, bottom, left)

      describe "undefined", ->
        it "should have top: Metric", ->
          expect(subject().top).toBeInstanceOf Metric
        it "should have right: Metric", ->
          expect(subject().right).toBeInstanceOf Metric
        it "should have bottom: Metric", ->
          expect(subject().bottom).toBeInstanceOf Metric
        it "should have left: Metric", ->
          expect(subject().left).toBeInstanceOf Metric
        it "should have $ = '0'", ->
          expect(subject().$).toBeComputed "0"

      describe "initialized with single parameter", ->
        beforeEach ->
          @box = subject(5)

        describe 'when all sides are equal', ->
          it "should have $ = '<all>'", ->
            expect(@box.$()).toBe "5px"

        describe 'when left == right and bottom == top', ->
          beforeEach ->
            @box.top.value(2)
            @box.bottom.value(2)
          it "should have $ = '<top/bottom> <left/right>'", ->
            expect(@box.$()).toBe "2px 5px"

        describe 'when left == right but bottom != top', ->
          beforeEach ->
            @box.bottom.value(1)
          it "should have $ = '<top> <side> <bottom>'", ->
            expect(@box.$()).toBe "5px 5px 1px"

        describe 'when right != left', ->
          beforeEach ->
            @box.left.value(1)
          it "should have $ = '<top> <right> <bottom> <left>'", ->
            expect(@box.$()).toBe "5px 5px 5px 1px"

  expect_that_it_acts_like_metric_box(Padding)
  expect_that_it_acts_like_metric_box(Margin)
