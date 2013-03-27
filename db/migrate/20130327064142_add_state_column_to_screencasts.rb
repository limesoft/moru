class AddStateColumnToScreencasts < ActiveRecord::Migration
  def change
    add_column :screencasts, :state, :string, limit: 50
    add_column :screencasts, :ends_at, :datetime
    add_column :screencasts, :comments_count, :integer, default: 0

    add_column :screencasts, :user_id, :integer
    add_index :screencasts, :user_id
  end
end
