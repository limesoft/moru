# encoding: utf-8

class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at

  ##
  # current
  scope :current, -> { where("starts_at <= :now AND ends_at >= :now", now: Time.now) }
end
