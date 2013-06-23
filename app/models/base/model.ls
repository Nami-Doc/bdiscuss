Chaplin = require 'chaplin'

module.exports = class Model extends Chaplin.Model
  # currently, only emulated through app/assets LEL
  force-ext: true
  api-root: "/api/"

  url-key: 'id'

  url-path: -> ''

  url-params: -> {}

  url-root: ->
    url-path = @url-path!

    if url-path
      @apiRoot + url-path
    else if @collection
      @collection.url!
    else
      throw new Error 'Model must redefine url-path'

  url: (data = '') ->
    base = @url-root!
    
    full = if @get(@urlKey)?
      base + encodeURIComponent(that) + data
    else
      base + data

    sep = if full.indexOf('?') >= 0 then '&' else '?'
    params = @url-params!
    payload = ["#k=#v" for v, k in params when v?] * '&'

    if @force-ext
      full += ".json"

    if payload
      full + sep + payload
    else
      full