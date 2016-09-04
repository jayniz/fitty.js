PlanBase = require './plan_base'
Q = require 'q'

class Exercise extends PlanBase
  muscleGroup: ->
    new Fitty.MuscleGroup(@data.primary_muscle_sub_group.muscle_group)

  primaryMuscleSubGroup: ->
    new Fitty.MuscleSubGroup(@data.primary_muscle_sub_group)

  secondaryMuscleSubGroups: ->
    new Fitty.MuscleGroup(d) for d in @data.secondary_muscle_sub_groups

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
