# encoding: utf-8

module GoingContext

  def count_going
    count_rsvp RSVP_YES
  end

  def count_maybe
    count_rsvp RSVP_MAYBE
  end

  def count_not_going
    count_rsvp RSVP_NO
  end

  def count_rsvp(rsvp)
    rsvps.where('going=?', rsvp).size
  end

  def find_goings
    rsvps.where('going=?', RSVP_YES)
  end
end
