# encoding: utf-8

class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  # :registerable, recoverable,
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  rails_admin do
    list do
      field :email
      field :created_at
    end

    edit do
      field :email
      field :password
      field :password_confirmation
    end
  end
end
