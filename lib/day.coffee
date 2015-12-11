PlanBase = require './plan_base'
Workout = require './workout'

class Day extends PlanBase

  name: (langCode) ->
    if @data.names.length > 0
      Fitty.Helper.nameByLanguage(@data.names, langCode)
    else
      @workout().name(langCode)

  workout: ->
    new Workout(@data.workout)

  exercises: ->
    return [] unless @data?.workout?.exercises
    new Fitty.Exercise(d) for d in @data.workout.exercises

module.exports = Day
