define ['src/tasty_widget', 'src/tasty_style'], (TastyWidget, TastyStyle) ->
  describe 'TastyWidget', ->

    describe '#new', ->
      subject = -> new TastyWidget()

      it 'has settings', ->
        expect(subject().style).toBeInstanceOf TastyStyle
