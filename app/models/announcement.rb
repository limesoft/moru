# encoding: utf-8

class Announcement < ActiveRecord::Base
  # attr_accessible :ends_at, :message, :starts_at

  ##
  # current
  scope :current, -> { where("starts_at <= :now AND ends_at >= :now", now: Time.now) }

  rails_admin do
    configure :message, :text
    configure :starts_at, :datetime
    configure :ends_at, :datetime

    list do
      field :message
      field :starts_at
      field :ends_at
    end

    edit do
      field :starts_at
      field :ends_at
      field :message, :text do
        bootstrap_wysihtml5 true
      end
    end
  end
end
