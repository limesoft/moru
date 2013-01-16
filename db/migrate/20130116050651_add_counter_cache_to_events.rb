class AddCounterCacheToEvents < ActiveRecord::Migration
  def change
    add_column :events, :comments_count, :integer, default: 0
  end
end
