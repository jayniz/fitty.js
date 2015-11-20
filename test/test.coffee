asyncTest "asynchronous test: video ready to play", ->
  expect( 1 )
Fitty.api = "http://api.dev.fitty.co"
Fitty.app_token = '76560431e7da48bda286a1c7677c3ca9'
Fitty.Api.debug = true

asyncTest "log in with a wrong password throws a 401",
  expect(1)
  Fitty.signIn('username', 'wrong password')
    .catch (d) ->
      equal(d.error, "foo bar", "responds the correct message")
      start()
