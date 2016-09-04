Fitty = {}
Fitty.Helper          = require './helper'
Fitty.FitnessLevel    = require './fitness_level'
Fitty.Exercise        = require './exercise'
Fitty.Day             = require './day'
Fitty.Plan            = require './plan'
Fitty.PlanCategory    = require './plan_category'
Fitty.Api             = require './api'
Fitty.User            = require './user'
Fitty.Workout         = require './workout'
Fitty.MuscleGroup     = require './muscle_group'
Fitty.MuscleSubGroup  = require './muscle_sub_group'

Fitty.api = 'https://fitty.global.ssl.fastly.net'

Fitty.signIn = (login, password) ->
  user = {login: login, password: password}
  Fitty.Api.post(null, "/users/sign_in", {user})
    .then((d) -> Fitty.restoreSession(d))

Fitty.signOut = -> delete Fitty._currentUser

Fitty.restoreSession = (data) ->
  Fitty._currentUser = new Fitty.User(data)

Fitty.signUp = (data) ->
  Fitty.Api.post(null, "/users", {user: data})
    .then((d) -> Fitty.restoreSession(d))

Fitty.resetPassword = (login) ->
  Fitty.Api.post(null, "/users/password", {user: {login: login}})


console.log "Fitty loaded"

module.exports = Fitty
