define [
  "style/border", "style/border_box"
], (Border, BorderBox) ->

  describe "BorderBox", ->
    beforeEach ->
      @addMatchers
        toBeBorder: (width, style, color) ->
          if @actual? and @actual.constructor == Border
            @actual.$() == new Border(width, style, color).$()
          else
            false

    border_object = (width, style, color) ->
      width: width
      style: style
      color: color

    subject = (top, right, bottom, left) ->
      new BorderBox(top, right, bottom, left)

    describe "constructed with no args", ->
      it "should have top border", ->
        expect(subject().top).toBeBorder()
      it "should have right border", ->
        expect(subject().right).toBeBorder()
      it "should have bottom border", ->
        expect(subject().bottom).toBeBorder()
      it "should have left border", ->
        expect(subject().left).toBeBorder()

    describe "constructed with 4 border args", ->
      top = border_object(1, 'solid', 'black')
      right = border_object(5, 'dotted', 'red')
      bottom = border_object(2, 'dashed', 'white')
      left = border_object(0, 'none', '#000')

      beforeEach -> @box = subject(top, right, bottom, left)

      it "should init: top = 1st arg", ->
        expect(@box.top).toBeBorder(top.width, top.style, top.color)
      it "should init: right = 2nd arg", ->
        expect(@box.right).toBeBorder(right.width, right.style, right.color)
      it "should init: bottom = 3rd arg", ->
        expect(@box.bottom).toBeBorder(bottom.width, bottom.style, bottom.color)
      it "should init: left = 4th arg", ->
        expect(@box.left).toBeBorder(left.width, left.style, left.color)

    describe "border.$", ->
      beforeEach ->
        @box = subject(border_object(2, 'solid', 'navy'))
        @expected_$ =
          borderTop: "2px solid navy"
          borderRight: "2px solid navy"
          borderBottom: "2px solid navy"
          borderLeft: "2px solid navy"

      describe 'when all sides are equal at start', ->
        it "should have $ = { border: '...' }", ->
          expect(@box.$()).toEqual { border: "2px solid navy" }
        
        describe 'when <left> differs', ->
          beforeEach ->
            @box.left.width(0)
            @expected_$.borderLeft = "none"

          it "should have $ = { top, right, bottom, left=0 }", ->
            expect(@box.$()).toEqual @expected_$

        describe 'when <top> differs', ->
          beforeEach ->
            @box.top.width(0)
            @expected_$.borderTop = "none"

          it "should have $ = { top=0, right, bottom, left }", ->
            expect(@box.$()).toEqual @expected_$

        describe 'when <right> differs', ->
          beforeEach ->
            @box.right.width(0)
            @expected_$.borderRight = "none"

          it "should have $ = { top, right=0, bottom, left }", ->
            expect(@box.$()).toEqual @expected_$

        describe 'when <bottom> differs', ->
          beforeEach ->
            @box.bottom.width(0)
            @expected_$.borderBottom = "none"

          it "should have $ = { top, right, bottom=0, left }", ->
            expect(@box.$()).toEqual @expected_$
