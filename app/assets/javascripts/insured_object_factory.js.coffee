# Bad Programming, but given this is a hack event, I feel justified. Worth fixing for real life.
class InsuredObjectFactory
  @motor: ->
    motor = new InsureMe.InsuredObject('motor',['reg_number','drivers_licence_number','cover_level','number_cars'])
    motor.number_cars("my car")
    motor.cover_level("comprehensive")
    return motor


window.InsureMe = window.InsureMe || {};
window.InsureMe.InsuredObjectFactory = InsuredObjectFactory