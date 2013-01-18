# encoding: utf-8

class Post < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content

  ##
  # Relationships
  has_many :comments, as: :commentable, dependent: :destroy, inverse_of: :commentable

  rails_admin do

    configure :comments, :has_many_association

    list do
      field :title
      field :content
      field :user_id
      field :created_at
      field :comments
    end

    edit do
      field :title
      field :content, :text do
        bootstrap_wysihtml5 true
      end
      field :comments
    end
  end
end
