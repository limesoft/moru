# encoding: utf-8

class Comment < ActiveRecord::Base

  ##
  # Validations
  validates :content, presence: true, length: { in: 3..100 }

  ##
  # Relationships
  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user
end
