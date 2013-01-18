# encoding: utf-8

class Authentication < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :uid, :provider

  ##
  # Relationships
  belongs_to :user

  rails_admin do
    configure :user, :belongs_to_association

    list do
      field :email
      field :provider
      field :uid
      field :user
    end
  end

end
