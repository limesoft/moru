# encoding: utf-8

class Event < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content

  ##
  # Relationships
  has_many :comments, dependent: :destroy

  # RSVP
  has_many :rsvps, dependent: :destroy
  has_many :users, through: :rsvps

end
