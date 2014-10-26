# Bad Programming, but given this is a hack event, I feel justified. Worth fixing for real life.
class InsuredObjectFactory
  @motor: ->
    motor = new InsureMe.InsuredObject('motor',['reg_number','drivers_licence_number','cover_level','number_cars'])
    motor.number_cars("my car")
    motor.cover_level("comprehensive")
    motor.reg_number("AO59 TXU")
    return motor

  @home: ->
    home = new InsureMe.InsuredObject('home',['cover_level','property','ownership','occupied','claims'])
    home.cover_level("building_and_contents")
    home.property("main_home")
    home.ownership("mortgage")
    home.claims("0")
    return home

  @travel: ->
    travel = new InsureMe.InsuredObject('travel',['cover_level','areaOfTravel','startDate','endDate'])
    travel.cover_level("BasicCover")
    travel.areaOfTravel('WorldwideInclUSACanadaCaribbean')
    travel.startDate("27/10/2014")
    travel.endDate("forever")
    return travel

  @life: ->
    life = new InsureMe.InsuredObject('life',['cover_type','cover_level','term','smoker','medical_conditions'])
    life.cover_type('term_mort')
    life.cover_level('150000')
    life.term(25)
    life.smoker('no')
    life.medical_conditions('no')
    return life


window.InsureMe = window.InsureMe || {};
window.InsureMe.InsuredObjectFactory = InsuredObjectFactory