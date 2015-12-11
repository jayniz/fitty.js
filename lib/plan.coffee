PlanBase = require './plan_base'

class Plan extends PlanBase

  fitnessLevel: ->
    new Fitty.FitnessLevel(@data.fitness_level)

  teaser: (lang) ->
    Fitty.Helper.byLanguage(@data.teasers, lang)

  days: ->
    days = for d in @data.days
      new Fitty.Day(d)


module.exports = Plan
