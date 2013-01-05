# encoding: utf-8

class Comment < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :content

  ##
  # Relationships
  belongs_to :event
  belongs_to :user
end
