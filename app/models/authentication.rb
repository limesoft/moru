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
    configure :provider, :string
    configure :uid, :string
    configure :user_id, :integer
    configure :email, :string

    list do
      field :email
      field :provider
      field :uid
      field :user_id
    end
  end

end
