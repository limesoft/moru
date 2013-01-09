jQuery ->
  if $('#rsvp_going').length > 0
	  $('#rsvp_going').dropkick(
      change: (value, label)->
        v = parseInt value
        if v > 0
          $("#new_rsvp").submit()
    )
