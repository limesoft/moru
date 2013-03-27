class Screencast < ActiveRecord::Base
  attr_accessible :content, :starts_at, :title, :url
end
