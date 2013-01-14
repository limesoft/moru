jQuery ->
  if $('#rsvp_going').length > 0
	  $('#rsvp_going').dropkick(
      change: (value, label)->
        $("#new_rsvp").submit() if parseInt(value) > 0
    )

		$("#container").masonry 
				itemSelector: ".box", gutterWidth: 60,
				layoutPriorities: { upperPosition: 1, shelfOrder: 1}


		# hide #back-top first
		$("#back-top").hide()

		# fade in #back-top
		$ ->
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




