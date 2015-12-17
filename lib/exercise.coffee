PlanBase = require './plan_base'

class Exercise extends PlanBase

Exercise.guessMuscleGroup = (name) ->
  slug = escape(String(name).toLowerCase())
  Fitty.Api.get(null, "/exercises/#{slug}/muscle_group")

module.exports = Exercise
