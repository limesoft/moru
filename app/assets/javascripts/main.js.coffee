jQuery ->
  if $('#rsvp_going').length > 0
	  $('#rsvp_going').dropkick(
      change: (value, label)->
        $("#new_rsvp").submit() if parseInt(value) > 0
    )

  if $('#event-list').length > 0
    $("#event-list").masonry(
                            itemSelector: ".box"
                            , gutterWidth: 60
                            , layoutPriorities: { upperPosition: 1, shelfOrder: 1}
                            , isAnimated: true
                            )
    $("#back-top").hide()
    # fade in #back-top
    $(window).scroll ->
      if $(this).scrollTop() > 400
        $("#back-top").fadeIn()
      else
        $("#back-top").fadeOut()
   	
    # scroll body to 0px on click
    $("#back-top a").click ->
      $("body,html").animate
        scrollTop: 0
      , 800
      false

  if $('#topic-list').length > 0
    $("#topic-list").masonry(
                            itemSelector: ".topic-item"
                            , gutterWidth: 40
                            , layoutPriorities: { upperPosition: 1, shelfOrder: 1}
                            , isAnimated: true
                            )    

@infinity_pagination = (url, number_of_pages)->
  page = 1
  loading = false
  w = $(window)
  w.scroll( ->
    return if loading
    if w.scrollTop() > ($(document).height()-w.height()-5) && page <= number_of_pages
      loading = true
      page += 1
      $.getScript(url+"?page="+page, ()->
        loading = false
      )
  )
  w.scroll()





