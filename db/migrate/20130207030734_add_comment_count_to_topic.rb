class AddCommentCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :comments_count, :integer, default: 0
  end
end
