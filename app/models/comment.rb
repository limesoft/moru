# encoding: utf-8

class Comment < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :content

  ##
  # Relationships
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
