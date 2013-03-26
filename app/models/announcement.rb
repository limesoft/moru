# encoding: utf-8

class Announcement < ActiveRecord::Base

  validates_presence_of :message, :starts_at, :ends_at

  ##
  # current
  def self.current(hidden_ids=nil)
    result = where("starts_at <= :now AND ends_at >= :now", now: Time.zone.now)
    result = result.where("id NOT IN (?)", hidden_ids) if hidden_ids.present?
    result
  end

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
