define ['style/box'], (Box) ->
  describe 'Box', ->
    class Stub
      constructor: (@value) ->

    subject = (all, side, bottom, left) ->
      new Box(Stub, all, side, bottom, left)

    beforeEach ->
      @addMatchers
        toBeInstanceOf: (klass) ->
          @actual? and @actual.constructor == klass

    describe "in general", ->
      it "should have top value", ->
        expect(subject().top).toBeInstanceOf Stub
      it "should have left value", ->
        expect(subject().left).toBeInstanceOf Stub
      it "should have right value", ->
        expect(subject().right).toBeInstanceOf Stub
      it "should have bottom value", ->
        expect(subject().bottom).toBeInstanceOf Stub

    describe "constructed with no args", ->
      it "should have undefined top", ->
        expect(subject().top.value).toBeUndefined()
      it "should have undefined left", ->
        expect(subject().left.value).toBeUndefined()
      it "should have undefined right", ->
        expect(subject().right.value).toBeUndefined()
      it "should have undefined bottom", ->
        expect(subject().bottom.value).toBeUndefined()

    describe "constructed with 1 arg", ->
      [$1] = [5]
      beforeEach -> @box = subject($1)

      it "should init: top", ->
        expect(@box.top).toEqual { value: $1 }
      it "should init: right", ->
        expect(@box.right).toEqual { value: $1 }
      it "should init: bottom", ->
        expect(@box.bottom).toEqual { value: $1 }
      it "should init: left", ->
        expect(@box.left).toEqual { value: $1 }

    describe "constructed with 2 arg", ->
      [$1, $2] = [2, ""]
      beforeEach -> @box = subject($1, $2)

      it "should init: top = 1st arg", ->
        expect(@box.top).toEqual { value: $1 }
      it "should init: right = 2nd arg", ->
        expect(@box.right).toEqual { value: $2 }
      it "should init: bottom = 1st arg", ->
        expect(@box.bottom).toEqual { value: $1 }
      it "should init: left = 2nd arg", ->
        expect(@box.left).toEqual { value: $2 }

    describe "constructed with 3 arg", ->
      [$1, $2, $3] = [{}, 5, 0]
      beforeEach -> @box = subject($1, $2, $3)

      it "should init: top = 1st arg", ->
        expect(@box.top).toEqual { value: $1 }
      it "should init: right = 2nd arg", ->
        expect(@box.right).toEqual { value: $2 }
      it "should init: bottom = 3rd arg", ->
        expect(@box.bottom).toEqual { value: $3 }
      it "should init: left = 2nd arg", ->
        expect(@box.left).toEqual { value: $2 }

    describe "constructed with four value parameters", ->
      [$1, $2, $3, $4] = [2, 5, 0, 1]
      beforeEach -> @box = subject($1, $2, $3, $4)

      it "should init: top = 1st arg", ->
        expect(@box.top).toEqual { value: $1 }
      it "should init: right = 2nd $", ->
        expect(@box.right).toEqual { value: $2 }
      it "should init: bottom = 3rd arg", ->
        expect(@box.bottom).toEqual { value: $3 }
      it "should init: left = 4th arg", ->
        expect(@box.left).toEqual { value: $4 }

    describe "constructed with config", ->
      describe "config missing a property", ->
        config = { top: 5, bottom: 0, right: 2 }
        beforeEach -> @box = subject(config)

        it "should init: top = config", ->
          expect(@box.top).toEqual { value: config }
        it "should init: right = config", ->
          expect(@box.right).toEqual { value: config }
        it "should init: bottom = config", ->
          expect(@box.bottom).toEqual { value: config }
        it "should init: left = config", ->
          expect(@box.left).toEqual { value: config }

      describe "valid config", ->
        config =
          top: 5
          bottom: {}
          left: 'none'
          right: []
        beforeEach -> @box = subject(config)

        it "should init: top = config.top", ->
          expect(@box.top).toEqual { value: config.top }
        it "should init: right = config.right", ->
          expect(@box.right).toEqual { value: config.right }
        it "should init: bottom = config.bottom", ->
          expect(@box.bottom).toEqual { value: config.bottom }
        it "should init: left = config.left", ->
          expect(@box.left).toEqual { value: config.left }
