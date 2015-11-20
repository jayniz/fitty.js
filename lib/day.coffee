class Day
  constructor: (@data) ->

  description: (lang) ->
    Fitty.Helper.byLanguage(@data.descriptions, lang)

  name: (lang) ->
    Fitty.Helper.nameByLanguage(@data.names, lang)

  exercises: ->
    new Fitty.Exercise(d) for d in @data.exercises



module.exports = Day
