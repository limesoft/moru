# encoding: utf-8

class Authentication < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :uid, :provider

  ##
  # Relationships
  belongs_to :user

end
