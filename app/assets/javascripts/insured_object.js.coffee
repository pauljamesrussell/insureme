class InsuredObject
  constructor: (type,attributes) ->
    @enabled      = ko.observable(false)
    @type         = ko.observable(type)

    @add_attribute(attribute) for attribute in attributes

  add_attribute: (attribute) ->
    @[attribute]  = ko.observable();


window.InsureMe = window.InsureMe || {};
window.InsureMe.InsuredObject = InsuredObject