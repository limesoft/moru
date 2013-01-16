# encoding: utf-8

class Event < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content, :date

  ##
  # Relationships
  has_many :comments, as: :commentable, dependent: :destroy

  # RSVP
  has_many :rsvps, dependent: :destroy
  has_many :users, through: :rsvps

end
