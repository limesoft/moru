# encoding: utf-8

class User < ActiveRecord::Base
  attr_accessible :email, :name

  ##
  # Validatetions

  # Э-шуудан давхардах ёсгүй
  validates_uniqueness_of :email
end
