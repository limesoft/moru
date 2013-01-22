# encoding: utf-8

class Feedback < ActiveRecord::Base

  belongs_to :user

  rails_admin do
    configure :user, :belongs_to_association

    list do
      field :user
      field :content
      field :created_at
    end
  end

end
