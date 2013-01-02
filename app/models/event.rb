# encoding: utf-8

class Event < ActiveRecord::Base

  # Including strong_parameters gem
  include ActiveModel::ForbiddenAttributesProtection

  ##
  # Validations
  validates_presence_of :title, :content

end
