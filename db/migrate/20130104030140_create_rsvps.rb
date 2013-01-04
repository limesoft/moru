class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :going
      t.references :user
      t.references :event

      t.timestamps
    end
  end
end
