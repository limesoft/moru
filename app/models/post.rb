# encoding: utf-8

class Post < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content

  ##
  # Relationships
  has_many :comments, as: :commentable, dependent: :destroy

end
