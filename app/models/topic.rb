# encoding: utf-8

class Topic < ActiveRecord::Base

  attr_reader :type

  ##
  # Relationships
  belongs_to :user
  belongs_to :speaker, class_name: 'User'
  belongs_to :event
  has_many :comments, as: :commentable, dependent: :destroy, inverse_of: :commentable

  ##
  # Validations
  validates :content, presence: true, length: { in: 50..1000 }
  validates :title, presence: true, length: { in: 2..100 }

  acts_as_votable

  def avg_votes
    cached_votes_up-cached_votes_down
  end

  rails_admin do
    configure :comments, :has_many_association
    configure :user, :belongs_to_association
    configure :speaker, :belongs_to_association
    configure :comments_count, :integer


    list do
      field :title
      field :user
      field :speaker
      field :comments_count
    end

    edit do
      field :title
      field :content
      field :user
      field :speaker
    end
  end

end
