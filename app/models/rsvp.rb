# encoding: utf-8

class Rsvp < ActiveRecord::Base

  ##
  # Validations
  validates_inclusion_of :going, in: RSVPS, allow_blank: false, allow_nil: false

  ##
  # Relationships
  belongs_to :user
  belongs_to :event
end
