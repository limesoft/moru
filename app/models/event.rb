# encoding: utf-8

class Event < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content, :date

  ##
  # Relationships
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :with_going, class_name: 'Rsvp', conditions: ['going=?', RSVP_YES], include: :user

  # RSVP
  has_many :rsvps, dependent: :destroy
  has_many :users, through: :rsvps

end
