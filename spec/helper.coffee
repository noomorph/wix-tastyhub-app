define ["knockout"], (ko) ->
  beforeEach ->
    @addMatchers
      toBeObservable: (value) ->
        return false unless ko.isObservable @actual
        return true unless value?
        if typeof value == "object"
          JSON.stringify(@actual()) == JSON.stringify(value)
        else
          @actual() == value

      toBeComputed: (value) ->
        return false unless ko.isComputed @actual
        return true unless value?
        if typeof value == "object"
          JSON.stringify(@actual()) == JSON.stringify(value)
        else
          @actual() == value

      toBeInstanceOf: (klass, arg) ->
        @actual? and
        @actual.constructor == klass

      toEqualJSON: (expected) ->
        JSON.stringify(@actual) == JSON.stringify(expected)
