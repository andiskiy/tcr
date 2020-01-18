window.Tcr = {}

require('./dashboard')

class Tcr.App
  @init: ->
    Tcr.Dashboard.init()

$(document).on 'turbolinks:load', ->
  Tcr.App.init()
