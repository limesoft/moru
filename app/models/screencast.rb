# encoding: utf-8

class Screencast < ActiveRecord::Base

  ##
  # Validations
  validates :content, :title, :url, :state, presence: true
  validates_inclusion_of :state, in: STATES

  ##
  # Relationships
  has_many :comments, as: :commentable, dependent: :destroy, inverse_of: :commentable
  belongs_to :user

  ##
  # Recent
  scope :recent, order("created_at DESC")

  ##
  # Taggable
  acts_as_taggable

  ##
  # state хувьсагчид төрмөлөөр STATE_FREE-г оноож өгнө
  after_initialize do
    self.state ||= STATE_FREE if new_record?
  end

  rails_admin do
    configure :comments, :has_many_association
    configure :user, :belongs_to_association
    configure :title, :string
    configure :content, :text
    configure :url, :string
    configure :image_url, :string
    configure :starts_at, :datetime
    configure :ends_at, :datetime
    configure :comments_count, :integer

    list do
      field :user
      field :state
      field :title
      field :content
      field :comments_count
    end

    edit do
      field :title
      field :url
      field :image_url
      field :user
      field :starts_at
      field :ends_at
      field :state, :enum do
        enum { STATES }
      end
      field :content, :text do
        bootstrap_wysihtml5 true
      end
      field :comments
    end
  end
end
