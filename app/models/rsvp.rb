# encoding: utf-8

class Rsvp < ActiveRecord::Base

  ##
  # Validations
  validates_inclusion_of :going, in: RSVPS, allow_blank: false, allow_nil: false
  validates_uniqueness_of :user_id, scope: [:event_id]

  ##
  # Relationships
  belongs_to :user
  belongs_to :event

  rails_admin do
    configure :going, :integer
    configure :user_id, :integer
    configure :event_id, :integer

    list do
      field :going
      field :user_id
      field :event_id
    end
  end
end
