define ['spec/helper', 'style/border'], (H, Border) ->
  describe "Border", ->
    subject = (width, style, color) ->
      new Border(width, style, color)

    describe "undefined", ->
      it "should have width", ->
        expect(subject().width).toBeObservable(0)
      it "should have style", ->
        expect(subject().style).toBeObservable('none')
      it "should have color", ->
        expect(subject().color).toBeObservable('#000')

    describe "predefined", ->
      it "width is 1st parameter", ->
        expect(subject(2).width()).toBe 2
      it "style is 2nd parameter", ->
        expect(subject(0,'solid').style()).toBe 'solid'
      it "color is 3nd parameter", ->
        expect(subject(0, 0, '#fff').color()).toBe '#fff'

      describe "with config object", ->
        it "gets width from config", ->
          expect(subject({ width: 2}).width()).toBe 2
        it "gets style from config", ->
          expect(subject({ style: 'cool'}).style()).toBe 'cool'
        it "gets color from config", ->
          expect(subject({ color: '#aaa'}).color()).toBe '#aaa'
        it "ignores other arguments", ->
          config = { width: 5, style: 'solid', color: 'red' }
          instance = subject(config, 'cool', '#aaa')
          expect(instance.style()).toBe 'solid'
          expect(instance.color()).toBe 'red'

    describe "$", ->
      it "is 'none' by default", ->
        expect(subject().$).toBeComputed('none')
      it "is 'none' when width = 0", ->
        expect(subject(0, 'solid', 'red').$()).toBe 'none'
      it "is 'none' when style = 'none'", ->
        expect(subject(3, 'none', 'red').$()).toBe 'none'
      it "is '3px solid red' when configured accordingly", ->
        expect(subject(3, 'solid', 'red').$()).toBe '3px solid red'
