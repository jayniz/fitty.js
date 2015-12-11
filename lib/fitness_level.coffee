PlanBase = require './plan_base'

class FitnessLevel extends PlanBase
  constructor: (@data) ->

  shortName: -> @data.short_name


module.exports = FitnessLevel
