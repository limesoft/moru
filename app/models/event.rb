# encoding: utf-8

class Event < ActiveRecord::Base

  ##
  # Validations
  validates_presence_of :title, :content, :date

  ##
  # Relationships
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :with_going, class_name: 'Rsvp', conditions: ['going=?', RSVP_YES], include: :user

  # RSVP
  has_many :rsvps, dependent: :destroy
  has_many :users, through: :rsvps
  has_many :topics


  rails_admin do
    configure :title, :string
    configure :content, :text
    configure :date, :datetime
    configure :comments_count, :integer

    list do
      field :title
      field :content
      field :date
      field :comments_count
    end
  end

end
