# XMLHttpRequest = require('xhr2')

FittyApi = {}
FittyApi.Q = require('q')

FittyApi.createHttpRequest = ->
  new XMLHttpRequest()

FittyApi.send = (user, method, url, data) ->
  url = FittyApi.urlize(user, url)
  if FittyApi.debug
    curlData = if data then "-d'#{JSON.stringify(data)}' " else ''
    console.log "curl -v -X#{method} -H'Content-Type: application/json' -H'Accept: application/json' #{curlData}#{url}"
  defer = FittyApi.Q.defer()
  client = FittyApi.createHttpRequest()
  client.open(method, url)
  client.setRequestHeader("Content-Type", "application/json")
  client.setRequestHeader("Accept",       "application/json")
  client.onload = (r) ->
    data = JSON.parse(@responseText)
    console.log "Response for #{method} #{curlData}#{url}: #{@status} #{@responseText}" if FittyApi.debug
    if parseInt(@status) >= 200 and parseInt(@status) < 400
      defer.resolve(data)
    else
      defer.reject(error: @status, data: data)
  client.onerror = (r) ->
    console.log "Response for #{method} #{url}: #{@status}" if FittyApi.debug
    data = null
    try data = JSON.parse(@responseText)
    defer.reject(error: @status, data: data)
  if data?
    client.send(JSON.stringify(data))
  else
    client.send()
  defer.promise


FittyApi.get = (user, url) ->
  FittyApi.send(user, 'GET', url, null)


FittyApi.post = (user, url, data) ->
  FittyApi.send(user, 'POST', url, data)


FittyApi.put = (user, url, data) ->
  FittyApi.send(user, 'PUT', url, data)


FittyApi.patch = (user, url, data) ->
  FittyApi.send(user, 'PATCH', url, data)


FittyApi.delete = (user, url) ->
  FittyApi.send(user, 'DELETE', url, null)


FittyApi.urlize = (user, url) ->
  delim = if url.indexOf("?") < 0 then "?" else "&"
  out = Fitty.api + url + delim + "app_token=#{Fitty.app_token}"
  out+= "&api_key=#{user.api_key()}" if user?
  out

module.exports = FittyApi
