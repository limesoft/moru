# encoding: utf-8

class Event < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content

end
