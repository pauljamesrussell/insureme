class Pricing
  constructor: (profile) ->
    @profile        = profile
    @saving         = ko.computed(@_saving,this)
    @premium        = ko.computed(@_premium,this)
    @saving_percent = ko.computed(@_saving_percent,this)

  _premium: ->
    20.00
  _saving: ->
    10.00

  _saving_percent: ->
    if @premium() > 0
      total = (@premium() + @saving())
      Math.round((@saving() / total) * 100)
    else
      0

window.InsureMe = window.InsureMe || {};
window.InsureMe.Pricing = Pricing