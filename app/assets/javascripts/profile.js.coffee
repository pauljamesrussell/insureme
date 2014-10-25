class Profile
  constructor: ->
    @first_name       = ko.observable()
    @surname          = ko.observable()
    @image            = ko.observable()
    
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