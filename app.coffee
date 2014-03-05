"use strict"

$ ->
  $("input").focus()
  $("form").on "submit", (event) ->
    alert "You are a motherfucker."
    event.preventDefault()

    searchTerm  = $("input").val()

    movieData = $.ajax
      url: "http://www.omdbapi.com"
      method: "get"
      data: { s: searchTerm }
      dataType: "json"

    movieData.done (data) ->
      $("input").val("")
      $(".result").html("")

      for movie in data["Search"]
        li = $ "<li data-imdbid='" + movie.imdbID + "'>" + movie.Title + "</li>"
        $(".result").append(li)

    $(".result").delegate "li", "click", (event) ->

      movieId = @.dataset.imdbid
      movieInfo = $.ajax
        url: "http://www.omdbapi.com"
        method: "get"
        data: { i: movieId }
        dataType: "json"

      fuckText = ["Fuck you.",
                  "Go fuck yourself.",
                  "DIAF",
                  "You little fuck nugget.",
                  "Holy shit fuck.",
                  "These results aren't even correct.",
                  "Why the fuck are you still here?",
                  "You're kind of dumb, aren't you?",
                  "Fucking cracker.",
                  "I hate you.",
                  "I fucking hate you."
                ]

      num = Math.floor((Math.random()*10)+1)

      alert fuckText[num]

      movieInfo.done (data) ->
        if data["Poster"] == "N/A"
          $("img").remove()
          img = $ "<img src='" + "http://www.mnit.ac.in/new/PortalProfile/images/faculty/noimage.jpg" + "'></img>"
          $(".result").append(img)
        else
          $("img").remove()
          img = $ "<img src='" + data["Poster"] + "'></img>"
          $(".result").append(img)

