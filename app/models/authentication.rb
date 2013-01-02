# encoding: utf-8

class Authentication < ActiveRecord::Base

  # Including strong_parameters gem
  include ActiveModel::ForbiddenAttributesProtection

  belongs_to :user
end
