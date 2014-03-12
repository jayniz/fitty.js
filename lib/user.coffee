class User
  constructor: (@data) ->
  api_key: -> @data.api_keys[0].key

  api_key:            -> @data.api_keys[0].key
  confirmed:          -> !!@data.confirmed
  email:              -> @data.email
  id:                 -> @data.id
  prefs: ()           -> @fetchPrefs()
  username:           -> @data.username
  username_literal:   -> @data.username_literal
  workouts: ()        -> @fetchWorkouts()


  deletedWorkouts: (value) ->
    Fitty.Api.get(this, "/users/me/deleted_workouts")

  fetchWorkouts: () ->
    Fitty.Api.get(this, "/users/#{@username()}/workouts")

  fetchPrefs: () ->
    Fitty.Api.get(this, "/users/me/prefs")

  profileVisibility: (value) ->
    if value
      value.changed_at ?= +new Date()
      Fitty.Api.put(this, "/users/me/profile_visibility", value)
    else
      Fitty.Api.get(this, "/users/#{@username()}/profile_visibility")

  muscleGroups: (value) ->
    if value
      value.changed_at ?= +new Date()
      Fitty.Api.put(this, "/users/me/muscle_groups", value)
    else
      Fitty.Api.get(this, "/users/#{@username()}/muscle_groups")

  profile: (value) ->
    if value
      Fitty.Api.patch(this, "/users/me", value)
        .then((d) => @data = d)
    else
      @data

  saveWorkout: (workout) ->
    if id = workout.id
      Fitty.Api.put(this, "/workouts/#{id}", workout)
    else
      Fitty.Api.post(this, "/workouts", workout)

  deleteWorkout: (workout) ->
    Fitty.Api.delete(this, "/workouts/#{workout.id}", workout)

  refresh: ->
    Fitty.Api.get(this, "/users/me").then (d) => @data = d



User.current = -> Fitty._currentUser

module.exports = User
