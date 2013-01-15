# encoding: utf-8

class Topic < ActiveRecord::Base

  attr_reader :type

  ##
  # Relationships
  belongs_to :user
  belongs_to :speaker, class_name: 'User'

  ##
  # Validations
  validates :content, presence: true, length: { in: 3...500 }

end
