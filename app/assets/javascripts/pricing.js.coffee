class Pricing

  constructor: (profile) ->
    @profile        = profile
    @total_premium  = ko.computed(@_total_premium,this)
    @saving         = ko.computed(@_saving,this)
    @premium        = ko.computed(@_premium,this)
    @saving_percent = ko.computed(@_saving_percent,this)

  number_of_products: ->
    enabled = 0
    enabled = enabled + 1 if @profile.home.enabled()
    enabled = enabled + 1 if @profile.motor.enabled()
    enabled = enabled + 1 if @profile.life.enabled()
    enabled = enabled + 1 if @profile.travel.enabled()
    console.log("number_of_products",enabled)
    return enabled

  _total_premium: ->
    total = 0
    total = total + (235/12) if @profile.home.enabled()
    total = total + (585/12) if @profile.motor.enabled()
    total = total + (324/12) if @profile.life.enabled()
    total = total + (24/12) if @profile.travel.enabled()
    console.log("total_premium",total)
    return total.toFixed(2)

  _premium: ->
    (@total_premium() - @saving()).toFixed(2)

  _saving: ->
    discounts = [0,0,0.10,0.12,0.14,0.16,0.18,0.20]
    discount = discounts[@number_of_products()]
    saving = @total_premium() * (discount)
    console.log("discount",discount,"saving", saving)
    return saving.toFixed(2)


  _saving_percent: ->
    if @premium() > 0
      Math.round((@saving() / @total_premium()) * 100)
    else
      0

window.InsureMe = window.InsureMe || {};
window.InsureMe.Pricing = Pricing