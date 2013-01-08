class AddDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date, :datetime
  end
end
