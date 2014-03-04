"use strict"

$ ->
  # alert "test"

  $("form").on "submit", (event) ->
    event.preventDefault()

    searchTerm = $("input").val()

# Boilerplate Code

    $.ajax
      url: "http://www.omdbapi.com/?"
      method: "get"
      data: {s: searchTerm}
      dataType: "json"

#

