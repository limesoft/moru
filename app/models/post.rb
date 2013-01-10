# encoding: utf-8

class Post < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content

end
