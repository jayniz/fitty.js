Fitty.js - Everything returns a promise!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enable debug output with curl commands
======================================

```coffee
Fitty.Api.debug = true
```


Sign up
=======

```coffee
Fitty.signUp(
  username: 'foo'
  email: 'foo@bar.de'
  password: 'geh heim'
  password_confirmation: 'geh heim'
)
```

Obtain api key by login and password
====================================

```coffee
Fitty.signIn('user', 'password')
```

You can provide the username or email address.


Store the current user somewhere
===============================

```coffee
user = Fitty.currentUser()
```


Fetch user's profile visibility
==============================

```coffee
user.profileVisibility()
```


Set user's profile to private
=============================

```coffee
user.profileVisibility(value: 'visible')
```


Fetch muscle groups
===================

```coffee
user.muscleGroups()
```


Set muscle groups
================

```coffee
user.muscleGroups(value: {'Pull ups': 1})
```


Fetch user's profile
====================

```coffee
  user.profile()
```


Set user's profile
=================

```coffee
user.profile(
  username_literal: 'My Fancy Name'
  password: 'new    password optional'
  password_confirmation: 'new_password_optional'
).then(-> alert('oh hi'))

```


Fetch all user's workouts
========================

```coffee
workouts = user.workouts()
```

Returns a promise that will give you an array of hashes)


Save or create a workout
========================

```coffee
user.saveWorkout(data)
```

If data contains an id field, it will be PUT to
update, otherwise it will be created via POST


Delete a workout
===============

```coffee
user.deleteWorkout(data)
```


Rebuild
=======
run "gulp"