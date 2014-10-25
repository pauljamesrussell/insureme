# Bad Programming, but given this is a hack event, I feel justified. Worth fixing for real life.
class InsuredObjectFactory
  @motor: ->
    new InsureMe.InsuredObject('motor',['reg_number','drivers_licence_number'])


window.InsureMe = window.InsureMe || {};
window.InsureMe.InsuredObjectFactory = InsuredObjectFactory