# encoding: utf-8

require 'spec_helper'

describe Announcement do
  it "has current scope" do
    passed = Announcement.create!(starts_at: 1.day.ago, ends_at: 1.hour.ago)
    current = Announcement.create!(starts_at: 1.hour.ago, ends_at: 1.hour.from_now)
    upcoming = Announcement.create!(starts_at: 1.day.ago, ends_at: 1.hour.ago)
    Accouncement.current.should eq current
  end
end
