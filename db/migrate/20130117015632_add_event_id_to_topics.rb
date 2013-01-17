class AddEventIdToTopics < ActiveRecord::Migration
  def change
    change_table :topics do |t|
      t.references :event
    end
  end
end
