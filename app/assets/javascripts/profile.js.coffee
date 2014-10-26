class Profile
  constructor: ->
    @first_name       = ko.observable("")
    @surname          = ko.observable("")
    @image            = ko.observable("")
    @age              = ko.observable("35")
    @gender           = ko.observable("male")
    @address          = ko.observable("35 Anystreet, EC01 1AA")
    @title            = ko.observable("Mr")
    @maritalStatus    = ko.observable("married")
    @email            = ko.observable("")
    @phone            = ko.observable("07810 822842")
    @job              = ko.observable("IT Manager")
    @household_size   = ko.observable("")
    @employment_status = ko.observable("employed")
    @industry         = ko.observable("Insurance")

    @motor            = InsureMe.InsuredObjectFactory.motor()
    @home             = InsureMe.InsuredObjectFactory.home()
    @travel           = InsureMe.InsuredObjectFactory.travel()
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