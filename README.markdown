Fitty.js - Everything returns a promise!
========================================

Initialize
----------

```coffee
Fitty.app_token - "3842289839a948d9e99f939382"
```

On how to obtain an app_token, please consult
[the docs](http://docs.fitty.apiary.io/).


Enable debug output
--------------------------------------

```coffee
Fitty.Api.debug - true
```

This tells fitty.js to log every request it makes to the console,
in ready to use curl commands you can paste to your terminal to
try out stuff in more detail.


Sign up
-------

```coffee
Fitty.signUp(
  username: 'foo'
  email: 'foo@bar.de'
  password: 'geh heim'
  password_confirmation: 'geh heim'
)
```


Obtain api key by login and password
------------------------------------

```coffee
Fitty.signIn('user', 'password')
```

You can provide the username or email address.


Store the current user somewhere
-------------------------------

```coffee
user = Fitty.currentUser()
```


Restore an old session
----------------------
```coffee

# Store your stuff
persist_this_somewhere = Fitty.currentUser().data

# Then, at a later time

Fitty.restoreSession(persist_this_somewhere)
```


Fetch user's profile visibility
------------------------------

```coffee
user.profileVisibility()
```


Set user's profile to private
-----------------------------

```coffee
user.profileVisibility(value: 'visible')
```


Fetch muscle groups
-------------------

```coffee
user.muscleGroups()
```


Set muscle groups
-----------------

```coffee
user.muscleGroups(value: {'Pull ups': 1})
```


Fetch user's profile
--------------------

```coffee
  user.profile()
```


Set user's profile
------------------

```coffee
user.profile(
  username_literal: 'My Fancy Name'
  password: 'new    password optional'
  password_confirmation: 'new_password_optional'
).then(-> alert('oh hi'))

```


Fetch all user's workouts
-------------------------

```coffee
workouts - user.workouts()
```

Returns a promise that will give you an array of hashes)


Save or create a workout
------------------------

```coffee
user.saveWorkout(data)
```

If data contains an id field, it will be PUT to
update, otherwise it will be created via POST


Delete a workout
----------------

```coffee
user.deleteWorkout(data)
```


Rebuild
=======
run `gulp` and that's it.


Test
====

I don't know how you people do stuff in the javascript world,
so I just incuded Q in this library and the tests are just a file
I open in the browser to see if everything still works OK. it runs
against a locally running API, so the tests are likely useless to you.

Then again, I would be surprised if anybody read until here, so I might
as well just give you a gif because you made it here.

![](https://dl.dropboxusercontent.com/u/1953503/gifs/GKUHK.gif)

