Fitty = {}
Fitty.Api     = require './api'
Fitty.User    = require './user'
Fitty.Workout = require './workout'

Fitty._api = 'https://api.fitty.co'
Fitty._app_token = '76560431e7da48bda286a1c7677c3ca9'

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
