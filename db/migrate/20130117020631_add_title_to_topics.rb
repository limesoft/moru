class AddTitleToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :title, :string, limit: 100
  end
end
