# encoding: utf-8

class Comment < ActiveRecord::Base

  ##
  # Validations
  validates :content, presence: true, length: { in: 3..100 }

  ##
  # Relationships
  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user

  rails_admin do
    configure :user_id, :integer
    configure :content, :text
    configure :created_at, :datetime
    configure :commentable_id, :integer

    list do
      field :user_id
      field :content
      field :created_at
      field :commentable_id
    end
  end
end
