# encoding: utf-8

class Topic < ActiveRecord::Base

  attr_reader :type

  ##
  # Relationships
  belongs_to :user
  belongs_to :speaker, class_name: 'User'
  belongs_to :event

  ##
  # Validations
  validates :content, presence: true, length: { in: 100..1000 }
  validates :title, presence: true, length: { in: 3..100 }

end
