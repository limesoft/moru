# encoding: utf-8

class User < ActiveRecord::Base

  # Including strong_parameters gem
  include ActiveModel::ForbiddenAttributesProtection

  ##
  # Validatetions

  # Э-шуудан давхардах ёсгүй
  validates_uniqueness_of :email

  ##
  # Relationships

  # Уг хэрэглэгчийн устгахад authentications-д нь цуг устгагдана
  has_many :authentications, dependent: :destroy
end
