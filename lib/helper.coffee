Helper = {}

Helper.nameByLanguage = (names, lang) ->
  Fitty.Helper.byLanguage(names, lang).name

Helper.byLanguage = (array, lang) ->
  if not array instanceof Array
    console.log JSON.stringify(array)
  fallback = {}
  filtered = (array || []).filter (l) ->
    fallback = l if l.language.code == 'en'
    l.language.code == lang
  filtered[0] || fallback

module.exports = Helper
