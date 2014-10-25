class Profile
  constructor: ->
    @first_name       = ko.observable()
    @surname          = ko.observable()
    @image            = ko.observable()
    @age              = ko.observable()
    @gender           = ko.observable()
    @address          = ko.observable()
    @maritalStatus    = ko.observable()


    @image_large      = ko.computed => @image() + "?type=large"
    
    @load_data()

  load_data: ->
    $.getJSON "/api/profile", (data) =>
      @apply_data(data)

  apply_data: (data) ->
    @first_name(data['first_name'])
    @surname(data['surname'])
    @image(data['image'])

window.InsureMe = window.InsureMe || {};
window.InsureMe.Profile = Profile