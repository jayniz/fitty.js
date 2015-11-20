class Exercise
  constructor: (@data) ->

  description: (lang) ->
    Fitty.Helper.byLanguage(@data.descriptions, lang)

  name: (lang) ->
    Fitty.Helper.nameByLanguage(@data.names, lang)



module.exports = Exercise
