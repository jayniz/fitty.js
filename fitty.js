/***
 *
 * Fitty.js - Everything returns a promise!
 * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *
 * Enable debug output with curl commands
 * ======================================
 *
 *   Fitty.Api.debug = true
 *
 *
 * Sign up
 * =======
 *
 *   Fitty.signUp(
 *     username: 'foo'
 *     email: 'foo@bar.de'
 *     password: 'geh heim'
 *     password_confirmation: 'geh heim'
 *   )
 *
 * Obtain api key by login and password
 * ====================================
 *
 *   Fitty.signIn('user', 'password')
 *
 * You can provide the username or email address.
 *
 *
 * Store the current user somewhere
 * ===============================
 *
 * user = Fitty.currentUser()
 *
 *
 * Fetch user's profile visibility
 * ==============================
 *
 * user.profileVisibility()
 *
 *
 * Set user's profile to private
 * =============================
 *
 * user.profileVisibility(value: 'visible')
 *
 *
 * Fetch muscle groups
 * ===================
 *
 * user.muscleGroups()
 *
 *
 * Set muscle groups
 * ================
 *
 * user.muscleGroups(value: {'Pull ups': 1})
 *
 *
 * Fetch user's profile
 * ====================
 *
 *   user.profile()
 *
 *
 * Set user's profile
 * =================
 *
 *   user.profile({
 *   	 username_literal: 'My Fancy Name',
 *   	 password: 'new password optional',
 *   	 password_confirmation: 'new_password_optional'
 *   }, successHandler, errorHandler)
 *
 *
 * Fetch all user's workouts
 * ========================
 *
 *   workouts = user.workouts()
 *
 * Returns a promise that will give you an array of hashes)
 *
 *
 * Save or create a workout
 * ========================
 *
 *   user.saveWorkout(data)
 *
 * If data contains an id field, it will be PUT to
 * update, otherwise it will be created via POST
 *
 *
 * Delete a workout
 * ===============
 *   user.deleteWorkout(data)
 *
 **/
Fitty = require('./lib/fitty');
