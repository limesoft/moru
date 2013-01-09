jQuery ->
  if $('#rsvp_going').length > 0
	  $('#rsvp_going').dropkick(
      change: (value, label)->
        $("#new_rsvp").submit() if parseInt(value) > 0
    )
