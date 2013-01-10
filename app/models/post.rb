class Post < ActiveRecord::Base
  attr_accessible :comments_count, :content, :title
end
