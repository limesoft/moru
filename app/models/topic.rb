# encoding: utf-8

class Topic < ActiveRecord::Base

  attr_reader :type

  ##
  # Relationships
  belongs_to :user
  belongs_to :speaker, class_name: 'User'
  belongs_to :event

  ##
  # Validations
  validates :content, presence: true, length: { in: 100..1000 }
  validates :title, presence: true, length: { in: 3..100 }

  acts_as_votable

  def avg_votes
    cached_votes_up-cached_votes_down
  end

  rails_admin do
    configure :user, :belongs_to_association
    configure :speaker, :belongs_to_association

    list do
      field :title
      field :user
      field :speaker
    end

    edit do
      field :title
      field :content
      field :user
      field :speaker
    end
  end

end
