# encoding: utf-8

class Post < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content

  ##
  # Relationships
  has_many :comments, as: :commentable, dependent: :destroy, inverse_of: :commentable
  belongs_to :user

  rails_admin do

    configure :comments, :has_many_association
    configure :user, :belongs_to_association

    list do
      field :title
      field :user
      field :comments_count
      field :created_at
    end

    edit do
      field :title
      field :user
      field :content, :text do
        bootstrap_wysihtml5 true
      end
      field :comments
    end
  end
end
