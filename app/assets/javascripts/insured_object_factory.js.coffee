# Bad Programming, but given this is a hack event, I feel justified. Worth fixing for real life.
class InsuredObjectFactory
  @motor: ->
    motor = new InsureMe.InsuredObject('motor',['reg_number','drivers_licence_number','cover_level','number_cars'])
    motor.number_cars("my car")
    motor.cover_level("comprehensive")
    return motor

  @home: ->
    home = new InsureMe.InsuredObject('home',['cover_level','property','ownership','occupied','claims'])
    home.claims("0")
    return home

  @travel: ->
    travel = new InsureMe.InsuredObject('travel',['cover_level','areaOfTravel','startDate','endDate'])
    return travel
  @life: ->
    life = new InsureMe.InsuredObject('life',['cover_type','cover_level','term','smoker','medical_conditions'])
    return life


window.InsureMe = window.InsureMe || {};
window.InsureMe.InsuredObjectFactory = InsuredObjectFactory