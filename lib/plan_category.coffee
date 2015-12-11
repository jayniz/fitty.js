PlanBase = require './plan_base'
Q = require 'q'

class PlanCategory extends PlanBase

  plans: ->
    new Fitty.Plan(d) for d in @data.plans


PlanCategory.all = ->
  deferred = Q.defer()
  Fitty.Api.get(null, "/plans")
    .then((plans) -> deferred.resolve(new PlanCategory(p) for p in plans))
    .catch((d) -> deferred.reject(d) )
  deferred.promise

module.exports = PlanCategory
