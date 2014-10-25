class Profile
  constructor: ->
    @first_name       = ko.observable("")
    @surname          = ko.observable("")
    @image            = ko.observable("")
    @age              = ko.observable("")
    @gender           = ko.observable("")
    @address          = ko.observable("")
    @maritalStatus    = ko.observable("")
    @email            = ko.observable("")
    @phone            = ko.observable("")
    @job              = ko.observable("")
    @household_size   = ko.observable("")

    @motor            = InsureMe.InsuredObjectFactory.motor()

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