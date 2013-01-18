# encoding: utf-8

class User < ActiveRecord::Base

  ##
  # Validations
  validates_inclusion_of :role, in: ROLES

  ##
  # Relationships
  has_many :authentications, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :assigned_topics, class_name: 'Topic', foreign_key: 'speaker_id', dependent: :nullify

  # RSVP
  has_many :rsvps, dependent: :destroy
  has_many :events, through: :rsvps

  acts_as_voter

  def default_avatar
    authentications.first.avatar
  end

  def rsvp_of(event)
    rsvps.where(event_id: event.id).first
  end

  # Уг хэрэглэгч ADMIN эсэхийг шалгаж байна
  def admin?
    role == ROLE_ADMIN
  end

  # Уг хэрэглэгч USER эсэхийг шалгаж байна
  def user?
    role == ROLE_USER
  end

  rails_admin do

    configure :authentications, :has_many_association 

    list do
      field :name
      field :role
      field :created_at
      field :authentications
    end
  end
end
