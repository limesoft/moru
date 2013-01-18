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
    configure :user, :belongs_to_association
    configure :event, :belongs_to_association

    configure :going, :integer

    list do
      field :going
      field :user
      field :event
    end
  end
end
