# encoding: utf-8

class User < ActiveRecord::Base

  # Including strong_parameters gem
  include ActiveModel::ForbiddenAttributesProtection

  ##
  # Validations
  validates_uniqueness_of :email

  ##
  # Relationships

  # Уг хэрэглэгчийн устгахад authentications-д нь цуг устгагдана
  has_many :authentications, dependent: :destroy

  # Уг хэрэглэгч ADMIN эсэхийг шалгаж байна
  def is_admin?
    role == ROLE_ADMIN
  end

  # Уг хэрэглэгч USER эсэхийг шалгаж байна
  def is_user?
    role == ROLE_USER
  end
end
