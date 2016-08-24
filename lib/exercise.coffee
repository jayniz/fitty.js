PlanBase = require './plan_base'
Q = require 'q'

class Exercise extends PlanBase

Exercise.guessMuscleGroup = (name) ->
  slug = String(name).toLowerCase().replace(/[\/\.:#]/g, " ").replace(/\s+/g, "%20")
  Fitty.Api.get(null, "/exercises/#{slug}/muscle_group")

Exercise.all = ->
  deferred = Q.defer()
  Fitty.Api.get(null, "/exercises")
    .then((exercises) -> deferred.resolve(new Exercise(e) for e in exercises))
    .catch((d) -> deferred.reject(d) )
  deferred.promise


module.exports = Exercise
