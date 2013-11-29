define ['src/tasty_widget'], (TastyWidget) ->
  describe 'TastyWidget', ->

    describe 'new widget', ->
      widget = -> new TastyWidget()

      it 'has settings', ->
        expect(widget().settings).toBeDefined()
