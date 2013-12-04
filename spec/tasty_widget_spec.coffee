define ['js/tasty_widget', 'js/tasty_style'], (TastyWidget, TastyStyle) ->
  describe 'TastyWidget', ->

    describe '#new', ->
      subject = (config) -> new TastyWidget(config)

      it 'has settings', ->
        expect(subject().style).toBeInstanceOf TastyStyle

      it 'passes config style property to TastyStyle', ->
        widget = subject({ style: { width: 320 } })
        expect(widget.style.width.value()).toBe 320
