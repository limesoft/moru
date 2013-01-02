class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
