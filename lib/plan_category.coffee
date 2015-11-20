Q = require 'q'

class PlanCategory
  constructor: (@data) ->

  name: (lang) ->
    Fitty.Helper.nameByLanguage(@data.names, lang)

  plans: ->
    new Fitty.Plan(d) for d in @data.plans


PlanCategory.all = ->
  deferred = Q.defer()
  Fitty.Api.get(null, "/plans")
    .then((plans) -> deferred.resolve(new PlanCategory(p) for p in plans))
    .catch((d) -> deferred.reject(d) )
  deferred.promise

module.exports = PlanCategory
