# encoding: utf-8

class Screencast < ActiveRecord::Base

  ##
  # Validations
  validates :content, :title, :url, presence: true

  ##
  # Recent
  scope :recent, order("created_at DESC")

  ##
  # Taggable
  acts_as_taggable

  rails_admin do
    configure :title, :string
    configure :content, :text
    configure :url, :string
    configure :starts_at, :datetime

    list do
      field :title
      field :content
      field :starts_at
    end

    edit do
      field :title
      field :url
      field :starts_at
      field :content, :text do
        bootstrap_wysihtml5 true
      end
    end
  end
end
