class Profile
  constructor: ->
    @first_name       = ko.observable("")
    @surname          = ko.observable("")
    @image            = ko.observable("")
    @age              = ko.observable("")
    @gender           = ko.observable("")
    @address          = ko.observable("")
    @title            = ko.observable("")
    @maritalStatus    = ko.observable("")
    @email            = ko.observable("")
    @phone            = ko.observable("")
    @job              = ko.observable("")
    @household_size   = ko.observable("")
    @employment_status = ko.observable("")
    @industry         = ko.observable("")

    @motor            = InsureMe.InsuredObjectFactory.motor()
    @home             = InsureMe.InsuredObjectFactory.home()
    @life             = InsureMe.InsuredObjectFactory.life()

    @pricing          = new InsureMe.Pricing(this)

    @image_large      = ko.computed => @image() + "?type=large"
    
    @load_data()

  load_data: ->
    $.getJSON "/api/profile", (data) =>
      @apply_data(data)

  apply_data: (data) ->
    @first_name(data['first_name'])
    @surname(data['surname'])
    @image(data['image'])
    @email(data['email'])

window.InsureMe = window.InsureMe || {};
window.InsureMe.Profile = Profile