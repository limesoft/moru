# encoding: utf-8

class Comment < ActiveRecord::Base

  ##
  # Validations
  validates :content, presence: true, length: { in: 3..500 }

  ##
  # Relationships
  belongs_to :commentable, polymorphic: true, counter_cache: true, inverse_of: :comments
  belongs_to :user

  rails_admin do
    list do
      field :user
      field :commentable
      field :content
      field :created_at
    end
  end
end
